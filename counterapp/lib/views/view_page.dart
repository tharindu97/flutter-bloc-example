import 'package:counterapp/bloc/todos_bloc.dart';
import 'package:counterapp/models/todos_model.dart';
import 'package:flutter/material.dart';

class AllTodos extends StatefulWidget {
  @override
  _AllTodosState createState() => _AllTodosState();
}

class _AllTodosState extends State<AllTodos> {
  final todoBloc = TodosBloc();
  @override
  void initState() {
    todoBloc.eventSink.add(TodosAction.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Patterns'),
      ),
      body: StreamBuilder<List<TodosModel>>(
        stream: todoBloc.todoStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Text("Data is Have!!!!"),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Error!!!"),
            );
          }
          return Container();
        },
      ),
    );
  }
}
