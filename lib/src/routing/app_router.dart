import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: RegisterNameRoute.page),
        AutoRoute(page: RegisterMailRoute.page),
        AutoRoute(
          page: StartRoute.page,
          guards: [AuthGuard()],
          initial: true,
          children: [
            AutoRoute(page: TasksRoute.page),
            AutoRoute(page: MyAnimalsRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: CalendarRoute.page),
          ],
        ),
      ];

  // @override
  // late final List<AutoRouteGuard> guards = [
  //   AutoRouteGuard.simple(
  //     (resolver, router) {
  //       final isAuthenticated = getIt<AuthService>().isUserLoggedIn;
  //       if (isAuthenticated || resolver.routeName == LoginRoute.name) {
  //         // we continue navigation
  //         resolver.next();
  //       } else {
  //         // else we navigate to the Login page so we get authenticated

  //         // tip: use resolver.redirect to have the redirected route
  //         // automatically removed from the stack when the resolver is completed
  //         resolver.redirect(
  //             LoginRoute(onResult: (didLogin) => resolver.next(didLogin)));
  //       }
  //     },
  //   ),
  //   // add more guards here
  // ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isUserLoggedIn = getIt<AuthService>().isUserLoggedIn;
    if (isUserLoggedIn) {
      resolver.next(true);
      return;
    }
    router.replaceAll([const AuthRoute()]);
  }
}
