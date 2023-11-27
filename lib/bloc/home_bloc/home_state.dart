part of 'home_bloc.dart';

class HomeState extends Equatable {
  final AppState appState;
  final List<Task> allTask;
  final List<Task> backlog;
  final List<Task> toDO;
  final List<Task> inProgress;
  final List<Task> lastTasks;
  final bool floatingButtonIsVisible;

  const HomeState(
      {required this.appState,
      required this.allTask,
      required this.backlog,
      required this.toDO,
      required this.inProgress,
      required this.lastTasks,
      required this.floatingButtonIsVisible});
  HomeState copyWith(
      {AppState? appState,
      List<Task>? allTask,
      List<Task>? backlog,
      List<Task>? toDO,
      List<Task>? inProgress,
      List<Task>? lastTasks,
      bool? floatingButtonIsVisible}) {
    return HomeState(
        appState: appState ?? this.appState,
        allTask: allTask ?? this.allTask,
        backlog: backlog ?? this.backlog,
        toDO: toDO ?? this.toDO,
        inProgress: inProgress ?? this.inProgress,
        lastTasks: lastTasks ?? this.lastTasks,
        floatingButtonIsVisible:
            floatingButtonIsVisible ?? this.floatingButtonIsVisible);
  }

  @override
  List<Object> get props => [
        appState,
        allTask.hashCode,
        backlog.hashCode,
        toDO.hashCode,
        inProgress.hashCode,
        lastTasks.hashCode,
        floatingButtonIsVisible
      ];
}
