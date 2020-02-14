import 'package:mobx/mobx.dart';
import 'package:mobx_project/models/client.dart';

part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }
  String validateName(){
    if(client.name == null /* || client.name.isEmpty */){
      return "Required field";
    }
    else if(client.name.length < 3){
      return "Your name must be longer than 3 characters";   
    }
    return null;
  }
  String validateEmail(){
    if(client.email == null || client.email.isEmpty){
      return "Required field";
    }
    else if(!client.email.contains("@")){
      return "This is not a valid email";   
    }
    return null;
  }

  dispose(){
  }
}