part of 'repository_item_bloc.dart';

abstract class RepositoryItemState extends Equatable {
  const RepositoryItemState();
  
  @override
  List<Object> get props => [];
}

class RepositoryItemInitial extends RepositoryItemState {}
