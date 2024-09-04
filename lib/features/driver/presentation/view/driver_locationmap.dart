import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/main_button_designed.dart';

class DriverLocationmap extends StatelessWidget {
  const DriverLocationmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 33, left: 20, right: 20, bottom: 20),
          child: Center(
            child: Column(
              children: [
                HeaderAmbulance(
                  HeaderImage: KMainImage,
                  TitleString: "DRIVER",
                ),
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kPrimaryColor, width: 2),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ContainerWithImg(
                        ContainerContent: "Complete",
                        icon: Icons.check,
                        height: 55,
                        space: MainAxisAlignment.center,
                        onPressed: () {
                          GoRouter.of(context).push(AppRoute.KAllCalls);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
