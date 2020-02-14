import 'package:mobx/mobx.dart';
import 'package:observable_list/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  

  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item 1"),
    ItemModel(title: "Item 2"),
    ItemModel(title: "Item 3"),
  ].asObservable();


  @computed
  int get totalChecked => listItems.where((item) => item.check).length;

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }
  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }

}