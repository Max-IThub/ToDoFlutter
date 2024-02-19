

import 'package:flutter/material.dart';
import 'package:todo_list/add_item_screen.dart';
import 'package:todo_list/current_item_screen.dart';
import 'package:todo_list/todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();



}

class _MyHomePageState extends State<MyHomePage> {

  void navigateToAddItemScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const AddItemScreen();
    }));
  }

  void navigateToCurrentItemScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const CurrentItemScreen();
    }));
  }

  List<TodoItem> todoItems = [
    TodoItem(title: 'Домашка', isCompleted: false, description: 'Сделать домашку в 5 вечера'),
    TodoItem(title: 'Помыть посуду', isCompleted: false, description: 'Помыть посуду в 5 вечера'),
    TodoItem(title: 'Купить молоко', isCompleted: false, description: 'Купить молоко в 5 вечера'),
    TodoItem(title: 'Купить хлеб', isCompleted: false, description: 'Купить хлеб в 5 вечера'),
    TodoItem(title: 'Купить масло', isCompleted: false, description: 'Купить масло в 5 вечера'),
    TodoItem(title: 'Купить корм', isCompleted: false, description: 'Купить корм в 5 вечера'),
    TodoItem(title: 'Купить хлеб', isCompleted: false, description: 'Купить хлеб в 5 вечера'),
    TodoItem(title: 'Купить масло', isCompleted: false, description: 'Купить масло в 5 вечера'),
    TodoItem(title: 'Купить корм', isCompleted: false, description: 'Купить корм в 5 вечера'),
    TodoItem(title: 'Купить хлеб', isCompleted: false, description: 'Купить хлеб в 5 вечера'),
  ];
 

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
      onTap: () {
        navigateToCurrentItemScreen();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4,),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color:Theme.of(context).colorScheme.inversePrimary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(todoItems[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text(todoItems[index].description ?? ''),
            ],
          ),
        ),
      ),
    );
  }
),

      floatingActionButton: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.inversePrimary)),
        child:const Icon(Icons.add, color: Colors.black,),
        onPressed: (){
          navigateToAddItemScreen();
        },
      ),
    );
  }
}