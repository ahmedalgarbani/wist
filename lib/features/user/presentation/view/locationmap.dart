import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/core/db/OrderModel.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/core/widgets/container_with_img.dart';
import 'package:wist/core/widgets/main_button_designed.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

class Locationmap extends StatefulWidget {
  Locationmap({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(15.266475, 44.241162),
    zoom: 14.4746,
  );

  @override
  State<Locationmap> createState() => _LocationmapState();
}

class _LocationmapState extends State<Locationmap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Center(
              child: Column(
                children: [
                  HeaderAmbulance(
                    HeaderImage: KMainImage,
                    TitleString: "BOOK AN AMBULANCE",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Major",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          Switch(
                            inactiveTrackColor: Colors.white,
                            value: false,
                            onChanged: (bool value) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Minor",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          Switch(
                            inactiveTrackColor: Colors.white,
                            value: false,
                            onChanged: (bool value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kPrimaryColor, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: Locationmap._kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ContainerWithImg(
                        ContainerContent: "BOOK CASE",
                        icon: Icons.location_on,
                        width: 230,
                        onPressed: () {
                          bookCase();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ContainerWithImg(
                          icon: Icons.upload_sharp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void bookCase() async {
    try {
      String AmublanceName =
          BlocProvider.of<OrderCubit>(context).orderInformation.Ambulance!;
      BlocProvider.of<OrderCubit>(context).bookCase(
          context: context,
          AmublanceName: AmublanceName,
          lac: "145",
          lat: "15",
          orderStatus: 0,
          user_id:
              BlocProvider.of<SessionusercubitCubit>(context).authUser!.id!);
          

    } catch (e) {
      print(e);
    }

    GoRouter.of(context).push(AppRoute.KAllCalls);
  }
}
