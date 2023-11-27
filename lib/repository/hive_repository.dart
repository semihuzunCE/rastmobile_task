import 'package:hive_flutter/adapters.dart';
import 'package:rastmobile_task/models/task.dart';

class HiveRepository {
  Future<bool> isBoxExist() async {
    bool isExist = await Hive.boxExists("tasklist");
    return isExist;
  }

  bool isBoxOpen() {
    bool isOpen = Hive.isBoxOpen("tasklist");
    return isOpen;
  }

  Future<void> openTaskBox() async {
    await Hive.openBox<Task>("tasklist");
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
  }

  Future<void> addTask(Task task) async {
    var box = Hive.box<Task>("tasklist");
    await box.add(task);
  }

  List<Task> getAllTasks() {
    var box = Hive.box<Task>("tasklist");
    return box.values.toList();
  }

  Future<void> setAllTasks(List<Task> allTasks) async {
    for (var task in allTasks) {
      if (isBoxOpen()) {
        await addTask(task);
      } else {
        await openTaskBox();
        await addTask(task);
      }
    }
  }

  Future<bool> isLastTasksBoxExist() async {
    bool isExist = await Hive.boxExists("lasttasks");
    return isExist;
  }

  bool isLastTasksBoxOpen() {
    bool isOpen = Hive.isBoxOpen("lasttasks");
    return isOpen;
  }

  Future<void> openLastTasksBox() async {
    await Hive.openBox<Task>("lasttasks");
  }

  Future<List<Task>> getAllLastTasks() async{
    await openLastTasksBox();
    var box = Hive.box<Task>("lasttasks");
    return box.values.toList();
  }

  Future<void> addLastTask(Task task) async {
    var box = Hive.box<Task>("lasttasks");
    for(var boxTask in box.values){
      if(boxTask==task){
        return;
      }
    }

    if (box.isNotEmpty) {
      for (int i = box.length; i > 0; i--) {
        if (i == 3) {
          continue;
        }

        box.put(i, box.get(i - 1)!);
      }
    }

    box.put(0, task);
  }
}
