import 'package:go_router/go_router.dart';
import 'package:wist/core/utils/helperfun.dart';
import 'package:wist/features/admin/presentation/view/admin_block.dart';
import 'package:wist/features/admin/presentation/view/admin_home.dart';
import 'package:wist/features/admin/presentation/view/admin_user.dart';
import 'package:wist/features/authentication/presentation/view/login.dart';
import 'package:wist/features/authentication/presentation/view/register.dart';
import 'package:wist/features/driver/presentation/view/driver_locationmap.dart';
import 'package:wist/features/driver/presentation/view/driver_pending.dart';
import 'package:wist/features/user/presentation/view/BookAnAmbulance.dart';
import 'package:wist/features/user/presentation/view/all_calls.dart';
import 'package:wist/features/user/presentation/view/locationmap.dart';
import 'package:wist/features/user/presentation/view/profile.dart';

abstract class AppRoute {
  static const KHomePageRouter = "/HomePageRouter";
  static const KLoginRouter = "/loginPageRouter";
  static const KMainPage = "/";
  static const KRegisterRouter = "/RegisterRouter";
  static const KBookAnAmbulance = "/BookAnAmbulance";
  static const KLocationMap = "/LocationMap"; 
  static const KAllCalls = "/AllCalls"; 
  static const KDriverPending = "/DriverPending"; 
  static const KDriverlocation = "/Driverlocation"; 
  static const KProfile = "/Profile"; 
  static const KAminHome = "/adminHome"; 
  static const KAdminUser = "/adminuser";  
  static const KAdminBlock = "/adminblock"; 

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KMainPage,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: KRegisterRouter,
        builder: (context, state) => Register(),
      ),
      GoRoute(
        path: KBookAnAmbulance,
        builder: (context, state) => const BookAnAmbulance(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KLocationMap,
        builder: (context, state) => Locationmap(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KAllCalls,
        builder: (context, state) => const AllCalls(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KDriverPending,
        builder: (context, state) => const DriverPending(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KDriverlocation,
        builder: (context, state) => const DriverLocationmap(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KProfile,
        builder: (context, state) => const Profile(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KAminHome,
        builder: (context, state) => AdminHome(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
    GoRoute(
        path: KAdminUser,
        builder: (context, state) =>  AdminUser(),
        redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
      GoRoute(
        path: KAdminBlock,
        builder: (context, state) =>  AdminBlock(),
    redirect: (context, state) => isLoggedIn(context) ? null : KMainPage,
      ),
    ],
  );
}
