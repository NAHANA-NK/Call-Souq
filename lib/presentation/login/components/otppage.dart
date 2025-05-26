import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../profile/components/profile.dart';
import '../logincubit/login_cubit.dart';

class OtpPage extends StatelessWidget {
  OtpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    if (cubit.state is! TimerStartedState) {
      cubit.startTimer();
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is MainTokenLoaded) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Homescreen(token: cubit.Token)),
                  );
                }
                if (state is MainTokenError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP verification failed!")),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Please enter the OTP sent to your \n email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                  TextFormField(
                    controller: cubit.otpController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      hintText: "Enter OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  // Separated Timer BlocBuilder (only this part will rebuild)
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                    current is TimerStartedState ||
                        current is TimerStoppedState,
                    builder: (context, state) {
                      if (state is TimerStartedState) {
                        return Text(
                          "Time remaining: ${state.resendTime} ",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        );
                      } else if (state is TimerStoppedState) {
                        return Text(
                          "Time is Out! Resend the OTP",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),

                  SizedBox(height: 5),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          state is TimerStoppedState?null:cubit.getMainToken();
                        },
                        child: Container(
                          width: 280,
                          height: 50,
                          decoration: BoxDecoration(
                            color:state is TimerStoppedState? Colors.grey:Color(0xff47BA82),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child:
                              Text(
                                "Verify OTP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          if (cubit.state is TimerStoppedState) {
                            context.read<LoginCubit>().checkLoginStatus();
                            context.read<LoginCubit>().startTimer();
                          }
                        },
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: state is TimerStoppedState
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.stopTimer();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}