import 'package:flutter/material.dart';
import 'package:flbmvp/flbmvp.dart';
import '../detail_page.dart';
import 'login_contract.dart';
import 'login_bean.dart';
import 'login_presenter.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<ILoginPresenter, LoginPage> implements ILoginView {
  int _code;
  String _message;

  @override
  void loginSuccess(LoginBean data) {
    print('loginSuccess');
    setState(() {
      _code = data.age;
      _message = data.name;
    });
    Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return DetailPage();
      }));
    });
  }

  @override
  void loginFail(int code, String msg) {
    print('loginFail');
    setState(() {
      _code = code;
      _message = msg;
    });
  }

  void loginAction() {
    presenter.login('15930453330', '9999');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          Text('code: ${_code!=null?_code:''}'),
          Text('message: ${_message!=null?_message:''}'),
          GestureDetector(
            child: Text('登陆'),
            onTap: loginAction,
          ),
        ],
      ),
    );
  }

  @override
  void hideLoading() {
    print('hideLoading');
  }

  @override
  void showLoading() {
    print('showLoading');
  }

  @override
  ILoginPresenter createPresenter() {
    return LoginPresenter();
  }
}
