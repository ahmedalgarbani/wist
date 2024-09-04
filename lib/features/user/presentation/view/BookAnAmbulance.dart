import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/utils/helperfun.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/main_button_designed.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class BookAnAmbulance extends StatelessWidget {
  const BookAnAmbulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Center(
            child: Column(
              children: [
                HeaderAmbulance(
                  TitleString: "BOOK AN AMBULANCE",
                  HeaderImage: KMainImage,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 370,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: AmublanceMap.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                         Ordermodel vv = BlocProvider.of<OrderCubit>(context)
                              .orderInformation;
                       
                              vv.Ambulance = AmublanceMap[index]["value"];

                          GoRouter.of(context).push(AppRoute.KLocationMap);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: kPrimaryColor, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Image.asset(
                                "assets/image/user/${AmublanceMap[index]["title"]}.png",
                                width: 151,
                                height: 173,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                MainButtonDesign(
                  ButtonContent: "211 Call",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        ContainerWithImg(
                          ContainerContent: "MY RECORD",
                          icon: Icons.file_copy_sharp,
                          width: 150,
                          fontsize: 15,
                          onPressed: () {
                            GoRouter.of(context).push(AppRoute.KAllCalls);
                          },
                        ),
                        Positioned(
                            right: 5,
                            top: -10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                    ContainerWithImg(
                      ContainerContent: "PROFILE",
                      icon: Icons.person,
                      width: 150,
                      fontsize: 15,
                      onPressed: () {
                        print(BlocProvider.of<SessionusercubitCubit>(context)
                            .state);
                        GoRouter.of(context).push(AppRoute.KProfile);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
