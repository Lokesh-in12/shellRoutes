import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_advance/core/routes/app_route_const.dart';
import 'package:go_router_advance/src/views/screens/cart.dart';
import 'package:go_router_advance/src/views/screens/contact_us.dart';
import 'package:go_router_advance/src/views/screens/homepage.dart';
import 'package:go_router_advance/src/views/screens/posts.dart';
import 'package:go_router_advance/src/views/screens/profilepage.dart';
import 'package:go_router_advance/src/views/screens/settings.dart';
import 'package:go_router_advance/src/views/screens/shell_home_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellavigator = GlobalKey(debugLabel: 'shell');

class MyAppRouterConfig {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        // GoRoute(
        //   name: MyAppRouteConstants.homeRoute,
        //   path: '/home',
        //   builder: (BuildContext context, GoRouterState state) => HomePage(),
        // ),
        GoRoute(
          name: MyAppRouteConstants.profileRoute,
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) =>
              const ProfilePagePage(),
        ),
        GoRoute(
          name: MyAppRouteConstants.contactUsRoute,
          path: '/contactUs',
          builder: (BuildContext context, GoRouterState state) =>
              const ContactUsPage(),
        ),
        GoRoute(
          name: MyAppRouteConstants.postsRoute,
          path: '/posts',
          builder: (BuildContext context, GoRouterState state) =>
              const PostsPagePage(),
        ),
        ShellRoute(
            navigatorKey: _shellavigator,
            builder: (context, state, child) => ShellHomePage(child: child),
            routes: [
              GoRoute(
                path: '/',
                name: "home",
                builder: (context, state) => HomePage(),
              ),
              GoRoute(
                path: '/cart',
                name: "cart",
                builder: (context, state) => CartPage(),
              ),
              GoRoute(
                path: '/settings',
                name: "settings",
                builder: (context, state) => SettingsPage(),
              ),
            ])
      ],
      errorPageBuilder: (context, state) =>
          MaterialPage(child: Text("error no route found")),
      // redirect: (BuildContext context, GoRouterState state) async {
      //   if (isAuth && state.location.startsWith('/')) {
      //     return '/${MyAppRouteConstants.profileRoute}';
      //   } else {
      //     return '/${MyAppRouteConstants.contactUsRoute}';
      //   }
      // },
      // redirect: (context, state) {
      //   if (!isAuth &&
      //       state.location.startsWith('/${MyAppRouteConstants.profileRoute}')) {
      //     return context.namedLocation(MyAppRouteConstants.contactUsRoute);
      //   } else {
      //     return null;
      //   }
      // },
    );
    return router;
  }
}
