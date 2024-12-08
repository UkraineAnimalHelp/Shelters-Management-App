// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_in_screen.dart'
    as _i8;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_email_screen.dart'
    as _i6;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_name_screen.dart'
    as _i7;
import 'package:uah_shelters/src/ui/screens/calendar_screen.dart' as _i2;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i3;
import 'package:uah_shelters/src/ui/screens/my_animals_screen.dart' as _i4;
import 'package:uah_shelters/src/ui/screens/profile_screen.dart' as _i5;
import 'package:uah_shelters/src/ui/screens/start_page.dart' as _i9;
import 'package:uah_shelters/src/ui/screens/tasks_screen.dart' as _i10;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.CalendarScreen]
class CalendarRoute extends _i11.PageRouteInfo<void> {
  const CalendarRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.MyAnimalsScreen]
class MyAnimalsRoute extends _i11.PageRouteInfo<void> {
  const MyAnimalsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyAnimalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAnimalsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.MyAnimalsScreen();
    },
  );
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.RegisterMailScreen]
class RegisterMailRoute extends _i11.PageRouteInfo<RegisterMailRouteArgs> {
  RegisterMailRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RegisterMailRoute.name,
          args: RegisterMailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterMailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterMailRouteArgs>(
          orElse: () => const RegisterMailRouteArgs());
      return _i6.RegisterMailScreen(key: args.key);
    },
  );
}

class RegisterMailRouteArgs {
  const RegisterMailRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RegisterMailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RegisterNameScreen]
class RegisterNameRoute extends _i11.PageRouteInfo<void> {
  const RegisterNameRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterNameRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterNameScreen();
    },
  );
}

/// generated route for
/// [_i8.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i8.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.StartPage]
class StartRoute extends _i11.PageRouteInfo<void> {
  const StartRoute({List<_i11.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.StartPage();
    },
  );
}

/// generated route for
/// [_i10.TasksScreen]
class TasksRoute extends _i11.PageRouteInfo<void> {
  const TasksRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.TasksScreen();
    },
  );
}
