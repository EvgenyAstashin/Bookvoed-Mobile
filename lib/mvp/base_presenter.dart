import 'package:bookvoed/mvp/base_view.dart';

abstract class BasePresenter<V extends BaseView> {

  BasePresenter(V view) {
    this.view = view;
  }

  V view;
}