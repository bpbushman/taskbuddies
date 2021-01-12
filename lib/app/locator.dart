import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/app/locator.config.dart';
import 'package:taskbuddies/services/local_storage.dart';

final locator = GetIt.instance;
@injectableInit
void setupLocator() => $initGetIt(locator);

Future futureLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
}
