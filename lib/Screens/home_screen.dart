import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/Provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<TodoProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text("Home ")),
      body: SafeArea(
          child: FutureBuilder(
              future: userProvider.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        final userData = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            title: Text(userData.title.toString()),
                            subtitle: Text(userData.description.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/adddata',
                                        arguments: userData.sId);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .10),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Delete Item"),
                                          content: Text(
                                              "Are you sure you want to delete this item?"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Delete"),
                                              onPressed: () async {
                                                var status = await userProvider
                                                    .deleteUser(userData.sId);
                                                if (status == "success") {
                                                  Navigator.of(context).pop();
                                                  const snackBar = SnackBar(
                                                    content: Text(
                                                        'Deleted successfully'),
                                                    duration:
                                                        Duration(seconds: 3),
                                                    behavior: SnackBarBehavior
                                                        .floating, // Adjust duration as needed
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                } else {
                                                  Navigator.of(context).pop();
                                                  const snackBar = SnackBar(
                                                    content: Text('Error'),
                                                    duration:
                                                        Duration(seconds: 3),
                                                    behavior: SnackBarBehavior
                                                        .floating, // Adjust duration as needed
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adddata');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
