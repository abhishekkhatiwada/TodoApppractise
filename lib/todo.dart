

import 'package:hive/hive.dart';
part 'todo.g.dart';
@HiveType(typeId: 0)
class Todo extends HiveObject{
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;

  Todo({required this.title , required this.description});


}