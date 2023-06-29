import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repository_item_event.dart';
part 'repository_item_state.dart';

class RepositoryItemBloc extends Bloc<RepositoryItemEvent, RepositoryItemState> {
  RepositoryItemBloc() : super(RepositoryItemInitial()) {
    on<RepositoryItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
