// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:uah_shelters/src/ui/screens/calendar_screen.dart' as _i1;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i3;
import 'package:uah_shelters/src/ui/screens/login_screen.dart' as _i6;
import 'package:uah_shelters/src/ui/screens/my_animals_screen.dart' as _i7;
import 'package:uah_shelters/src/ui/screens/profile_screen.dart' as _i8;
import 'package:uah_shelters/src/ui/screens/registration/employee_registration_screen.dart'
    as _i2;
import 'package:uah_shelters/src/ui/screens/registration/join_or_reg_org_screen.dart'
    as _i4;
import 'package:uah_shelters/src/ui/screens/registration/join_org_screen.dart'
    as _i5;
import 'package:uah_shelters/src/ui/screens/registration/register_org_screen.dart'
    as _i9;
import 'package:uah_shelters/src/ui/screens/start_page.dart' as _i10;
import 'package:uah_shelters/src/ui/screens/tasks_screen.dart' as _i11;

/// generated route for
/// [_i1.CalendarScreen]
class CalendarRoute extends _i12.PageRouteInfo<void> {
  const CalendarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i2.EmployeeRegistrationScreen]
class EmployeeRegistrationRoute
    extends _i12.PageRouteInfo<EmployeeRegistrationRouteArgs> {
  EmployeeRegistrationRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EmployeeRegistrationRoute.name,
          args: EmployeeRegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeeRegistrationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EmployeeRegistrationRouteArgs>(
          orElse: () => const EmployeeRegistrationRouteArgs());
      return _i2.EmployeeRegistrationScreen(key: args.key);
    },
  );
}

class EmployeeRegistrationRouteArgs {
  const EmployeeRegistrationRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'EmployeeRegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.JoinOrRegisterOrganizationScreen]
class JoinOrRegisterOrganizationRoute extends _i12.PageRouteInfo<void> {
  const JoinOrRegisterOrganizationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          JoinOrRegisterOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrRegisterOrganizationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.JoinOrRegisterOrganizationScreen();
    },
  );
}

/// generated route for
/// [_i5.JoinOrganizationScreen]
class JoinOrganizationRoute extends _i12.PageRouteInfo<void> {
  const JoinOrganizationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          JoinOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinOrganizationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.JoinOrganizationScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MyAnimalsScreen]
class MyAnimalsRoute extends _i12.PageRouteInfo<void> {
  const MyAnimalsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MyAnimalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAnimalsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.MyAnimalsScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.RegisterOrganizationScreen]
class RegisterOrganizationRoute
    extends _i12.PageRouteInfo<RegisterOrganizationRouteArgs> {
  RegisterOrganizationRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RegisterOrganizationRoute.name,
          args: RegisterOrganizationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterOrganizationRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterOrganizationRouteArgs>(
          orElse: () => const RegisterOrganizationRouteArgs());
      return _i9.RegisterOrganizationScreen(key: args.key);
    },
  );
}

class RegisterOrganizationRouteArgs {
  const RegisterOrganizationRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegisterOrganizationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.StartPage]
class StartRoute extends _i12.PageRouteInfo<void> {
  const StartRoute({List<_i12.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.StartPage();
    },
  );
}

/// generated route for
/// [_i11.TasksScreen]
class TasksRoute extends _i12.PageRouteInfo<void> {
  const TasksRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.TasksScreen();
    },
  );
}
