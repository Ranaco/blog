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
    EditProfilePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EditProfilePageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BlogPageRoute.name: (routeData) {
      final args = routeData.argsAs<BlogPageRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: BlogPageView(
          key: args.key,
          tag: args.tag,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppScaffold.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeScaffold(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomePageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsPageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    NotificationPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NotificationPageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavoritePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const FavoritePageView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          EditProfilePageRoute.name,
          path: 'editProfile',
        ),
        RouteConfig(
          BlogPageRoute.name,
          path: 'blog',
        ),
        RouteConfig(
          AppScaffold.name,
          path: '/',
          children: [
            RouteConfig(
              HomePageRoute.name,
              path: 'home',
              parent: AppScaffold.name,
            ),
            RouteConfig(
              SettingsPageRoute.name,
              path: 'settings',
              parent: AppScaffold.name,
            ),
            RouteConfig(
              NotificationPageRoute.name,
              path: 'notifications',
              parent: AppScaffold.name,
            ),
            RouteConfig(
              FavoritePageRoute.name,
              path: 'favorites',
              parent: AppScaffold.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [EditProfilePageView]
class EditProfilePageRoute extends PageRouteInfo<void> {
  const EditProfilePageRoute()
      : super(
          EditProfilePageRoute.name,
          path: 'editProfile',
        );

  static const String name = 'EditProfilePageRoute';
}

/// generated route for
/// [BlogPageView]
class BlogPageRoute extends PageRouteInfo<BlogPageRouteArgs> {
  BlogPageRoute({
    Key? key,
    required String tag,
  }) : super(
          BlogPageRoute.name,
          path: 'blog',
          args: BlogPageRouteArgs(
            key: key,
            tag: tag,
          ),
        );

  static const String name = 'BlogPageRoute';
}

class BlogPageRouteArgs {
  const BlogPageRouteArgs({
    this.key,
    required this.tag,
  });

  final Key? key;

  final String tag;

  @override
  String toString() {
    return 'BlogPageRouteArgs{key: $key, tag: $tag}';
  }
}

/// generated route for
/// [HomeScaffold]
class AppScaffold extends PageRouteInfo<void> {
  const AppScaffold({List<PageRouteInfo>? children})
      : super(
          AppScaffold.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AppScaffold';
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: 'home',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [SettingsPageView]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [NotificationPageView]
class NotificationPageRoute extends PageRouteInfo<void> {
  const NotificationPageRoute()
      : super(
          NotificationPageRoute.name,
          path: 'notifications',
        );

  static const String name = 'NotificationPageRoute';
}

/// generated route for
/// [FavoritePageView]
class FavoritePageRoute extends PageRouteInfo<void> {
  const FavoritePageRoute()
      : super(
          FavoritePageRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritePageRoute';
}
