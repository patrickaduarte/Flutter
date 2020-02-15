import 'package:mobx/mobx.dart';
import 'package:observable_list/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  

  @observable
  ObservableList<ItemModel> listItems = ObservableList<ItemModel>().asObservable();

  @computed
  int get totalChecked => listItems.where((item) => item.check).length;

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return listItems;
    }
    else {
      return listItems
        .where((item) => 
          item.title.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    }
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }
  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }

}