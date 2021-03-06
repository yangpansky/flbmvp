
import 'package:flbmvp/src/ib_model.dart';
import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';
import 'package:flutter/foundation.dart';

abstract class BasePresenter<V extends IBView, M extends IBModel> implements IBPresenter<V> {
  M _model;
  V _view;

  @override
  @mustCallSuper
  void attachView(IBView iView) {
    assert(iView != null);
    _model = createModel() as M;
    _view = iView as V;
  }

  @override
  void didAttachView(V iView) {
  }

  @override
  @mustCallSuper
  void detachView() {
    _view = null;
    _model?.dispose();
    _model = null;
  }

  V get view => _view;
  M get model => _model;

  IBModel createModel();
}