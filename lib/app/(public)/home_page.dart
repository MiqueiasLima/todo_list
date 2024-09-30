import 'package:asp/asp.dart';
import 'package:asp_arch/app/interactor/actions/todo_action.dart';
import 'package:asp_arch/app/interactor/atoms/todo_atom.dart';
import 'package:asp_arch/app/interactor/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodos();
  }

  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, title: '', check: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Todo"),
          content: TextFormField(
            initialValue: model?.title,
            onChanged: (value){
              model = model!.copyWith(title: value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                deleteTodos(model!.id);
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
            
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                putTodos(model!);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final todos = todoState.value;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) {
              final todo = todos[index];
              return GestureDetector(
                onLongPress: (){
                  editTodoDialog(todo);
                },
                child: CheckboxListTile(
                  title: Text(todo.title),
                  value: todo.check,
                  onChanged: (value) {
                    putTodos(
                      todo.copyWith(check: value!),
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: editTodoDialog,
              child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
