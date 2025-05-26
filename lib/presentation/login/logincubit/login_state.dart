part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {

}
final class LoginStatusLoading extends LoginState {}
final class LoginStatusLoaded extends LoginState {
}

final class LoginStatusError extends LoginState {

  // final String problem;
  // LoginStatusError({required this.problem});

}

//OTP timer
final class TimerStartedState extends LoginState {
  final int resendTime;
  TimerStartedState(this.resendTime);}
final class TimerStoppedState extends LoginState {}

final class MainTokenLoading extends LoginState {}
final class MainTokenLoaded extends LoginState {
}
final class MainTokenError extends LoginState {}