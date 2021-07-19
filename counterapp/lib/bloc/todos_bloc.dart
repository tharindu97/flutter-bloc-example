import 'dart:async';
import 'package:counterapp/models/todos_model.dart';
import 'package:counterapp/service/todos_service.dart';

enum TodosAction { Fetch }

class TodosBloc {
  final _stateStreamController = StreamController<List<TodosModel>>();
  StreamSink<List<TodosModel>> get _todorSink => _stateStreamController.sink;
  Stream<List<TodosModel>> get todoStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<TodosAction>();
  StreamSink<TodosAction> get eventSink => _eventStreamController.sink;
  Stream<TodosAction> get _eventStream => _eventStreamController.stream;

  TodosBloc() {
    _eventStream.listen((event) async {
      if (event == TodosAction.Fetch) {
        try {
          var todos = await TodosService().getTodos();
          (todos != null)
              ? _todorSink.add(todos)
              : _todorSink.addError("Somethong went wrong Fetch Data");
        } on Exception catch (e) {
          _todorSink.addError("Somethong went wrong $e");
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
