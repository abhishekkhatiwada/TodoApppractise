import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practiseproject/todo.dart';
import 'package:practiseproject/todo_provider.dart';

class Details extends StatelessWidget {
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
              TextFormField(
                controller: detailController,
                decoration: InputDecoration(
                  hintText: 'description',
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                      onPressed: () {
                        _form.currentState!.save();
                        ref.read(todoProvider.notifier).add(Todo(
                            title: titleController.text,
                            description: detailController.text));
                      },
                      child: Text('Save'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
