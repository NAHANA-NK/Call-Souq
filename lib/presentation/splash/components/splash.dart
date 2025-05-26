import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginss/presentation/splash/cubit/splash_cubit.dart';

import '../../login/components/login.dart';
import '../../profile/components/profile.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if(state is IsLoggedIn){
              WidgetsBinding.instance.addPostFrameCallback((_){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Homescreen(token: state.token),));
              });
            }else if(state is IsNotLogged){
              WidgetsBinding.instance.addPostFrameCallback((_){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Loginscreen(),));
              });
            }
          },
          child: BlocBuilder<SplashCubit, SplashState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image(image: AssetImage("assets/logo.png")),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}