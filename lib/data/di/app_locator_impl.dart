import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/data/provider/db_repository_provider.dart';
import 'package:multiple_repository/data/repositories/db_repository_impl.dart';

import 'package:multiple_repository/domain/repositories/db_repository.dart';

Future<void> setupLocator() async {
  await _initPrefs();

  getIt.registerLazySingleton<DbRepository>(
    () => DbRepositoryImpl(
      dbRepositoryProvider: getIt.get<DbRepositoryProvider>(),
    ),
  );
}

Future<void> _initPrefs() async {
  final DbRepositoryProvider dbRepositoryProvider = DbRepositoryProvider();
  getIt.registerSingleton<DbRepositoryProvider>(dbRepositoryProvider);
}
