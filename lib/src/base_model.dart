import 'package:flbmvp/src/ib_model.dart';

abstract class BaseModel implements IBModel {
  BaseModel() {
    _tag = '${DateTime.now().millisecondsSinceEpoch}';
  }

  String _tag;
  String get tag => _tag;
}