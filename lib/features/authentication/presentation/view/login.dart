import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/utils/helperfun.dart';
import 'package:wist/core/widgets/input_form_field.dart';
import 'package:wist/core/widgets/main_button_designed.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/authentication/presentation/view/widget/LoginImage.dart';
import 'package:wist/features/authentication/presentation/view/widget/forgetPassword.dart';
import 'package:wist/features/authentication/presentation/view/widget/loginTitle.dart';
import 'package:wist/features/authentication/presentation/view/widget/signuplink.dart';
import 'package:wist/features/authentication/presentation/view_model/authentication_cubmit_cubit/authentication_cubmit_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';

  String password = '';
  @override
  void initState() {
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginTitle(),
                const SizedBox(height: 50),
                const LoginImage(),
                const SizedBox(height: 22),
                InputFormField(
                  inputContent: "Enter your email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  onChanged: (e) => email = e,
                ),
                const SizedBox(height: 10),
                InputFormField(
                  inputContent: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
                  onChanged: (p) {
                    password = p;
                  },
                ),
                const SizedBox(height: 10),
                const ForgotPassword(),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    await _login(context);
                  },
                  child: MainButtonDesign(
                    ButtonContent: "Submit",
                  ),
                ),
                const SizedBox(height: 10),
                const SignupLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    try {
      BlocProvider.of<AuthenticationCubmitCubit>(context)
          .loginCubit(email: email, password: password, context: context);
    } catch (e) {
      print(e);
      MessageSnackBar(context, "An error occurred. Please try again.");
    }
  }
}
