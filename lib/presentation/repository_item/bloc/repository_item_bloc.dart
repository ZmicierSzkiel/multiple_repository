import 'package:bloc/bloc.dart';

part 'repository_item_event.dart';
part 'repository_item_state.dart';

class RepositoryItemBloc
    extends Bloc<RepositoryItemEvent, RepositoryItemState> {
  RepositoryItemBloc() : super(const RepositoryItemState()) {
    on<RepositoryItemEvent>(
      ((event, emit) {
        // TODO
      }),
    );
  }
}
