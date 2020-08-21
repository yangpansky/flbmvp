import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';
import 'package:flutter/material.dart';

abstract class BaseState<P extends IBPresenter<IBView>, V extends StatefulWidget> extends State<V> implements IBView {
  P _presenter;
  bool _isShowLoading = false;

  @override
  bool get isLoading => _isShowLoading;

  @override
  @mustCallSuper
  void showLoading() {
    print('BaseState showLoading, yuan _isShowLoading: $_isShowLoading');
    _isShowLoading = true;
  }

  @override
  @mustCallSuper
  void hideLoading() {
    print('BaseState hideLoading, yuan _isShowLoading: $_isShowLoading');
    _isShowLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _presenter = createPresenter();
    _presenter?.attachView(this);
  }

  @override
  void dispose() {
    super.dispose();
    hideLoading();
    _presenter?.detachView();
    _presenter = null;
  }

  P createPresenter();
  P get presenter => _presenter;
}