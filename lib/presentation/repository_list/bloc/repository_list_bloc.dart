import 'package:bloc/bloc.dart';

import 'package:multiple_repository/core/use_case.dart';

import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/entities/search_entity.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/get_search_result_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';

class RepositoryListBloc
    extends Bloc<RepositoryListEvent, RepositoryListState> {
  final GetAllRepositoriesUsecase _getAllRepositoriesUsecase;
  final SortRepositoriesUsecase _sortRepositoriesUsecase;
  final GetSearchResultUseCase _getSearchResultUseCase;

  final List<String> sortOptions = [
    'Github first',
    'BitBucket first',
    'A-Z',
    'Z-A',
  ];

  final List<String> searchOptions = [
    'Github',
    'BitBucket',
  ];

  RepositoryListBloc({
    required GetAllRepositoriesUsecase getAllRepositoriesUsecase,
    required SortRepositoriesUsecase sortRepositoriesUsecase,
    required GetSearchResultUseCase getSearchResultUseCase,
  })  : _getAllRepositoriesUsecase = getAllRepositoriesUsecase,
        _sortRepositoriesUsecase = sortRepositoriesUsecase,
        _getSearchResultUseCase = getSearchResultUseCase,
        super(
          RepositoryListState(
            repositories: [],
            selectedSortOption: '',
            status: LoadingStatus.loading,
            message: '',
            searchValue: '',
          ),
        ) {
    on<GetAllRepositoriesEvent>(_handleGetAllRepositoriesEvent);
    on<RefreshRepositoriesEvent>(_handleRefreshRepositoriesEvent);
    on<SortRepositoriesEvent>(_handleSortRepositoriesEvent);
    on<ResetSortRepositoriesEvent>(_handleResetSortRepositoriesEvent);
    on<GetSearchResultEvent>(_handleGetSearchResultEvent);
  }

  Future<void> _handleGetAllRepositoriesEvent(
    GetAllRepositoriesEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    emit(
      state.copyWith(status: LoadingStatus.loading),
    );
    try {
      final repositories = await _getAllRepositoriesUsecase.execute(NoParams());
      emit(
        state.copyWith(
            repositories: repositories, status: LoadingStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _handleRefreshRepositoriesEvent(
    RefreshRepositoriesEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    emit(
      state.copyWith(status: LoadingStatus.loading),
    );
    try {
      final repositories = await _getAllRepositoriesUsecase.execute(NoParams());
      emit(
        state.copyWith(
          repositories: repositories,
          selectedSortOption: '',
          status: LoadingStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }

  List<String> getSortOptions() {
    return sortOptions;
  }

  List<String> getSearchOptions() {
    return searchOptions;
  }

  Future<void> _handleSortRepositoriesEvent(
    SortRepositoriesEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    emit(
      state.copyWith(status: LoadingStatus.loading),
    );
    try {
      final List<RepositoryEntity> sortedRepositories =
          await _sortRepositoriesUsecase.execute(event.selectedOption);
      emit(
        state.copyWith(
          selectedSortOption: event.selectedOption,
          repositories: sortedRepositories,
          status: LoadingStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _handleResetSortRepositoriesEvent(
    ResetSortRepositoriesEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    emit(
      state.copyWith(status: LoadingStatus.loading),
    );
    try {
      final repositories = await _getAllRepositoriesUsecase.execute(NoParams());

      emit(
        state.copyWith(
          selectedSortOption: '',
          repositories: repositories,
          status: LoadingStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _handleGetSearchResultEvent(
    GetSearchResultEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    try {
      final List<RepositoryEntity> searchResult =
          await _getSearchResultUseCase.execute(
        SearchEntity(
          searchValue: event.searchValue,
        ),
      );
      emit(
        state.copyWith(
          repositories: searchResult,
          status: LoadingStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
