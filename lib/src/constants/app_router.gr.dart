// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i2;
import 'package:uah_shelters/src/ui/screens/login_screen.dart' as _i4;
import 'package:uah_shelters/src/ui/screens/registration/employee_registration_screen.dart'
    as _i1;
import 'package:uah_shelters/src/ui/screens/registration/join_or_reg_org_screen.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EmployeeRegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeRegistrationRouteArgs>(
          orElse: () => const EmployeeRegistrationRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EmployeeRegistrationScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    JoinOrRegisterOrganizationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.JoinOrRegisterOrganizationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmployeeRegistrationScreen]
class EmployeeRegistrationRoute
    extends _i5.PageRouteInfo<EmployeeRegistrationRouteArgs> {
  EmployeeRegistrationRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          EmployeeRegistrationRoute.name,
          args: EmployeeRegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeeRegistrationRoute';

  static const _i5.PageInfo<EmployeeRegistrationRouteArgs> page =
      _i5.PageInfo<EmployeeRegistrationRouteArgs>(name);
}

class EmployeeRegistrationRouteArgs {
  const EmployeeRegistrationRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'EmployeeRegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.JoinOrRegisterOrganizationScreen]
class JoinOrRegisterOrganizationRoute extends _i5.PageRouteInfo<void> {
  const JoinOrRegisterOrganizationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          JoinOrRegisterOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrRegisterOrganizationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
