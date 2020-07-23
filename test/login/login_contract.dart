
import 'package:flbmvp/flbmvp.dart';
import 'login_bean.dart';

typedef SuccessCallback<T> = Function(T data);
typedef FailureCallback = Function(int code, String msg);

abstract class ILoginModel<T> implements IBModel {
  // 登陆请求
  void login(String phoneNo, 
            String password, 
            SuccessCallback<LoginBean> successCallback, 
            FailureCallback failureCallback);
}

abstract class ILoginPresenter implements IBPresenter {
  //登陆入口
  void login(String phoneNo, String password);
}

abstract class ILoginView implements IBView {
  //登陆成功
  void loginSuccess(LoginBean data);
  // //登陆失败
  void loginFail(int code, String msg);
}