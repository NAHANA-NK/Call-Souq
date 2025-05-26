// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import '../../../resources/sharedpreferance.dart';
import '../Resources/model/otpmodel.dart';
import '../Resources/model/tokenmodel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  late  String tempToken;
  late  String Token;
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();

  void checkLoginStatus() async {
    emit(LoginStatusLoading());
    final url = "https://callsouq-api.foxa.in/api/auth/login/";
    final response = await http.post(Uri.parse(url),
        body: {"identifier": "jasalhamsa2@gmail.com",
          "password": "12345678"}
        // body: {"identifier": emailController.text.trim(),
        //   "password": passwordController.text.trim()}
    );

    if (response.statusCode == 200) {
      print("1 st OK");
      final data =otpModelFromJson(response.body);
      tempToken = data.data.token;
      print(tempToken);
      // emit();
      emit(LoginStatusLoaded());
    } else {
      // final data =jsonDecode(response.body);
      // final problem =data["message"];
      print("error");
      emit(LoginStatusError());
    }
  }


  final TextEditingController otpController = TextEditingController();

  Future<void> getMainToken()async{
    final url = "https://callsouq-api.foxa.in/api/two-step-verification/";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"otp": otpController.text},
        headers: {
          "Authorization": "Token $tempToken",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print("2 Nd Ok");
        final data = tokenModelFromJson(response.body);
        Token = data.data.token;

        await initPrefs();
        await setPrefs(Token);

        emit(MainTokenLoaded());
      } else {
        emit(MainTokenError());
      }
    } catch (e) {
      emit(MainTokenError());
    }
  }





  Ticker? _ticker;
  int _resendTime = 60;

  void startTimer() {
    _ticker?.dispose(); // Dispose old ticker if any
    _resendTime = 60; // Reset timer to 30 seconds
    emit(TimerStartedState(_resendTime)); // Emit the initial state

    int lastElapsedSeconds = 0; // Track the last second update
    _ticker = Ticker((Duration elapsed) {
      // Check if one full second has passed
      int elapsedSeconds = elapsed.inSeconds;

      // Only update once every second
      if (elapsedSeconds > lastElapsedSeconds) {
        lastElapsedSeconds = elapsedSeconds;

        if (_resendTime > 0) {
          _resendTime--;
          emit(TimerStartedState(_resendTime)); // Emit the state
        } else {
          stopTimer();
          emit(
              TimerStoppedState()); // Stop the timer once the countdown is over
        }
      }
    });

    _ticker?.start(); // Start the Ticker
  }

  void stopTimer() {
    _ticker?.dispose();
    emit(TimerStoppedState());
  }

  @override
  Future<void> close() {
    _ticker?.dispose();
    return super.close();
  }
}