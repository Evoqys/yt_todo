
import 'package:get_it/get_it.dart';
import 'package:yt_todo/providers/task_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => TaskProvider());
}