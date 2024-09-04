part of 'order_cubit_cubit.dart';

@immutable
sealed class OrderCubitState {}

final class OrderCubitInitial extends OrderCubitState {}
class OrderCubitLoading extends OrderCubitState {}
final class OrderCubitFailure extends OrderCubitState {
  final String errorMessage;

  OrderCubitFailure(this.errorMessage);
}
final class OrderCubitSuccess extends OrderCubitState {
 
}