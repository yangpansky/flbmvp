
import 'package:flbmvp/src/ib_model.dart';
import 'package:flbmvp/src/ib_presenter.dart';
import 'package:flbmvp/src/ib_view.dart';

abstract class BasePresenter<V extends IBView, M extends IBModel> implements IBPresenter<V> {
  M _model;
  V _view;

  @override
  void attachView(IBView view) {
    assert(view != null);
    _model = createModel() as M;
    _view = view as V;
  }

  @override
  void detachView() {
    _view = null;
    _model?.dispose();
    _model = null;
  }

  V get view => _view;
  M get model => _model;

  IBModel createModel();
}