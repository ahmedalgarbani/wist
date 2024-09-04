import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_state.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<SessionusercubitCubit, SessionusercubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SessionusercubLoading) {
            UserModel AuthUser =
                BlocProvider.of<SessionusercubitCubit>(context).authUser!;
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/image/profile.png",
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${AuthUser.fullName}",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        """
              ${AuthUser.phoneNumber ?? ""}
              ${AuthUser.cinc}
              ${AuthUser.email}
              ${AuthUser.address}""",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "YOUR CINC",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                      Image.asset(
                        "assets/image/idcard.png",
                        width: 362,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ContainerWithImg(
                        icon: Icons.logout,
                        space: MainAxisAlignment.center,
                        onPressed: () {
                          BlocProvider.of<SessionusercubitCubit>(context)
                              .clearUser();
                          GoRouter.of(context)
                              .pushReplacement(AppRoute.KMainPage);
                        },
                        ContainerContent: "LOGOUT",
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text("notFound"),
            );
          }
        },
      ),
    );
  }
}
