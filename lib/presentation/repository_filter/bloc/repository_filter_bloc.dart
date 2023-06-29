import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repository_filter_event.dart';
part 'repository_filter_state.dart';

class RepositoryFilterBloc extends Bloc<RepositoryFilterEvent, RepositoryFilterState> {
  RepositoryFilterBloc() : super(RepositoryFilterInitial()) {
    on<RepositoryFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
