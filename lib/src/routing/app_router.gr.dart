// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i2;
import 'package:uah_shelters/src/ui/screens/login_screen.dart' as _i5;
import 'package:uah_shelters/src/ui/screens/registration/employee_registration_screen.dart'
    as _i1;
import 'package:uah_shelters/src/ui/screens/registration/join_or_reg_org_screen.dart'
    as _i3;
import 'package:uah_shelters/src/ui/screens/registration/join_org_screen.dart'
    as _i4;
import 'package:uah_shelters/src/ui/screens/registration/register_org_screen.dart'
    as _i6;

/// generated route for
/// [_i1.EmployeeRegistrationScreen]
class EmployeeRegistrationRoute
    extends _i7.PageRouteInfo<EmployeeRegistrationRouteArgs> {
  EmployeeRegistrationRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          EmployeeRegistrationRoute.name,
          args: EmployeeRegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeeRegistrationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EmployeeRegistrationRouteArgs>(
          orElse: () => const EmployeeRegistrationRouteArgs());
      return _i1.EmployeeRegistrationScreen(key: args.key);
    },
  );
}

class EmployeeRegistrationRouteArgs {
  const EmployeeRegistrationRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'EmployeeRegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.JoinOrRegisterOrganizationScreen]
class JoinOrRegisterOrganizationRoute extends _i7.PageRouteInfo<void> {
  const JoinOrRegisterOrganizationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          JoinOrRegisterOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrRegisterOrganizationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.JoinOrRegisterOrganizationScreen();
    },
  );
}

/// generated route for
/// [_i4.JoinOrganizationScreen]
class JoinOrganizationRoute extends _i7.PageRouteInfo<void> {
  const JoinOrganizationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          JoinOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrganizationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.JoinOrganizationScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.RegisterOrganizationScreen]
class RegisterOrganizationRoute
    extends _i7.PageRouteInfo<RegisterOrganizationRouteArgs> {
  RegisterOrganizationRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RegisterOrganizationRoute.name,
          args: RegisterOrganizationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterOrganizationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterOrganizationRouteArgs>(
          orElse: () => const RegisterOrganizationRouteArgs());
      return _i6.RegisterOrganizationScreen(key: args.key);
    },
  );
}

class RegisterOrganizationRouteArgs {
  const RegisterOrganizationRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'RegisterOrganizationRouteArgs{key: $key}';
  }
}
