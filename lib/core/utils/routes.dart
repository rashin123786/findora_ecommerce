import 'package:ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/screens/splash_screen.dart';
import 'package:ecommerce_app/shared/screens/api_error_screen.dart';
import 'package:go_router/go_router.dart';

class Approute {
  static final GoRouter _appRouter = GoRouter(
    initialLocation: '/splashScreen',
    routes: [
      GoRoute(
        path: '/splashScreen',
        name: 'splashScreen',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/loginScreen',
        name: 'loginScreen',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/apiErrorcreen',
        name: 'apiErrorcreen',
        builder: (context, state) => ApiErrorScreen(),
      ),
    ],
  );
  GoRouter get router => _appRouter;
}
