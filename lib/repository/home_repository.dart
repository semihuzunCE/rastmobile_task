import 'package:rastmobile_task/models/task.dart';

import '../service/api_service.dart';

class TaskRepository {
  final ApiService _apiService = ApiService();

  Future<List<Task>?> fetchTaskList(String url) async {
    List<Task>? taskList=await _apiService.fetchTaskList(url);
    
    return taskList ;
  }
}
