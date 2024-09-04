import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_route.dart';
class SignupLink extends StatelessWidget {
  const SignupLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        children: [
          const Text(
            "Don’t have an account?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.KRegisterRouter);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}