import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/todoitem.dart';

class Storage {
  static Future<void> saveData(String key, List<TodoItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(items.map((item) => item.toJson()).toList());
    prefs.setString(key, jsonString);
  }

  static Future<List<TodoItem>?> loadData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => TodoItem.fromJson(json)).toList();
    }
    return null;
  }

  static Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
