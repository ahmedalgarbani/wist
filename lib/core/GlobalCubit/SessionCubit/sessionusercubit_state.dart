import 'package:flutter/foundation.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

@immutable
sealed class SessionusercubitState {}

final class SessionusercubitInitial extends SessionusercubitState {}

final class SessionusercubLogined extends SessionusercubitState {
  final UserModel user;

  SessionusercubLogined({required this.user});
}

final class SessionusercubNotLogined extends SessionusercubitState {}

final class SessionusercubSuccess extends SessionusercubitState {

}

final class SessionusercubFailure extends SessionusercubitState {
  final String errorMessage;

  SessionusercubFailure({required this.errorMessage});
}

final class SessionusercubLoading extends SessionusercubitState {}
