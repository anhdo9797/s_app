import 'package:s_app/modules/main/main_view.dart';
import 'package:s_app/modules/onboard/onboard_view.dart';
import 'package:s_app/modules/splash/splash_view.dart';
import 'package:s_app/routes/routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _appRouter = AppRouter._internal();

  factory AppRouter() {
    return _appRouter;
  }

  AppRouter._internal();

  static final GoRouter routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: <GoRoute>[
      GoRoute(
        path: APP_PAGE.splash.toPath,
        name: APP_PAGE.splash.toName,
        builder: (context, GoRouterState state) => const SplashView(),
      ),
      GoRoute(
        path: APP_PAGE.onboard.toPath,
        name: APP_PAGE.onboard.toName,
        builder: (context, GoRouterState state) => const OnboardView(),
      ),
      mainRouter
    ],
  );

  static final mainRouter = GoRoute(
    path: APP_PAGE.main.toPath,
    name: APP_PAGE.main.toName,
    builder: (context, GoRouterState state) => const MainView(),
  );
}
