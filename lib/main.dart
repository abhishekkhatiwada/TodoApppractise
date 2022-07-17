
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practiseproject/form.dart';
import 'package:practiseproject/todo.dart';
import 'package:practiseproject/todo_provider.dart';



final todoBox = Provider<List<Todo>>((ref) => []);
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  final box = await Hive.openBox<Todo>('todos');
  runApp(ProviderScope(
      overrides: [
        todoBox.overrideWithValue(box.values.toList().cast<Todo>())
      ],
      child: Home()));
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
          body: Consumer(
            builder: (context,ref,child){
              final tododata = ref.watch(todoProvider);
              return Container(
                child: ListView.builder(
                    itemCount: tododata.length,
                    itemBuilder:(context,index){
                      return ListTile(
                        title: Text(tododata[index].title),

                      );
                    }),
              );
            },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(()=>Details()
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


