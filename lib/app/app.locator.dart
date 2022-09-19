import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import './app.locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  asExtension: false,
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  ignoreUnregisteredTypes: []
)
void setupLocator() => $initGetIt(locator);