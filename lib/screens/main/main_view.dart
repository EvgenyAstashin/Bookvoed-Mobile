import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/mvp/base_view.dart';

abstract class MainView extends BaseView {

  void openLoginScreen();

  void openUserScreen();

  Future<String> getBarcode();

  void showProgress(bool show);

  void showError(String message);

  void openAddBookScreen(Book book);
}