import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../resources/sharedpreferance.dart';

// import '../../../Resources/SharedPrefrence.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()){
    _CheckLoginStatus();
  }


  Future<void> _CheckLoginStatus() async{
    await Future.delayed(Duration(seconds: 2));
    emit(SplashLoading());
    await initPrefs();
    final token = getPrefs();
    if (token != null && token.isNotEmpty  ) {
      emit(IsLoggedIn(token: token));
    } else {
      emit(IsNotLogged());

    }
  }

}