import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:practiseproject/main.dart';
import 'package:practiseproject/todo.dart';


final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) => TodoProvider(ref.read(todoBox)));

class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);
  void add(Todo todo){
    Hive.box<Todo>('todos').add(todo);
    state = [...state, todo];

}
void edit(Todo todo){

}
void remove(Todo todo){

}
}