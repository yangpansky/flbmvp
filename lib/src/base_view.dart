import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';
import 'package:flutter/material.dart';

abstract class BaseState<P extends IBPresenter<IBView>, V extends StatefulWidget> extends State<V> implements IBView {
  P _presenter;
  bool _isShowLoading = false;

  @override
  @mustCallSuper
  void showLoading() {
    _isShowLoading = true;
  }

  @override
  @mustCallSuper
  void hideLoading() {
    _isShowLoading = false;
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _presenter = createPresenter();
    _presenter?.attachView(this);
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    if(_isShowLoading) {
      hideLoading();
    }
    _presenter?.detachView();
    _presenter = null;
  }

  P createPresenter();
  P get presenter => _presenter;

  @override
  bool get isLoading => _isShowLoading;
}