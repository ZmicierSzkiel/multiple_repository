import 'package:bloc/bloc.dart';
import 'package:multiple_repository/core/use_case.dart';
import 'package:multiple_repository/domain/entities/repository_entity.dart';
import 'package:multiple_repository/domain/usecases/get_all_repositories_usecase.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';

class RepositoryListBloc
    extends Bloc<RepositoryListEvent, RepositoryListState> {
  final GetAllRepositoriesUsecase _getAllRepositoriesUsecase;

  RepositoryListBloc(
      {required GetAllRepositoriesUsecase getAllRepositoriesUsecase})
      : _getAllRepositoriesUsecase = getAllRepositoriesUsecase,
        super(RepositoryListState(
          repositories: [],
        )) {
    on<GetAllRepositoriesEvent>(_handleGetAllRepositoriesEvent);
  }
  Future<void> _handleGetAllRepositoriesEvent(
    GetAllRepositoriesEvent event,
    Emitter<RepositoryListState> emit,
  ) async {
    final repositories = await _getAllRepositoriesUsecase.execute(NoParams());
    emit(
      state.copyWith(
        repositories: repositories,
      ),
    );
  }
}
