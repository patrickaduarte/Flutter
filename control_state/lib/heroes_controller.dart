import 'package:control_state/hero_model.dart';
import 'package:flutter/widgets.dart';

class HeroesController extends ChangeNotifier{

  List<HeroModel> heros  = [
    HeroModel(name: "Thor"),
    HeroModel(name: "Hulk"),
    HeroModel(name: "Iron Man"),
    HeroModel(name: "Captain America"),
    HeroModel(name: "Black Widow"),
    HeroModel(name: "Hawkeye"),
  ];

  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

}