import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/core/GlobalCubit/OrderCubit/order_cubit_cubit.dart';
import 'package:wist/core/routing/app_route.dart';
import 'package:wist/core/GlobalCubit/SessionCubit/sessionusercubit_cubit.dart';
import 'package:wist/features/authentication/presentation/view/login.dart';
import 'package:wist/features/authentication/presentation/view_model/authentication_cubmit_cubit/authentication_cubmit_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BlocProvider(
    create: (context) => SessionusercubitCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(create: (BuildContext context) => SessionusercubitCubit()),
        BlocProvider(create: (BuildContext context) => AuthenticationCubmitCubit()),
        BlocProvider(create: (BuildContext context) => OrderCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerConfig: AppRoute.router,
      ),
    );
  }
}
