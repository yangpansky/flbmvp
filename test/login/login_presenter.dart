import 'package:flbmvp/flbmvp.dart';
import 'login_contract.dart';
import 'login_bean.dart';
import 'login_model.dart';

class LoginPresenter extends BasePresenter<ILoginView, ILoginModel> implements ILoginPresenter {
  @override
  IBModel createModel() {
    return LoginModel();
  }

  @override
  void login(String phoneNo, String password) {
    view?.showLoading();

    model?.login(phoneNo, password, (LoginBean data) {

      print('from model success');
      view?.hideLoading();
      view?.loginSuccess(data);

    }, (int code, String msg) {

      print('from model fail');
      view?.hideLoading();
      view?.loginFail(code, msg);
    });
  }
}