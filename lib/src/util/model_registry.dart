import 'package:mflow/src/modules/expense/model/expense_model.dart';

class ModelRegistry{
  static Map<Object, dynamic> modelMap = {};

  static register(Type model, instance){
    modelMap[model] = instance;
  }

  static get(Type model){
    return modelMap[model];
  }
}