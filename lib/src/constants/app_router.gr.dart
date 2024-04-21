// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:uah_shelters/src/ui/screens/home_screen.dart' as _i2;
import 'package:uah_shelters/src/ui/screens/login_screen.dart' as _i3;
import 'package:uah_shelters/src/ui/screens/registration_screen.dart' as _i1;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EmployeeRegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeRegistrationRouteArgs>(
          orElse: () => const EmployeeRegistrationRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EmployeeRegistrationScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmployeeRegistrationScreen]
class EmployeeRegistrationRoute
    extends _i4.PageRouteInfo<EmployeeRegistrationRouteArgs> {
  EmployeeRegistrationRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EmployeeRegistrationRoute.name,
          args: EmployeeRegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeeRegistrationRoute';

  static const _i4.PageInfo<EmployeeRegistrationRouteArgs> page =
      _i4.PageInfo<EmployeeRegistrationRouteArgs>(name);
}

class EmployeeRegistrationRouteArgs {
  const EmployeeRegistrationRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'EmployeeRegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
