import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counterapp/models/todos_model.dart';

class TodosService {
  Future<List<TodosModel>?> getTodos() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body).map<TodosModel>((data) {
          return TodosModel.fromJson(data);
        }).toList();
      }
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
