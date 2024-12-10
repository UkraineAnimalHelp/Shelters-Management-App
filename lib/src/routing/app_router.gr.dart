// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:uah_shelters/src/application/main_flow.dart' as _i5;
import 'package:uah_shelters/src/application/screens/calendar_screen.dart'
    as _i3;
import 'package:uah_shelters/src/application/screens/home_screen.dart' as _i4;
import 'package:uah_shelters/src/application/screens/my_animals_screen.dart'
    as _i6;
import 'package:uah_shelters/src/application/screens/profile_screen.dart'
    as _i7;
import 'package:uah_shelters/src/application/screens/start_page.dart' as _i11;
import 'package:uah_shelters/src/application/screens/tasks_screen.dart' as _i12;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_guard.dart'
    as _i2;
import 'package:uah_shelters/src/features/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_in/sign_in_screen.dart'
    as _i10;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_email_screen.dart'
    as _i8;
import 'package:uah_shelters/src/features/auth/presentation/screens/sign_up/register_name_screen.dart'
    as _i9;

/// generated route for
/// [_i1.AuthFlow]
class AuthFlow extends _i13.PageRouteInfo<void> {
  const AuthFlow({List<_i13.PageRouteInfo>? children})
      : super(
          AuthFlow.name,
          initialChildren: children,
        );

  static const String name = 'AuthFlow';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthFlow();
    },
  );
}

/// generated route for
/// [_i2.AuthGuard]
class AuthGuard extends _i13.PageRouteInfo<void> {
  const AuthGuard({List<_i13.PageRouteInfo>? children})
      : super(
          AuthGuard.name,
          initialChildren: children,
        );

  static const String name = 'AuthGuard';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthGuard();
    },
  );
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.CalendarScreen]
class CalendarRoute extends _i13.PageRouteInfo<void> {
  const CalendarRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.MainFlow]
class MainFlow extends _i13.PageRouteInfo<void> {
  const MainFlow({List<_i13.PageRouteInfo>? children})
      : super(
          MainFlow.name,
          initialChildren: children,
        );

  static const String name = 'MainFlow';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainFlow();
    },
  );
}

/// generated route for
/// [_i6.MyAnimalsScreen]
class MyAnimalsRoute extends _i13.PageRouteInfo<void> {
  const MyAnimalsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MyAnimalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAnimalsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyAnimalsScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.RegisterMailScreen]
class RegisterMailRoute extends _i13.PageRouteInfo<RegisterMailRouteArgs> {
  RegisterMailRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          RegisterMailRoute.name,
          args: RegisterMailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterMailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterMailRouteArgs>(
          orElse: () => const RegisterMailRouteArgs());
      return _i8.RegisterMailScreen(key: args.key);
    },
  );
}

class RegisterMailRouteArgs {
  const RegisterMailRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'RegisterMailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RegisterNameScreen]
class RegisterNameRoute extends _i13.PageRouteInfo<void> {
  const RegisterNameRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegisterNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterNameRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterNameScreen();
    },
  );
}

/// generated route for
/// [_i10.SignInScreen]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i10.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.StartPage]
class StartRoute extends _i13.PageRouteInfo<void> {
  const StartRoute({List<_i13.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.StartPage();
    },
  );
}

/// generated route for
/// [_i12.TasksScreen]
class TasksRoute extends _i13.PageRouteInfo<void> {
  const TasksRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.TasksScreen();
    },
  );
}
