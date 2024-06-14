// Mocks generated by Mockito 5.4.4 from annotations
// in uah_shelters/test/mocks/app_router.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i10;

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:auto_route/src/matcher/route_matcher.dart' as _i5;
import 'package:auto_route/src/router/controller/navigation_history/navigation_history_base.dart'
    as _i6;
import 'package:flutter/foundation.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

import 'app_router.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocalKey_0 extends _i1.SmartFake implements _i2.LocalKey {
  _FakeLocalKey_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePendingRoutesHandler_1 extends _i1.SmartFake
    implements _i3.PendingRoutesHandler {
  _FakePendingRoutesHandler_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePagelessRoutesObserver_2 extends _i1.SmartFake
    implements _i3.PagelessRoutesObserver {
  _FakePagelessRoutesObserver_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeActiveGuardObserver_3 extends _i1.SmartFake
    implements _i3.ActiveGuardObserver {
  _FakeActiveGuardObserver_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_4<T extends _i4.State<_i4.StatefulWidget>>
    extends _i1.SmartFake implements _i4.GlobalKey<T> {
  _FakeGlobalKey_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteCollection_5 extends _i1.SmartFake
    implements _i3.RouteCollection {
  _FakeRouteCollection_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAutoRoutePage_6<T> extends _i1.SmartFake
    implements _i3.AutoRoutePage<T> {
  _FakeAutoRoutePage_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteMatcher_7 extends _i1.SmartFake implements _i5.RouteMatcher {
  _FakeRouteMatcher_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteData_8 extends _i1.SmartFake implements _i3.RouteData {
  _FakeRouteData_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNavigationHistory_9 extends _i1.SmartFake
    implements _i6.NavigationHistory {
  _FakeNavigationHistory_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUrlState_10 extends _i1.SmartFake implements _i3.UrlState {
  _FakeUrlState_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRootStackRouter_11 extends _i1.SmartFake
    implements _i3.RootStackRouter {
  _FakeRootStackRouter_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteMatch_12<T> extends _i1.SmartFake implements _i3.RouteMatch<T> {
  _FakeRouteMatch_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRoutingController_13 extends _i1.SmartFake
    implements _i3.RoutingController {
  _FakeRoutingController_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TestRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i7.TestRouter {
  @override
  List<_i3.AutoRoute> get routes => (super.noSuchMethod(
        Invocation.getter(#routes),
        returnValue: <_i3.AutoRoute>[],
        returnValueForMissingStub: <_i3.AutoRoute>[],
      ) as List<_i3.AutoRoute>);

  @override
  _i2.LocalKey get key => (super.noSuchMethod(
        Invocation.getter(#key),
        returnValue: _FakeLocalKey_0(
          this,
          Invocation.getter(#key),
        ),
        returnValueForMissingStub: _FakeLocalKey_0(
          this,
          Invocation.getter(#key),
        ),
      ) as _i2.LocalKey);

  @override
  _i3.PendingRoutesHandler get pendingRoutesHandler => (super.noSuchMethod(
        Invocation.getter(#pendingRoutesHandler),
        returnValue: _FakePendingRoutesHandler_1(
          this,
          Invocation.getter(#pendingRoutesHandler),
        ),
        returnValueForMissingStub: _FakePendingRoutesHandler_1(
          this,
          Invocation.getter(#pendingRoutesHandler),
        ),
      ) as _i3.PendingRoutesHandler);

  @override
  _i3.PagelessRoutesObserver get pagelessRoutesObserver => (super.noSuchMethod(
        Invocation.getter(#pagelessRoutesObserver),
        returnValue: _FakePagelessRoutesObserver_2(
          this,
          Invocation.getter(#pagelessRoutesObserver),
        ),
        returnValueForMissingStub: _FakePagelessRoutesObserver_2(
          this,
          Invocation.getter(#pagelessRoutesObserver),
        ),
      ) as _i3.PagelessRoutesObserver);

  @override
  _i3.ActiveGuardObserver get activeGuardObserver => (super.noSuchMethod(
        Invocation.getter(#activeGuardObserver),
        returnValue: _FakeActiveGuardObserver_3(
          this,
          Invocation.getter(#activeGuardObserver),
        ),
        returnValueForMissingStub: _FakeActiveGuardObserver_3(
          this,
          Invocation.getter(#activeGuardObserver),
        ),
      ) as _i3.ActiveGuardObserver);

  @override
  int get stateHash => (super.noSuchMethod(
        Invocation.getter(#stateHash),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i4.GlobalKey<_i4.NavigatorState> get navigatorKey => (super.noSuchMethod(
        Invocation.getter(#navigatorKey),
        returnValue: _FakeGlobalKey_4<_i4.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
        returnValueForMissingStub: _FakeGlobalKey_4<_i4.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
      ) as _i4.GlobalKey<_i4.NavigatorState>);

  @override
  _i3.RouteCollection get routeCollection => (super.noSuchMethod(
        Invocation.getter(#routeCollection),
        returnValue: _FakeRouteCollection_5(
          this,
          Invocation.getter(#routeCollection),
        ),
        returnValueForMissingStub: _FakeRouteCollection_5(
          this,
          Invocation.getter(#routeCollection),
        ),
      ) as _i3.RouteCollection);

  @override
  _i3.PageBuilder get pageBuilder => (super.noSuchMethod(
        Invocation.getter(#pageBuilder),
        returnValue: (_i3.RouteData data) => _FakeAutoRoutePage_6<dynamic>(
          this,
          Invocation.getter(#pageBuilder),
        ),
        returnValueForMissingStub: (_i3.RouteData data) =>
            _FakeAutoRoutePage_6<dynamic>(
          this,
          Invocation.getter(#pageBuilder),
        ),
      ) as _i3.PageBuilder);

  @override
  _i5.RouteMatcher get matcher => (super.noSuchMethod(
        Invocation.getter(#matcher),
        returnValue: _FakeRouteMatcher_7(
          this,
          Invocation.getter(#matcher),
        ),
        returnValueForMissingStub: _FakeRouteMatcher_7(
          this,
          Invocation.getter(#matcher),
        ),
      ) as _i5.RouteMatcher);

  @override
  _i3.RouteData get current => (super.noSuchMethod(
        Invocation.getter(#current),
        returnValue: _FakeRouteData_8(
          this,
          Invocation.getter(#current),
        ),
        returnValueForMissingStub: _FakeRouteData_8(
          this,
          Invocation.getter(#current),
        ),
      ) as _i3.RouteData);

  @override
  _i3.RouteData get topRoute => (super.noSuchMethod(
        Invocation.getter(#topRoute),
        returnValue: _FakeRouteData_8(
          this,
          Invocation.getter(#topRoute),
        ),
        returnValueForMissingStub: _FakeRouteData_8(
          this,
          Invocation.getter(#topRoute),
        ),
      ) as _i3.RouteData);

  @override
  bool get hasPagelessTopRoute => (super.noSuchMethod(
        Invocation.getter(#hasPagelessTopRoute),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  List<_i3.AutoRoutePage<dynamic>> get stack => (super.noSuchMethod(
        Invocation.getter(#stack),
        returnValue: <_i3.AutoRoutePage<dynamic>>[],
        returnValueForMissingStub: <_i3.AutoRoutePage<dynamic>>[],
      ) as List<_i3.AutoRoutePage<dynamic>>);

  @override
  bool get ignorePopCompleters => (super.noSuchMethod(
        Invocation.getter(#ignorePopCompleters),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set ignorePopCompleters(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #ignorePopCompleters,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i3.RoutingController> get childControllers => (super.noSuchMethod(
        Invocation.getter(#childControllers),
        returnValue: <_i3.RoutingController>[],
        returnValueForMissingStub: <_i3.RoutingController>[],
      ) as List<_i3.RoutingController>);

  @override
  _i6.NavigationHistory get navigationHistory => (super.noSuchMethod(
        Invocation.getter(#navigationHistory),
        returnValue: _FakeNavigationHistory_9(
          this,
          Invocation.getter(#navigationHistory),
        ),
        returnValueForMissingStub: _FakeNavigationHistory_9(
          this,
          Invocation.getter(#navigationHistory),
        ),
      ) as _i6.NavigationHistory);

  @override
  _i3.UrlState get urlState => (super.noSuchMethod(
        Invocation.getter(#urlState),
        returnValue: _FakeUrlState_10(
          this,
          Invocation.getter(#urlState),
        ),
        returnValueForMissingStub: _FakeUrlState_10(
          this,
          Invocation.getter(#urlState),
        ),
      ) as _i3.UrlState);

  @override
  String get currentPath => (super.noSuchMethod(
        Invocation.getter(#currentPath),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#currentPath),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.getter(#currentPath),
        ),
      ) as String);

  @override
  String get currentUrl => (super.noSuchMethod(
        Invocation.getter(#currentUrl),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#currentUrl),
        ),
        returnValueForMissingStub: _i8.dummyValue<String>(
          this,
          Invocation.getter(#currentUrl),
        ),
      ) as String);

  @override
  List<_i3.RouteData> get stackData => (super.noSuchMethod(
        Invocation.getter(#stackData),
        returnValue: <_i3.RouteData>[],
        returnValueForMissingStub: <_i3.RouteData>[],
      ) as List<_i3.RouteData>);

  @override
  bool get managedByWidget => (super.noSuchMethod(
        Invocation.getter(#managedByWidget),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isTopMost => (super.noSuchMethod(
        Invocation.getter(#isTopMost),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get canNavigateBack => (super.noSuchMethod(
        Invocation.getter(#canNavigateBack),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.RootStackRouter get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeRootStackRouter_11(
          this,
          Invocation.getter(#root),
        ),
        returnValueForMissingStub: _FakeRootStackRouter_11(
          this,
          Invocation.getter(#root),
        ),
      ) as _i3.RootStackRouter);

  @override
  bool get isRoot => (super.noSuchMethod(
        Invocation.getter(#isRoot),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.RouteMatch<dynamic> get topMatch => (super.noSuchMethod(
        Invocation.getter(#topMatch),
        returnValue: _FakeRouteMatch_12<dynamic>(
          this,
          Invocation.getter(#topMatch),
        ),
        returnValueForMissingStub: _FakeRouteMatch_12<dynamic>(
          this,
          Invocation.getter(#topMatch),
        ),
      ) as _i3.RouteMatch<dynamic>);

  @override
  _i3.RouteData get routeData => (super.noSuchMethod(
        Invocation.getter(#routeData),
        returnValue: _FakeRouteData_8(
          this,
          Invocation.getter(#routeData),
        ),
        returnValueForMissingStub: _FakeRouteData_8(
          this,
          Invocation.getter(#routeData),
        ),
      ) as _i3.RouteData);

  @override
  bool get hasEntries => (super.noSuchMethod(
        Invocation.getter(#hasEntries),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get pageCount => (super.noSuchMethod(
        Invocation.getter(#pageCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  List<_i3.RouteMatch<dynamic>> get currentSegments => (super.noSuchMethod(
        Invocation.getter(#currentSegments),
        returnValue: <_i3.RouteMatch<dynamic>>[],
        returnValueForMissingStub: <_i3.RouteMatch<dynamic>>[],
      ) as List<_i3.RouteMatch<dynamic>>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<void> reevaluateGuards() => (super.noSuchMethod(
        Invocation.method(
          #reevaluateGuards,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  bool canPop({
    bool? ignoreChildRoutes = false,
    bool? ignoreParentRoutes = false,
    bool? ignorePagelessRoutes = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
          {
            #ignoreChildRoutes: ignoreChildRoutes,
            #ignoreParentRoutes: ignoreParentRoutes,
            #ignorePagelessRoutes: ignorePagelessRoutes,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i9.Future<T?> pushWidget<T extends Object?>(
    _i4.Widget? widget, {
    _i4.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
    bool? opaque = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushWidget,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
            #opaque: opaque,
          },
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<T?> pushNativeRoute<T extends Object?>(_i4.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNativeRoute,
          [route],
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<bool> maybePop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #maybePop,
          [result],
        ),
        returnValue: _i9.Future<bool>.value(false),
        returnValueForMissingStub: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  void popForced<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #popForced,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool removeLast() => (super.noSuchMethod(
        Invocation.method(
          #removeLast,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void removeRoute(
    _i3.RouteData? route, {
    bool? notify = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #removeRoute,
          [route],
          {#notify: notify},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onPopPage(
    _i4.Route<dynamic>? route,
    _i3.RouteData? data,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onPopPage,
          [
            route,
            data,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<T?> push<T extends Object?>(
    _i3.PageRouteInfo<dynamic>? route, {
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<T?> replace<T extends Object?>(
    _i3.PageRouteInfo<dynamic>? route, {
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replace,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<void> pushAll(
    List<_i3.PageRouteInfo<dynamic>>? routes, {
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<void> popAndPushAll(
    List<_i3.PageRouteInfo<dynamic>>? routes, {
    dynamic onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPushAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<void> replaceAll(
    List<_i3.PageRouteInfo<dynamic>>? routes, {
    _i3.OnNavigationFailure? onFailure,
    bool? updateExistingRoutes = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceAll,
          [routes],
          {
            #onFailure: onFailure,
            #updateExistingRoutes: updateExistingRoutes,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  void popUntilRoot() => super.noSuchMethod(
        Invocation.method(
          #popUntilRoot,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    _i3.PageRouteInfo<dynamic>? route, {
    TO? result,
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPush,
          [route],
          {
            #result: result,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  bool removeUntil(
    _i3.RouteDataPredicate? predicate, {
    bool? scoped = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeUntil,
          [predicate],
          {#scoped: scoped},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i4.RoutePredicate? predicate, {
    bool? scoped = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#scoped: scoped},
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool removeWhere(
    _i3.RouteDataPredicate? predicate, {
    bool? notify = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWhere,
          [predicate],
          {#notify: notify},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void updateDeclarativeRoutes(List<_i3.PageRouteInfo<dynamic>>? routes) =>
      super.noSuchMethod(
        Invocation.method(
          #updateDeclarativeRoutes,
          [routes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<void> navigateAll(
    List<_i3.RouteMatch<dynamic>>? routes, {
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<T?> pushAndPopUntil<T extends Object?>(
    _i3.PageRouteInfo<dynamic>? route, {
    required _i4.RoutePredicate? predicate,
    bool? scopedPopUntil = true,
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushAndPopUntil,
          [route],
          {
            #predicate: predicate,
            #scopedPopUntil: scopedPopUntil,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<T?> replaceNamed<T extends Object?>(
    String? path, {
    bool? includePrefixMatches = false,
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<T?> pushNamed<T extends Object?>(
    String? path, {
    bool? includePrefixMatches = false,
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i9.Future<T?>.value(),
        returnValueForMissingStub: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  void popUntilRouteWithName(
    String? name, {
    bool? scoped = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntilRouteWithName,
          [name],
          {#scoped: scoped},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popUntilRouteWithPath(
    String? path, {
    bool? scoped = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntilRouteWithPath,
          [path],
          {#scoped: scoped},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void markUrlStateForReplace() => super.noSuchMethod(
        Invocation.method(
          #markUrlStateForReplace,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void attachChildController(_i3.RoutingController? childController) =>
      super.noSuchMethod(
        Invocation.method(
          #attachChildController,
          [childController],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeChildController(_i3.RoutingController? childController) =>
      super.noSuchMethod(
        Invocation.method(
          #removeChildController,
          [childController],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyAll({bool? forceUrlRebuild = false}) => super.noSuchMethod(
        Invocation.method(
          #notifyAll,
          [],
          {#forceUrlRebuild: forceUrlRebuild},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<void> navigateNamed(
    String? path, {
    bool? includePrefixMatches = false,
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  List<_i3.HierarchySegment> currentHierarchy({
    bool? asPath = false,
    bool? ignorePending = false,
    bool? ignoreParams = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #currentHierarchy,
          [],
          {
            #asPath: asPath,
            #ignorePending: ignorePending,
            #ignoreParams: ignoreParams,
          },
        ),
        returnValue: <_i3.HierarchySegment>[],
        returnValueForMissingStub: <_i3.HierarchySegment>[],
      ) as List<_i3.HierarchySegment>);

  @override
  bool isRouteActive(String? routeName) => (super.noSuchMethod(
        Invocation.method(
          #isRouteActive,
          [routeName],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool isRouteDataActive(_i3.RouteData? data) => (super.noSuchMethod(
        Invocation.method(
          #isRouteDataActive,
          [data],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool isPathActive(String? path) => (super.noSuchMethod(
        Invocation.method(
          #isPathActive,
          [path],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.RouteMatch<dynamic>? match(_i3.PageRouteInfo<dynamic>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #match,
          [route],
        ),
        returnValueForMissingStub: null,
      ) as _i3.RouteMatch<dynamic>?);

  @override
  _i9.Future<dynamic> navigate(
    _i3.PageRouteInfo<dynamic>? route, {
    _i3.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigate,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i9.Future<dynamic>.value(),
        returnValueForMissingStub: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  void back() => super.noSuchMethod(
        Invocation.method(
          #back,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void pushPathState(Object? state) => super.noSuchMethod(
        Invocation.method(
          #pushPathState,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.RoutingController topMostRouter({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #topMostRouter,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: _FakeRoutingController_13(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
        returnValueForMissingStub: _FakeRoutingController_13(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
      ) as _i3.RoutingController);

  @override
  void updateRouteData(_i3.RouteData? data) => super.noSuchMethod(
        Invocation.method(
          #updateRouteData,
          [data],
        ),
        returnValueForMissingStub: null,
      );

  @override
  T? innerRouterOf<T extends _i3.RoutingController>(String? routeName) =>
      (super.noSuchMethod(
        Invocation.method(
          #innerRouterOf,
          [routeName],
        ),
        returnValueForMissingStub: null,
      ) as T?);

  @override
  _i9.Future<bool> pop<T extends Object?>([T? result]) => (super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValue: _i9.Future<bool>.value(false),
        returnValueForMissingStub: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> popTop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #popTop,
          [result],
        ),
        returnValue: _i9.Future<bool>.value(false),
        returnValueForMissingStub: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> maybePopTop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #maybePopTop,
          [result],
        ),
        returnValue: _i9.Future<bool>.value(false),
        returnValueForMissingStub: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  bool childrenCanPop({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #childrenCanPop,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool activeRouterCanPop({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #activeRouterCanPop,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.PageRouteInfo<dynamic>? buildPageRoute(
    String? path, {
    bool? includePrefixMatches = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildPageRoute,
          [path],
          {#includePrefixMatches: includePrefixMatches},
        ),
        returnValueForMissingStub: null,
      ) as _i3.PageRouteInfo<dynamic>?);

  @override
  List<_i3.PageRouteInfo<dynamic>>? buildPageRoutesStack(
    String? path, {
    bool? includePrefixMatches = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildPageRoutesStack,
          [path],
          {#includePrefixMatches: includePrefixMatches},
        ),
        returnValueForMissingStub: null,
      ) as List<_i3.PageRouteInfo<dynamic>>?);

  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
