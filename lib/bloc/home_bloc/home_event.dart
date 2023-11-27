part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class GetAllTasks extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SetTaskLists extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeButtonVisibility extends HomeEvent {
  final bool visibility;
  ChangeButtonVisibility({required this.visibility});

  @override
  List<Object?> get props => [visibility];
}

class AddTask extends HomeEvent {
  final Task task;
  AddTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class AddLastTask extends HomeEvent {
final Task task;
AddLastTask({required this.task});


  @override
  List<Object?> get props => [task];
}
