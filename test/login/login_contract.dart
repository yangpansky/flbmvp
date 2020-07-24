
import 'package:flbmvp/flbmvp.dart';

import 'login_bean.dart';

abstract class ILoginModel implements IBModel {
  // 登陆请求
  Future<T> login<T>(String phoneNo, String password);
}

abstract class ILoginPresenter implements IBPresenter<ILoginView> {
  //登陆入口
  void login(String phoneNo, String password);
}

abstract class ILoginView implements IBView {
  //登陆成功
  void loginSuccess(LoginBean data);
  // //登陆失败
  void loginFail(dynamic error);
}