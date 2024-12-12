import 'package:auto_route/auto_route.dart';
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
                  page: StartRoute.page,
                  children: [
                    AutoRoute(page: TasksRoute.page),
                    AutoRoute(page: MyAnimalsRoute.page),
                    AutoRoute(page: ProfileRoute.page),
                    AutoRoute(page: CalendarRoute.page),
                  ],
                ),
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
