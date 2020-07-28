import 'package:flbmvp/src/ib_model.dart';

abstract class BaseModel implements IBModel {
  BaseModel(){
    _tag = createTag();
  }
  Object _tag;
  Object get tag => _tag;
  Object createTag();
}