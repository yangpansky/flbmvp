import 'package:flbmvp/flbmvp.dart';
import 'login_contract.dart';
import 'login_bean.dart';

class LoginModel extends BaseModel implements ILoginModel {
  @override
  void dispose() {
  }

  @override
  void login(String phoneNo, String password, successCallback, failureCallback) {
    Future.delayed(Duration(seconds: 5))
    .then((value) {
      LoginBean bean = LoginBean('name', 25);
      successCallback(bean);
      // failureCallback(-1, '数据获取错误');
    });
  }
}