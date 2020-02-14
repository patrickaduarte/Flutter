import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:observable_list/components/item_widget.dart';
import 'package:observable_list/controllers/home_controller.dart';
import 'package:observable_list/models/item_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {

    var model = ItemModel();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Add item"),
          content: TextField(
            onChanged: model.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New item'
            ), 
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                controller.addItem(model);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Search"),
        ),
				actions: <Widget>[
					IconButton(
						icon: Observer(
							builder: (_) {
								return Text("${controller.totalChecked}");
							},
						),
						onPressed: () {},
					)
				],
      ),
      body: Observer(
				builder: (_) {
					return ListView.builder(
						itemCount: controller.listItems.length,
						itemBuilder: (_, index) {
							var item = controller.listItems[index];
							return ItemWidget(item: item, removeClicked: (){
								controller.removeItem(item);
							},);
						},
					);
				},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}