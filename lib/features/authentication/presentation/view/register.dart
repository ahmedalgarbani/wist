import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/utils/helperfun.dart';
import 'package:wist/core/widgets/input_form_field.dart';
import 'package:wist/core/widgets/main_button_designed.dart';
import 'package:wist/core/widgets/selectItem.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/authentication/presentation/view/widget/uploadImage.dart';
import 'package:wist/features/authentication/presentation/view_model/authentication_cubmit_cubit/authentication_cubmit_cubit.dart';

class Register extends StatelessWidget {
  Register({super.key});
  static String id = "register";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  int CINC = 0;
  String fullName = '';
  String address = '';
  int phoneNumber = 0;
  int role=2;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Image.asset(
                      "assets/image/register.png",
                      fit: BoxFit.fill,
                      height: 200,
                      width: 250,
                    ),
                    const SizedBox(height: 22),
                    InputFormField(
                      inputContent: "enter your email",
                      prefixIcon: Icon(Icons.email_outlined,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormField(
                      inputContent: "Full Name",
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      onChanged: (value) {
                        fullName = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormField(
                      inputContent: "Phone number",
                      prefixIcon: Icon(Icons.phone_enabled,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      type: TextInputType.number,
                      onChanged: (value) {
                        phoneNumber = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormField(
                      inputContent: "CNIC Number",
                      prefixIcon: Icon(Icons.credit_score_outlined,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      type: TextInputType.number,
                      onChanged: (value) {
                        CINC = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormField(
                      inputContent: "Password",
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      suffixIcon:
                          Icon(Icons.visibility_off, color: Colors.white),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputFormField(
                      inputContent: "Address",
                      onChanged: (value) {
                        address = value;
                      },
                      prefixIcon: Icon(Icons.location_on_outlined,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectFormField(
                      inputContent: "Select Type",
                      onChanged: (value) {
                        role = value!;
                        print(role);
                      },
                      prefixIcon:
                          Icon(Icons.select_all_outlined, color: Colors.white),
                      items: [
                        {'label': 'user', 'value': 0},
                        {'label': 'admin', 'value': 1},
                        {'label': 'driver', 'value': 2}
                      ],
                      value: role,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 10),
                    UploadIDWidget(),
                    const SizedBox(height: 10),
                    MainButtonDesign(
                      ButtonContent: "Submit",
                      onPressed: () => registerUser(context),
                    ),
                    _buildLoginRow(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Align(
      child: Row(
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).push(AppRoute.KMainPage),
            child: Text(
              "login",
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

  void registerUser(context) {
    try {
      if (email.isEmpty ||
          password.isEmpty ||
          fullName.isEmpty ||
          address.isEmpty ||
          CINC == 0 ||
          phoneNumber == 0) {
        MessageSnackBar(context, "No field can be empty!");
        return;
      } else {
        BlocProvider.of<AuthenticationCubmitCubit>(context).registerCubit(
            email: email,
            password: password,
            fullName: fullName,
            address: address,
            cinc: CINC,
            role: role,
            phoneNumber: phoneNumber,
            context: context);
                  GoRouter.of(context).pushReplacement(AppRoute.KMainPage);

      }
    } catch (e) {
      print(e);
    }

    GoRouter.of(context).push(AppRoute.KMainPage);
  }

  // void _onSubmit(context) async {
  //   try {
  //     await registerUser(context);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       MessageSnackBar(context, "Weak password");
  //     } else if (e.code == 'email-already-in-use') {
  //       MessageSnackBar(context, "Email already in use");
  //     }
  //   } catch (e) {
  //     MessageSnackBar(context, e.toString());
  //   }
  // }
}
