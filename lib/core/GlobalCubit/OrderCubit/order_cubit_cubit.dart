import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/core/enums.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/features/user/Data/models/orderModel.dart';

part 'order_cubit_state.dart';

class OrderCubit extends Cubit<OrderCubitState> {
  OrderCubit() : super(OrderCubitInitial());
  List<Ordermodel> orders = [];
  Ordermodel orderInformation = Ordermodel();

  void bookCase({
    required BuildContext context,
    required String AmublanceName,
    required String lac,
    required String lat,
    required int orderStatus,
    required int user_id,
  }) async {
    try {
      
      final db = AbmulanceDatabase();
      final OrderDao = await db.orderDao();
      final order = Ordermodel(
        Ambulance: AmublanceName,
        lac:lac,
        lat: lat,
        orderStatus: orderStatus,
        user_id: user_id
      );
      await OrderDao.insertOrder(order);
      emit(OrderCubitSuccess());
    } catch (e) {
      print(e);
      emit(OrderCubitFailure("something went wrong"));
    }
       getUserOrders(user_id: user_id);
    GoRouter.of(context).push(AppRoute.KAllCalls);
  }

  void getUserOrders({int? user_id}) async {
    final db = AbmulanceDatabase();
    final orderDao = await db.orderDao();
    emit(OrderCubitLoading());
     orders = await orderDao.retrieveOrdersuser(user_id: user_id.toString());
    emit(OrderCubitSuccess());
  }
  void getAllOrders() async {
    final db = AbmulanceDatabase();
    final orderDao = await db.orderDao();
    emit(OrderCubitLoading());
     orders = await orderDao.retrieveOrders();
    emit(OrderCubitSuccess());
  }
}
