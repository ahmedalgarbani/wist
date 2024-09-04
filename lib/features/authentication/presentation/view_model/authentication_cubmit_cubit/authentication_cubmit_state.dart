part of 'authentication_cubmit_cubit.dart';

@immutable
sealed class AuthenticationCubmitState {}

final class AuthenticationCubmitInitial extends AuthenticationCubmitState {}
class AuthenticationLoading extends AuthenticationCubmitState {}
final class AuthenticationFailure extends AuthenticationCubmitState {
  final String errorMessage;

  AuthenticationFailure(this.errorMessage);
}
final class AuthenticationSuccess extends AuthenticationCubmitState {
  final UserModel user;

  AuthenticationSuccess(this.user);
}
