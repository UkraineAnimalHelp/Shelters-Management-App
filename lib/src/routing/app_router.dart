import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: EmployeeRegistrationRoute.page),
        AutoRoute(page: JoinOrRegisterOrganizationRoute.page),
        AutoRoute(page: RegisterOrganizationRoute.page),
        AutoRoute(page: JoinOrganizationRoute.page),
      ];
}
