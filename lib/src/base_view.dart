import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';
import 'package:flutter/material.dart';

abstract class BaseState<P extends IBPresenter<IBView>, V extends StatefulWidget> extends State<V> implements IBView {
  P _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = createPresenter();
    _presenter?.attachView(this);
  }

  void outSetState(VoidCallback fn) {
    setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    _presenter?.detachView();
    _presenter = null;
  }

  P createPresenter();
  P get presenter => _presenter;
}