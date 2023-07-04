import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/data/provider/api_repository_provider.dart';
import 'package:multiple_repository/data/repositories/api_repository_impl.dart';

import 'package:multiple_repository/domain/repositories/api_repository.dart';

Future<void> setupLocator() async {
  await _initPrefs();

  getIt.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      apiRepositoryProvider: getIt.get<ApiRepositoryProvider>(),
    ),
  );
}

Future<void> _initPrefs() async {
  final ApiRepositoryProvider apiRepositoryProvider = ApiRepositoryProvider();
  getIt.registerSingleton<ApiRepositoryProvider>(apiRepositoryProvider);
}
