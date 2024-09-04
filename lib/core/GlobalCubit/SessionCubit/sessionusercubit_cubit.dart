import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_state.dart';
import 'package:wist/core/db/DataBase.dart';
import 'package:wist/features/authentication/Data/models/userModel.dart';


class SessionusercubitCubit extends Cubit<SessionusercubitState> {
  SessionusercubitCubit() : super(SessionusercubitInitial());

  UserModel? authUser;
  UserModel? user;
  List<UserModel>? allUser;

  void serUser(UserModel user) async {
    authUser = await user;
    emit(SessionusercubLogined(user: authUser!));
  }

  void getAllUsers() async {
    final db = AbmulanceDatabase();
    final userDao = await db.userDao();
    allUser = await userDao.retrieveUsers();
    emit(SessionusercubSuccess());
    emit(SessionusercubLoading( ));
   
  }

  Future<UserModel?> getUserById({required int id}) async {
    try {
      final db = AbmulanceDatabase();
      final userDao = await db.userDao();
      user = await userDao.getUserById(id: id);
      emit(SessionusercubSuccess());

      return user;
    } catch (e) {
      return null;
    }
  }

  void clearUser() {
    emit(SessionusercubSuccess());

    emit(SessionusercubNotLogined());
  }
}
