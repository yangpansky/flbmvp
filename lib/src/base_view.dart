import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';
import 'package:flutter/material.dart';

abstract class BaseState<P extends IBPresenter<IBView>, V extends StatefulWidget> extends State<V> implements IBView {
  P _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = createPresenter();
    if(_presenter != null) {
      _presenter.attachView(this);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(_presenter != null) {
      _presenter.detachView();
      _presenter = null;
    }
  }

  P createPresenter();
  P get presenter => _presenter;
}