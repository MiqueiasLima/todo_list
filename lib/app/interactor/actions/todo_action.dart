import 'package:asp_arch/app/injector.dart';
import 'package:asp_arch/app/interactor/atoms/todo_atom.dart';
import 'package:asp_arch/app/interactor/model/todo_model.dart';
import 'package:asp_arch/app/interactor/repositories/todo_repository.dart';

var _autoIncrement = 4;



Future<void> fetchTodos() async {

final repository = injector.get<TodoRepository>();
todoState.value = await repository.getAll();
}

Future<void> putTodos(TodoModel model) async {
  final repository = injector.get<TodoRepository>();

  if(model.id == -1){
    await repository.insert(model);
  }else{
    await repository.update(model);
  }
  fetchTodos();
}

Future<void> deleteTodos(int id) async {
  final repository = injector.get<TodoRepository>();
  await repository.delete(id);
  fetchTodos();
}