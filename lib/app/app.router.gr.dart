// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppScaffold.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomeScaffold(),
          opaque: true,
          barrierDismissible: false);
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: HomePageView(key: args.key, currentIndex: args.currentIndex),
          opaque: true,
          barrierDismissible: false);
    },
    SettingsPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SettingsPageView(),
          opaque: true,
          barrierDismissible: false);
    },
    NotificationPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const NotificationPageView(),
          opaque: true,
          barrierDismissible: false);
    },
    FavoritePageRoute.name: (routeData) {
      final args = routeData.argsAs<FavoritePageRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child:
              FavoritePageView(key: args.key, currentIndex: args.currentIndex),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(AppScaffold.name, path: '/', children: [
          RouteConfig(HomePageRoute.name,
              path: 'home', parent: AppScaffold.name),
          RouteConfig(SettingsPageRoute.name,
              path: 'settings', parent: AppScaffold.name),
          RouteConfig(NotificationPageRoute.name,
              path: 'notifications', parent: AppScaffold.name),
          RouteConfig(FavoritePageRoute.name,
              path: 'favorites', parent: AppScaffold.name)
        ])
      ];
}

/// generated route for
/// [HomeScaffold]
class AppScaffold extends PageRouteInfo<void> {
  const AppScaffold({List<PageRouteInfo>? children})
      : super(AppScaffold.name, path: '/', initialChildren: children);

  static const String name = 'AppScaffold';
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({Key? key, required int currentIndex})
      : super(HomePageRoute.name,
            path: 'home',
            args: HomePageRouteArgs(key: key, currentIndex: currentIndex));

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key, required this.currentIndex});

  final Key? key;

  final int currentIndex;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key, currentIndex: $currentIndex}';
  }
}

/// generated route for
/// [SettingsPageView]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [NotificationPageView]
class NotificationPageRoute extends PageRouteInfo<void> {
  const NotificationPageRoute()
      : super(NotificationPageRoute.name, path: 'notifications');

  static const String name = 'NotificationPageRoute';
}

/// generated route for
/// [FavoritePageView]
class FavoritePageRoute extends PageRouteInfo<FavoritePageRouteArgs> {
  FavoritePageRoute({Key? key, required int currentIndex})
      : super(FavoritePageRoute.name,
            path: 'favorites',
            args: FavoritePageRouteArgs(key: key, currentIndex: currentIndex));

  static const String name = 'FavoritePageRoute';
}

class FavoritePageRouteArgs {
  const FavoritePageRouteArgs({this.key, required this.currentIndex});

  final Key? key;

  final int currentIndex;

  @override
  String toString() {
    return 'FavoritePageRouteArgs{key: $key, currentIndex: $currentIndex}';
  }
}
