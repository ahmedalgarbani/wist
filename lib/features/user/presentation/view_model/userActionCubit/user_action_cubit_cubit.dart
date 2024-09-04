import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_action_cubit_state.dart';

class UserActionCubitCubit extends Cubit<UserActionCubitState> {
  UserActionCubitCubit() : super(UserActionCubitInitial());
}
