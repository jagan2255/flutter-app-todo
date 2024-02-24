import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Api/todo_apis.dart';
import 'package:flutter_app/Models/todo_models.dart';

class TodoProvider extends ChangeNotifier {
  late TodoApis todoApis = TodoApis();

  List<userdata> userData = [];

  Future<List<userdata>> getUserData() async {
    try {
      userData = await todoApis.fetchData();
      print("User data fetched successfully: $userData");
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return userData;
  }

  Future createUser(id) async {
    try {
      print(id);
      final userDatas = await todoApis.createUser(id);
      print("User data fetched successfully: $userData");
      if (userDatas == "success") {
        notifyListeners();
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future deleteUser(id) async {
    try {
      print(id);
      final userDatas = await todoApis.deleteData(id);
      print("User data fetched successfully: $userData");
      if (userDatas == "success") {
        notifyListeners();
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  updateUser(data, id) async {
    try {
      print(id);
      final userDatas = await todoApis.updateUser(data, id);
      print("User data fetched successfully: $userData");
      if (userDatas == "success") {
        notifyListeners();
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<userdata> getbyid(id) async {
    var userData2;
    try {
      userData2 = await todoApis.getbyid(id);
      print(userData2);

      print("User data fetched successfully: $userData2");
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return userData2;
  }
}
