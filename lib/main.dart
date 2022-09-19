import 'package:flutter/material.dart';
import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:log/ui/theme/custom_theme.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';

main(){
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    final appRouter = locator<AppRouter>();
     return ChangeNotifierProvider(
       create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider theme, child){
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: theme.isDark ? CustomTheme.darkTheme : CustomTheme.lightTheme,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              routeInformationProvider: appRouter.routeInfoProvider(),
            );
          },
        ),
     );
  }

}