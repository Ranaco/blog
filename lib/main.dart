import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  setupLocator();
  setupSnackBarUi();
  runApp(
    const BaseApp(),
  );
}

void setupSnackBarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: const Color(0xFF303030),
    textColor: Colors.white,
    messageColor: Colors.white,
    mainButtonTextColor: Colors.black,
    animationDuration: const Duration(milliseconds: 800),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
  ));
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: const BlogApp(),
    );
  }
}

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var appRouter = locator<AppRouter>();
    return MaterialApp.router(
      theme: themeProvider.getTheme(),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      debugShowCheckedModeBanner: false,
    );
  }
}
