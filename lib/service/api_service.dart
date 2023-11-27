import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rastmobile_task/models/task.dart';

class ApiService {
  Future<List<Task>?> fetchTaskList(String url) async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonTaskList = json.decode(response.body)["tasks"];
        var taskList = (jsonTaskList as List).map((e) => Task.fromJson(e)).toList();
        return taskList;
      } else {
        throw Exception("HTTP isteği başarısız: ${response.statusCode}");
      }
    } catch (e) {
      if (response?.body == null) {
        throw Exception("network_error");
      } else {
        throw Exception("parse_error");
      }
    }
  }
}
