// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_guard_screen.dart'
    as _i1;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_navigator.dart'
    as _i2;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_screen.dart'
    as _i3;
import 'package:uah_shelters/src/features/auth/presentation/screens/main_flow_screen.dart'
    as _i6;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_in_screen.dart'
    as _i11;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_email_screen.dart'
    as _i9;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_name_screen.dart'
    as _i10;
import 'package:uah_shelters/src/ui/screens/calendar_screen.dart' as _i4;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i5;
import 'package:uah_shelters/src/ui/screens/my_animals_screen.dart' as _i7;
import 'package:uah_shelters/src/ui/screens/profile_screen.dart' as _i8;
import 'package:uah_shelters/src/ui/screens/start_page.dart' as _i12;
import 'package:uah_shelters/src/ui/screens/tasks_screen.dart' as _i13;

/// generated route for
/// [_i1.AuthGuardScreen]
class AuthGuardRoute extends _i14.PageRouteInfo<void> {
  const AuthGuardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthGuardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthGuardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthGuardScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthNavigatorScreen]
class AuthNavigatorRoute extends _i14.PageRouteInfo<void> {
  const AuthNavigatorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthNavigatorRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthNavigatorScreen();
    },
  );
}

/// generated route for
/// [_i3.AuthScreen]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.AuthScreen();
    },
  );
}

/// generated route for
/// [_i4.CalendarScreen]
class CalendarRoute extends _i14.PageRouteInfo<void> {
  const CalendarRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.MainFlowScreen]
class MainFlowRoute extends _i14.PageRouteInfo<void> {
  const MainFlowRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainFlowRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainFlowScreen();
    },
  );
}

/// generated route for
/// [_i7.MyAnimalsScreen]
class MyAnimalsRoute extends _i14.PageRouteInfo<void> {
  const MyAnimalsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MyAnimalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAnimalsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.MyAnimalsScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.RegisterMailScreen]
class RegisterMailRoute extends _i14.PageRouteInfo<RegisterMailRouteArgs> {
  RegisterMailRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RegisterMailRoute.name,
          args: RegisterMailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterMailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterMailRouteArgs>(
          orElse: () => const RegisterMailRouteArgs());
      return _i9.RegisterMailScreen(key: args.key);
    },
  );
}

class RegisterMailRouteArgs {
  const RegisterMailRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'RegisterMailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.RegisterNameScreen]
class RegisterNameRoute extends _i14.PageRouteInfo<void> {
  const RegisterNameRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterNameRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterNameScreen();
    },
  );
}

/// generated route for
/// [_i11.SignInScreen]
class SignInRoute extends _i14.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i11.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.StartPage]
class StartRoute extends _i14.PageRouteInfo<void> {
  const StartRoute({List<_i14.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.StartPage();
    },
  );
}

/// generated route for
/// [_i13.TasksScreen]
class TasksRoute extends _i14.PageRouteInfo<void> {
  const TasksRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TasksScreen();
    },
  );
}
