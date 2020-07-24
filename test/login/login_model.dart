import 'package:flbmvp/flbmvp.dart';

import 'login_contract.dart';

class LoginModel extends BaseModel implements ILoginModel {
  @override
  void dispose() {
  }

  @override
  Future<LoginBean> login<LoginBean>(String phoneNo, String password) async{
    final LoginBean response = await Future.delayed(const Duration(seconds: 5), (){
      // return LoginBean('yangpan', 33);
      throw Exception('错误啦!!!');
    });
    return response;
  }
}