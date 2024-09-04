import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class GlobalCardOrders extends StatelessWidget {
  GlobalCardOrders(
      {super.key,
      this.order,
      this.user,
      this.type,
      this.onContinue,
      this.onCancel,
      this.onBlock});

  final Ordermodel? order;
  UserModel? user;
  String? type;
  final VoidCallback? onCancel;
  final VoidCallback? onContinue;
  final VoidCallback? onBlock;

  @override
  Widget build(BuildContext context) {
    Color orderStateColor;
    String orderStateText;
    String orderType;
    bool isAdmin =
        BlocProvider.of<SessionusercubitCubit>(context).authUser!.role == 1;
    bool isDriver =
        BlocProvider.of<SessionusercubitCubit>(context).authUser!.role == 2;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFFECECEC),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''Name:${user!.fullName ?? ""}
Phone: +${user!.phoneNumber ?? ""}
Address: ${user!.address ?? ""}
Type: ${user!.userStatus ?? ""}
Date: 2024/9/5''',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  if (isDriver || (type == "order" && isAdmin)) ...[
                    Row(
                      children: [
                        Expanded(
                          child: ContainerWithImg(
                            ContainerContent: "CONTINUE",
                            icon: Icons.arrow_back,
                            fontsize: 15,
                            onPressed: onContinue ?? () {},
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ContainerWithImg(
                            ContainerContent: "CANCEL",
                            icon: Icons.arrow_back,
                            fontsize: 15,
                            height: 50,
                            onPressed: onContinue ?? () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (isAdmin && type == "users") ...[
                    SizedBox(height: 10),
                    ContainerWithImg(
                      ContainerContent: "Block",
                      icon: Icons.block,
                      fontsize: 15,
                      height: 50,
                      space: MainAxisAlignment.center,
                      onPressed: onContinue ?? () {},
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 25,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Complete",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          height: 15,
          thickness: 3,
        ),
      ],
    );
  }
}
