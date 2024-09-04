import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/main_button_designed.dart';
import 'package:wist/core/widgets/maincard.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

class AdminBlock extends StatefulWidget {
  const AdminBlock({super.key});

  @override
  State<AdminBlock> createState() => _AdminBlockState();
}

class _AdminBlockState extends State<AdminBlock> {

    List<UserModel> users = [];
void initState() {
    BlocProvider.of<SessionusercubitCubit>(context).getAllUsers();
    users = BlocProvider.of<SessionusercubitCubit>(context).allUser!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return GlobalCardOrders(user: users[index],type:"users",);
        },
      ),
    );
  }
}
