import 'package:ecommerce_app/core/utils/routes.dart';
import 'package:ecommerce_app/core/utils/themes.dart';
import 'package:ecommerce_app/features/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthEventInitial()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        )
      ],
      child: MaterialApp.router(
        routerDelegate: Approute().router.routerDelegate,
        routeInformationProvider: Approute().router.routeInformationProvider,
        routeInformationParser: Approute().router.routeInformationParser,
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
      ),
    );
  }
}
