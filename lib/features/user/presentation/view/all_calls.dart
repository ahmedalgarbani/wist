import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/maincard.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class AllCalls extends StatelessWidget {
  const AllCalls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderCubit, OrderCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OrderCubitInitial) {
            var user =
                BlocProvider.of<SessionusercubitCubit>(context).authUser;
            BlocProvider.of<OrderCubit>(context)
                .getUserOrders(user_id: user!.id);
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderCubitSuccess) {
             var user =
                BlocProvider.of<SessionusercubitCubit>(context).authUser;
            return _buildOrderList(
                BlocProvider.of<OrderCubit>(context).orders,user!);
          } else if (state is OrderCubitFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text("No orders yet"));
          }
        },
      ),
    );
  }

  Widget _buildOrderList(List<Ordermodel> orders,UserModel user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeaderAmbulance(
            HeaderImage: KMainImage,
            TitleString: "BOOK AN AMBULANCE",
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${orders[index].orderStatus}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GlobalCardOrders(order: orders[index],user: user,),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
