
import 'ib_model.dart';
import 'ib_view.dart';
import 'ib_presenter.dart';

abstract class BasePresenter<V extends IBView, M extends IBModel> implements IBPresenter {
  M _model;
  V _view;

  @override
  void attachView(IBView view) {
    this._model = createModel();
    this._view = view;
  }

  @override
  void detachView() {
    if(_view != null) {
      _view = null;
    }
    if(_model != null) {
      _model.dispose();
      _model = null;
    }
  }

  V get view => _view;
  M get model => _model;

  IBModel createModel();
}