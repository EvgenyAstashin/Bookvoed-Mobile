import 'package:bookvoed/entity/book.dart';
import 'package:bookvoed/mvp/base_view.dart';

abstract class MyBooksView extends BaseView {

  void showProgress();

  void showError(String message);

  void showBooks(List<Book> books);

  void showNothing();
}