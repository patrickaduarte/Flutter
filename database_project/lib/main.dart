import 'package:database_project/ui/helper_db.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

List _allUsers = [];

void main() async {
  runApp(new Home());
  var db = new DataBaseHelper();
  _allUsers = await db.takeUsers();
  
}
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DB Project"),
          backgroundColor: Colors.black38,
        ),
        body: ListView.builder(
          itemCount: _allUsers.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("${User.fromMap(_allUsers[position]).name.substring(0,1)}"),
                ),
                title: Text("User: ${User.fromMap(_allUsers[position]).name}"),
                subtitle: Text("Id: ${User.fromMap(_allUsers[position]).id}"),
                onTap: () => debugPrint("Password: ${User.fromMap(_allUsers[position]).pass}"),
              ),
            );
          },
        ),
      ),
    );
  }
}