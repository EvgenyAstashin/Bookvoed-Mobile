import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/network/books/books_api.dart';
import 'package:bookvoed/screens/main/main_view.dart';
import 'package:bookvoed/utils/preferences.dart';
import 'package:bookvoed/utils/text_utils.dart';

class MainPresenter extends BasePresenter<MainView> {

  BooksApi _booksApi;

  MainPresenter(MainView view, this._booksApi) : super(view);

  void logout() {
    Preferences.clearUserCredentials();
    view.openLoginScreen();
  }

  void onUserClicked() {
    view.openUserScreen();
  }

  String getUserFirstSecondName() {
    var user = AppValues.get().user;
    if(isStringNotEmpty(user.firstName))
      return "${user.firstName} ${user.secondName}";
    else return user.userName;
  }

  String getUserAvatar() {
    return AppValues.get().user.avatar;
  }

  void addBook() {
    view.getBarcode().then((isbn) {
      _loadBooks(isbn);
    });
  }

  void _loadBooks(String isbn) {
    view.showProgress(true);
    _booksApi.getBook(isbn).then((book){
      view.showProgress(false);
      view.openAddBookScreen(book);
    }).catchError((error) {
      view.showProgress(false);
      view.showError(error.toString());
    });
  }
}