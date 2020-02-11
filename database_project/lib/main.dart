import 'package:database_project/ui/helper_db.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

void main() async {
  runApp(new Home());
  //OPEN DATABASE
  var db = new DataBaseHelper();
  
  //CREATE USER
  //int insertUser = await db.insertUser(User("Arão","12344"));
  
  //LIST USERS
  //List users = await db.takeUsers();
  //print(users); 
  
  //COUNT USERS
  //int countUsers = await db.takeCount();
  
  //PICK UP SPECIFIC USER FROM ID
  //User printUser = await db.takeUser(id); 

  //DELETE USER
  //await db.deleteUser(1); 
  
  //UPDATE USER
  /* User updateUser = User.fromMap(
    {
      "name": "new name",
      "pass": "new pass",
      "id": id
    }
  );
  int updated = await db.updateUser(updateUser); */
  
  //CLOSE DATABASE
  //db = await db.close();
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DB Project"),
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
      ),
    );
  }
}