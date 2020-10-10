import 'package:flbmvp/src/ib_view.dart';

abstract class IBPresenter<V extends IBView> {
  void attachView(V iView);
  void didAttachView(V iView);
  void detachView();
}