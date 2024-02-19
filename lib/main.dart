import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<TodoItem> todoItems = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('todoItems');
    if (data != null) {
      var list = jsonDecode(data) as List;
      setState(() {
        todoItems = list.map((item) => TodoItem.fromJson(item)).toList();
      });
    }
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todoItems', jsonEncode(todoItems));
  }

  void navigateToAddItemScreen() {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return AddItemScreen(
      todoItems: todoItems,
      onAddItem: (newItem) {
        setState(() {
          todoItems.add(newItem);
        });
        saveData();
      },
    );
  }));
}


  void navigateToCurrentItemScreen(TodoItem item) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CurrentItemScreen(todoItem: item);
    })).then((_) {
      setState(() {});
      saveData();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Мои задачи'),
      ),
      body: ListView.builder(
  itemCount: todoItems.length,
  itemBuilder: (context, index) {
    return Dismissible(
      key: Key(todoItems[index].title),
      onDismissed: (direction) async {
        final scaffoldMessenger = ScaffoldMessenger.of(context);

        final prefs = await SharedPreferences.getInstance();
        prefs.remove(todoItems[index].title);

        setState(() {
          todoItems.removeAt(index);
        });
          saveData();
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Задача удалена')),
        );
      },
      child: GestureDetector(
        onTap: () {
          navigateToCurrentItemScreen(todoItems[index]);
        },
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
