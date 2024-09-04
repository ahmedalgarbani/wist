import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/utils/helperfun.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

part 'authentication_cubmit_state.dart';

class AuthenticationCubmitCubit extends Cubit<AuthenticationCubmitState> {
  AuthenticationCubmitCubit() : super(AuthenticationCubmitInitial());

  void loginCubit({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      MessageSnackBar(context, "Email or Password cannot be empty!");
      return;
    }

    try {
      final db = AbmulanceDatabase();
      final userDao = await db.userDao();
      UserModel? authUser =
          await userDao.retrieveUser(email: email, password: password);
      if (authUser != null && authUser.role != null) {
        BlocProvider.of<SessionusercubitCubit>(context).serUser(authUser);
        emit(AuthenticationSuccess(authUser));

        switch (authUser.role) {
          case 0:
            _redirectTo(UserAuthType(), context);
            break;
          case 1:
            _redirectTo(AdminAuthType(), context);
            break;
          case 2:
            _redirectTo(DriverAuthType(), context);
            break;
          default:
            print("Unknown role");
        }
      } else {
        emit(AuthenticationFailure("Invalid email or password!"));
        MessageSnackBar(context, "Invalid email or password!");
      }
    } catch (e) {
      emit(AuthenticationFailure("An error occurred during login."));
      MessageSnackBar(context, "An error occurred during login.");
    }
  }

  void registerCubit({
    required String email,
    required String password,
    required String fullName,
    required String address,
    required int cinc,
    required int role,
    required int phoneNumber,
    required BuildContext context,
  }) async {
    emit(AuthenticationLoading());

    try {
      final db = AbmulanceDatabase();
      final userDao = await db.userDao();
      final user = UserModel(
        email: email,
        password: password,
        fullName: fullName,
        address: address,
        cinc: cinc,
        role: role,
        userStatus: UserAuthType.id,
        phoneNumber: phoneNumber.toString(),
      );

      await userDao.insertUser(user);
      emit(AuthenticationSuccess(user));
    } catch (e) {
      emit(AuthenticationFailure("Something went wrong."));
      MessageSnackBar(context, "Something went wrong.");
    }
  }

  void _redirectTo(AuthType authType, BuildContext context) {
    authType.redirectTo(context);
  }
}
