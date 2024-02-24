import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/Models/todo_models.dart';
import 'package:flutter_app/Provider/todo_provider.dart';
import 'package:provider/provider.dart';

class AddData extends StatefulWidget {
  AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _titleError = false;
  bool _descriptionError = false;
  var _userDataFuture;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<TodoProvider>(context, listen: true);

    var id = ModalRoute.of(context)?.settings.arguments;

    Future fetchData() async {
      if (id != null) {
        var Finaldata = await userProvider.getbyid(id);
        print("Finaldata");
        print(Finaldata);
        print(Finaldata.title);
        _title.text = Finaldata.title.toString();
        _description.text = Finaldata.description.toString();
      }
    }

    if (id != null) {
      fetchData();
    }

    Future updateUser() async {
      FocusScope.of(context).unfocus();
      final title = _title.text;
      final description = _description.text;
      final userdata newUser = userdata(title: title, description: description);
      final status = await userProvider.updateUser(newUser, id);
      print(status);
      if (status == "success") {
        _title.clear();
        _description.clear();
        const snackBar = SnackBar(
          content: Text('Data Updated Successfully'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        const snackBar = SnackBar(
          content: Text('Error Updating Data'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    Future saveUserData() async {
      FocusScope.of(context).unfocus();

      final title = _title.text;
      final description = _description.text;
      final userdata newUser = userdata(title: title, description: description);
      final status = await userProvider.createUser(newUser);
      print(status);
      if (status == "success") {
        _title.clear();
        _description.clear();
        const snackBar = SnackBar(
          content: Text('Data Added Successfully'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        const snackBar = SnackBar(
          content: Text('Error adding user'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(id != null ? "Update" : "Add ToDo"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                  controller: _title,
                  decoration: InputDecoration(
                      label: Text("Title"),
                      hintText: "Enter title",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please your title";
                    }
                  }),
              SizedBox(height: 24),
              TextFormField(
                  controller: _description,
                  maxLines: 3,
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text("Description"),
                    hintText: "Enter description",
                    errorText: _titleError ? 'Please enter description' : null,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter description";
                    }
                  }),
              SizedBox(height: 24),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (id != null) {
                            updateUser();
                          } else {
                            saveUserData();
                          }
                        }
                      },
                      child: Text(id != null ? "Update" : "Create")))
            ],
          ),
        ),
      )),
    );
  }
}
