import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/widgets/maincard.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';

class AdminUser extends StatefulWidget {
  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  List<UserModel> users = [];
  @override
  void initState() {
    BlocProvider.of<SessionusercubitCubit>(context).getAllUsers();
    users = BlocProvider.of<SessionusercubitCubit>(context).allUser!;
    super.initState();
  }

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
