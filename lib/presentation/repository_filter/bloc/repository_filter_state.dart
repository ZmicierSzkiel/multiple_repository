part of 'repository_filter_bloc.dart';

abstract class RepositoryFilterState extends Equatable {
  const RepositoryFilterState();
  
  @override
  List<Object> get props => [];
}

class RepositoryFilterInitial extends RepositoryFilterState {}
