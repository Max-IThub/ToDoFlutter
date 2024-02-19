import 'package:flutter/material.dart';

class CurrentItemScreen extends StatelessWidget {
  const CurrentItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактирование задачи'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          }
        )
      ),
      body:const Center(
        child: Text('Тут должна быть текущая задача'),
      ),
    );
  }
}