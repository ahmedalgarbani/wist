import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/maincard.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class DriverPending extends StatelessWidget {
  const DriverPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderCubit, OrderCubitState>(
        listener: (context, state) {
          if (state is OrderCubitSuccess) {}
        },
        builder: (context, state) {
          if (state is OrderCubitInitial) {
            BlocProvider.of<OrderCubit>(context).getAllOrders();
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderCubitSuccess) {
            return _buildOrderList(
                BlocProvider.of<OrderCubit>(context).orders, context);
          } else if (state is OrderCubitFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text("No orders yet"));
          }
        },
      ),
    );
  }

  Widget _buildOrderList(List<Ordermodel> orders, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeaderAmbulance(
            HeaderImage: KMainImage,
            TitleString: "BOOK AN AMBULANCE",
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return FutureBuilder<UserModel?>(
                future: BlocProvider.of<SessionusercubitCubit>(context)
                    .getUserById(id: orders[index].user_id!.toInt()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('user not Found'));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${orders[index].orderStatus}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GlobalCardOrders(
                          order: orders[index],
                          user: snapshot.data,
                          onContinue: () {
                            GoRouter.of(context).push(AppRoute.KDriverlocation);
                          },
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
