import 'package:flutter/material.dart';
import 'package:todo_list/todoitem.dart';

class CurrentItemScreen extends StatefulWidget {
  final TodoItem todoItem;

  const CurrentItemScreen({Key? key, required this.todoItem}) : super(key: key);

  @override
  CurrentItemScreenState createState() => CurrentItemScreenState();
}

class CurrentItemScreenState extends State<CurrentItemScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todoItem.title);
    _descriptionController = TextEditingController(text: widget.todoItem.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Задача "${widget.todoItem.title}"'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Название',
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Описание',
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                widget.todoItem.title = _titleController.text;
                widget.todoItem.description = _descriptionController.text;
                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
