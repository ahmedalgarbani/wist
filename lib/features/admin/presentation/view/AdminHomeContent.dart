import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_state.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/maincard.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class AdminHomeContent extends StatefulWidget {
  const AdminHomeContent({super.key});

  @override
  State<AdminHomeContent> createState() => _AdminHomeContentState();
}

class _AdminHomeContentState extends State<AdminHomeContent> {
  List<Ordermodel> orders = [];
  UserModel? user;

  @override
  void initState() {
    BlocProvider.of<OrderCubit>(context).getAllOrders();
    orders = BlocProvider.of<OrderCubit>(context).orders;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return FutureBuilder<UserModel?>(
              future: BlocProvider.of<SessionusercubitCubit>(context)
                  .getUserById(id: orders[index].user_id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('User not found');
                } else {
                  final user = snapshot.data!;
                  return GlobalCardOrders(
                    order: orders[index],
                    user: user,
                    type: "order",
                    onContinue: () {
                      GoRouter.of(context).push(AppRoute.KAdminBlock);
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
