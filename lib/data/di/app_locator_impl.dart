import 'package:multiple_repository/core/app_locator.dart';

import 'package:multiple_repository/data/provider/api_repository_provider.dart';
import 'package:multiple_repository/data/repositories/api_repository_impl.dart';

import 'package:multiple_repository/domain/repositories/api_repository.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/get_search_result_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

Future<void> setupLocator() async {
  getIt.registerSingleton<ApiRepositoryProvider>(
    ApiRepositoryProvider(),
  );

  getIt.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      apiRepositoryProvider: getIt.get<ApiRepositoryProvider>(),
    ),
  );

  getIt.registerLazySingleton<GetAllRepositoriesUsecase>(
    () => GetAllRepositoriesUsecase(
      repository: getIt.get<ApiRepository>(),
    ),
  );

  getIt.registerLazySingleton<SortRepositoriesUsecase>(
    () => SortRepositoriesUsecase(
      repository: getIt.get<ApiRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetSearchResultUseCase>(
    () => GetSearchResultUseCase(
      repository: getIt.get<ApiRepository>(),
    ),
  );
}
