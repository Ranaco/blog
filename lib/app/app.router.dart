import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:log/ui/edit_profile_page/edit_profile_page_view.dart';
import 'package:log/ui/home_page/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:log/ui/notification_page/notification_page_view.dart';
import 'package:log/ui/scaffold.dart';
import 'package:log/ui/settings_page/settings_page_view.dart';
import 'package:log/ui/favorite_page/favorite_page_view.dart';
part './app.router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: EditProfilePageView,
        path: 'editProfile',
        name: 'EditProfilePageRoute'
    ),
    CustomRoute(
      path: '/',
      page: HomeScaffold,
      name: 'AppScaffold',
      initial: true,
      maintainState: true,
      children: [
        CustomRoute(
          page: HomePageView,
          path: 'home',
          name: 'HomePageRoute'
        ),
        CustomRoute(
          page: SettingsPageView,
          path: 'settings',
          name: 'SettingsPageRoute',
        ),
        CustomRoute(
          page: NotificationPageView,
          path: 'notifications',
          name: 'NotificationPageRoute'
        ),
        CustomRoute(
          page: FavoritePageView,
          path: 'favorites',
          name: 'FavoritePageRoute'
          ),
      ]
    ),

  ]
)

@singleton
class AppRouter extends _$AppRouter{}
