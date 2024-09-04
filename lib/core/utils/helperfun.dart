import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_state.dart';

void MessageSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

bool isLoggedIn(BuildContext context) {
  final sessionUserCubit = BlocProvider.of<SessionusercubitCubit>(context);
  return sessionUserCubit.state is SessionusercubNotLogined;
}
