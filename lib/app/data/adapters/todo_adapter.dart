import 'package:asp_arch/app/interactor/model/todo_model.dart';

class TodoAdapter {
  static Map<String, dynamic> toMap(TodoModel model) {
    return {
      'id': model.id,
      'title': model.title,
      'check': model.check,
    };
  }

  static TodoModel fromMap(Map<String, dynamic> toMap) {
    return TodoModel(
        id: toMap['id'],
        title: toMap['title'],
        check: toMap['check'],
    );
  }
}
