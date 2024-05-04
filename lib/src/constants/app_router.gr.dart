// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i2;
import 'package:uah_shelters/src/ui/screens/login_screen.dart' as _i4;
import 'package:uah_shelters/src/ui/screens/registration/employee_registration_screen.dart'
    as _i1;
import 'package:uah_shelters/src/ui/screens/registration/join_or_reg_org_screen.dart'
    as _i3;
import 'package:uah_shelters/src/ui/screens/registration/register_org_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    EmployeeRegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeRegistrationRouteArgs>(
          orElse: () => const EmployeeRegistrationRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EmployeeRegistrationScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    JoinOrRegisterOrganizationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.JoinOrRegisterOrganizationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegisterOrganizationRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterOrganizationRouteArgs>(
          orElse: () => const RegisterOrganizationRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.RegisterOrganizationScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.EmployeeRegistrationScreen]
class EmployeeRegistrationRoute
    extends _i6.PageRouteInfo<EmployeeRegistrationRouteArgs> {
  EmployeeRegistrationRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EmployeeRegistrationRoute.name,
          args: EmployeeRegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeeRegistrationRoute';

  static const _i6.PageInfo<EmployeeRegistrationRouteArgs> page =
      _i6.PageInfo<EmployeeRegistrationRouteArgs>(name);
}

class EmployeeRegistrationRouteArgs {
  const EmployeeRegistrationRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'EmployeeRegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.JoinOrRegisterOrganizationScreen]
class JoinOrRegisterOrganizationRoute extends _i6.PageRouteInfo<void> {
  const JoinOrRegisterOrganizationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          JoinOrRegisterOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrRegisterOrganizationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterOrganizationScreen]
class RegisterOrganizationRoute
    extends _i6.PageRouteInfo<RegisterOrganizationRouteArgs> {
  RegisterOrganizationRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RegisterOrganizationRoute.name,
          args: RegisterOrganizationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterOrganizationRoute';

  static const _i6.PageInfo<RegisterOrganizationRouteArgs> page =
      _i6.PageInfo<RegisterOrganizationRouteArgs>(name);
}

class RegisterOrganizationRouteArgs {
  const RegisterOrganizationRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterOrganizationRouteArgs{key: $key}';
  }
}
