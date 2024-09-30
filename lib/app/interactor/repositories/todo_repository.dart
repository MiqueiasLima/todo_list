import 'package:asp_arch/app/interactor/model/todo_model.dart';

abstract class TodoRepository{

  Future<List<TodoModel>> getAll();

  Future<TodoModel> insert(TodoModel todoModel);

  Future<TodoModel> update(TodoModel todoModel);

  Future<bool> delete(int id);
}