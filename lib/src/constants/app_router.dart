import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    // HomeScreen is generated as HomeRoute because
    // of the replaceInRouteName property
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: EmployeeRegistrationRoute.page),
    AutoRoute(page: JoinOrRegisterOrganizationRoute.page),
    AutoRoute(page: RegisterOrganizationRoute.page),
    AutoRoute(page: JoinOrganizationRoute.page),
  ];
}
