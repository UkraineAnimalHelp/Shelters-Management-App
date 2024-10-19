import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: StartRoute.page,
          initial: true,
          children: [
            AutoRoute(page: TasksRoute.page),
            AutoRoute(page: MyAnimalsRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: CalendarRoute.page),
          ],
        ),

        //for future use
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: JoinOrRegisterOrganizationRoute.page),
        AutoRoute(page: RegisterOrganizationRoute.page),
        AutoRoute(page: JoinOrganizationRoute.page),
        AutoRoute(page: EmployeeRegistrationRoute.page),
      ];
}
