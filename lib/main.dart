import 'package:flutter/material.dart';
import 'package:todo_list/add_item_screen.dart';
import 'package:todo_list/current_item_screen.dart';
import 'package:todo_list/todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todoItems = [
    TodoItem(title: 'Домашка', isCompleted: false, description: 'Сделать домашку в 5 вечера'),
    // остальные элементы...
  ];

  void navigateToAddItemScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AddItemScreen(
        todoItems: todoItems,
        onAddItem: (newItem) {
          setState(() {
            todoItems.add(newItem);
          });
        },
      );
    }));
  }

  void navigateToCurrentItemScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const CurrentItemScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: navigateToCurrentItemScreen,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(todoItems[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(todoItems[index].description ?? ''),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: navigateToAddItemScreen,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
