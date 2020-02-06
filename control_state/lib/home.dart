import 'package:control_state/hero_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'heroes_controller.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  _buildList(){
    HeroesController heroesController = Provider.of<HeroesController>(context);
    
    return ListView.builder(
      itemCount: heroesController.heros.length,
      itemBuilder: (context, index){
        return _buildItems(heroesController.heros[index]);
      },
    );
  }
  _buildItems(HeroModel model){

    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListTile(
      onTap: (){
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite ?
      Icon(Icons.star, color: Colors.yellow,) :
      Icon(Icons.star_border),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget){
            return Center(
              child: Text("${heroesController.heros.where((i) => i.isFavorite).length}",
                style: TextStyle(
                  fontSize: 18.0
                ),
              )
            );
          },
        ),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget){
          return _buildList();
        },
      ),
    );
  }
}