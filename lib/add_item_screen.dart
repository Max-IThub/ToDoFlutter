import 'package:flutter/material.dart';
import 'package:todo_list/todoitem.dart';

class AddItemScreen extends StatelessWidget {
  final List<TodoItem> todoItems;
  final Function(TodoItem) onAddItem;

  AddItemScreen({Key? key, required this.todoItems, required this.onAddItem}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addItem() {
    String title = titleController.text;
    String description = descriptionController.text;

    TodoItem newItem = TodoItem(title: title, isCompleted: false, description: description);
    onAddItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить задачу'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Название задачи',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Описание задачи',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: addItem,
                child: const Text('Добавить задачу'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
