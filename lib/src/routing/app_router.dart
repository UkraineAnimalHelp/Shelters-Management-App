import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: AuthGuard.page,
          children: [
            CustomRoute(
              page: MainFlow.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              children: [
                AutoRoute(
                  initial: true,
                  guards: [HomeScreenGuard()],
                  page: StartRoute.page,
                  children: [
                    AutoRoute(page: TasksRoute.page),
                    AutoRoute(page: MyAnimalsRoute.page),
                    AutoRoute(page: ProfileRoute.page),
                    AutoRoute(page: CalendarRoute.page),
                  ],
                ),
                AutoRoute(page: OrganizationRoute.page),
              ],
            ),
            AutoRoute(
              page: AuthFlow.page,
              children: [
                AutoRoute(initial: true, page: AuthRoute.page),
                AutoRoute(page: SignInRoute.page),
                AutoRoute(page: RegisterNameRoute.page),
                AutoRoute(page: RegisterMailRoute.page),
              ],
            ),
          ],
        ),
      ];
}

class HomeScreenGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final organizationId = getIt<AppKeyValueStorage>().getOrganizationId();

    if (organizationId != null && organizationId.isNotEmpty) {
      resolver.next(true);
    } else {
      resolver.redirect(
        OrganizationRoute(onOrganizationCreated: resolver.next),
      );
    }
  }
}
