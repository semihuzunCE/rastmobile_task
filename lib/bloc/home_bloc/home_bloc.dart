import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rastmobile_task/commons/app_context.dart';
import 'package:rastmobile_task/commons/toast_message.dart';
import 'package:rastmobile_task/constants/api_endpoints.dart';
import 'package:rastmobile_task/enums/app_state.dart';
import 'package:rastmobile_task/repository/hive_repository.dart';
import 'package:rastmobile_task/repository/home_repository.dart';

import '../../models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(const HomeState(
            appState: AppState.loading,
            allTask: [],
            backlog: [],
            toDO: [],
            inProgress: [],
            lastTasks: [],
            floatingButtonIsVisible: true)) {
    on<GetAllTasks>(_getAllTask);
    on<SetTaskLists>(_setTaskLists);
    on<ChangeButtonVisibility>(_changeButtonVisibility);
    on<AddTask>(_addTask);
    on<AddLastTask>(_addLastTask);
  }

  FutureOr<void> _getAllTask(GetAllTasks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(appState: AppState.loading));

    var hiveRepo = HiveRepository();

    late List<Task>? allTasks;
    if (await hiveRepo.isBoxExist()) {
      await hiveRepo.openTaskBox();
      allTasks = hiveRepo.getAllTasks();
      emit(state.copyWith(appState: AppState.loaded, allTask: allTasks));
      add(SetTaskLists());
    } else {
      try {
        TaskRepository taskRepository = TaskRepository();

        allTasks = await taskRepository.fetchTaskList(ApiEndPoints.taskListUrl);

        emit(state.copyWith(appState: AppState.loaded, allTask: allTasks));
        add(SetTaskLists());

        hiveRepo.setAllTasks(allTasks!);
      } catch (e) {
        var currentContext =
            AppContext.navigationService.navigatorKey.currentContext;

        var toast = ToastMessage(context: currentContext!);
        toast.showToast(errorMessage: e.toString());

        emit(state.copyWith(appState: AppState.loaded));
      }
    }
  }

  FutureOr<void> _setTaskLists(
      SetTaskLists event, Emitter<HomeState> emit) async {
    List<Task> backlog = [];
    List<Task> toDo = [];
    List<Task> inProgress = [];
    List<Task> lastTasks = [];
    HiveRepository hiveRepository = HiveRepository();

    for (Task task in state.allTask) {
      switch (task.status) {
        case "Backlog":
          backlog.add(task);
          break;
        case "To Do":
          toDo.add(task);
          break;
        case "In Progress":
          inProgress.add(task);
          break;
      }
    }
    if (await hiveRepository.isLastTasksBoxExist()) {
      hiveRepository.openLastTasksBox();
      lastTasks = await hiveRepository.getAllLastTasks();
    }

    emit(state.copyWith(
        backlog: backlog,
        toDO: toDo,
        inProgress: inProgress,
        lastTasks: lastTasks));
  }

  FutureOr<void> _changeButtonVisibility(
      ChangeButtonVisibility event, Emitter<HomeState> emit) {
    emit(state.copyWith(floatingButtonIsVisible: event.visibility));
  }

  FutureOr<void> _addTask(AddTask event, Emitter<HomeState> emit) {
    var hiveRepo = HiveRepository();
    hiveRepo.addTask(event.task);
    add(GetAllTasks());
  }

  FutureOr<void> _addLastTask(
      AddLastTask event, Emitter<HomeState> emit) async {
    HiveRepository hiveRepository = HiveRepository();

    await hiveRepository.openLastTasksBox();
    await hiveRepository.addLastTask(event.task);
    add(SetTaskLists());
  }
}
