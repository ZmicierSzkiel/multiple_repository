import 'package:bloc/bloc.dart';
import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';
import 'package:multiple_repository/domain/usecases/sort_repositories_usecase.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';

class RepositoryListBloc
    extends Bloc<RepositoryListEvent, RepositoryListState> {
  final GetAllRepositoriesUsecase _getAllRepositoriesUsecase;
  final SortRepositoriesUsecase _sortRepositoriesUsecase;

  final List<String> sortOptions = [
    'Github first',
    'BitBucket first',
    'A-Z',
    'Z-A',
  ];

  RepositoryListBloc({
    required GetAllRepositoriesUsecase getAllRepositoriesUsecase,
    required SortRepositoriesUsecase sortRepositoriesUsecase,
  })  : _getAllRepositoriesUsecase = getAllRepositoriesUsecase,
        _sortRepositoriesUsecase = sortRepositoriesUsecase,
        super(
          RepositoryListState(
              repositories: [],
              selectedOption: '',
              status: LoadingStatus.loading,
              message: ''),
        ) {
    on<GetAllRepositoriesEvent>(_handleGetAllRepositoriesEvent);
    on<RefreshRepositoriesEvent>(_handleRefreshRepositoriesEvent);
    on<SortRepositoriesEvent>(_handleSortRepositoriesEvent);
    on<ResetSortRepositoriesEvent>(_handleResetSortRepositoriesEvent);
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
          selectedOption: '',
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
          selectedOption: event.selectedOption,
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
          selectedOption: '',
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
}
