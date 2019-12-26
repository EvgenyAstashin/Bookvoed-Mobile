import 'dart:io';

import 'package:bookvoed/app_values.dart';
import 'package:bookvoed/entity/user.dart';
import 'package:bookvoed/mvp/base_presenter.dart';
import 'package:bookvoed/mvp/base_view.dart';
import 'package:bookvoed/network/user/user_api.dart';
import 'package:bookvoed/screens/user/user_view.dart';
import 'package:bookvoed/utils/text_utils.dart';
import 'package:image_picker/image_picker.dart';

class UserPresenter extends BasePresenter<UserView> {

  UserApi _userApi;

  File _uploadedAvatar;

  UserPresenter(BaseView view, this._userApi) : super(view) {
    _setUserData();
  }

  void sendUserData() {
    view.showProgress(true);
    var builtUser = _buildUser();

    if(_uploadedAvatar != null) {
      _userApi.uploadAvatar(_uploadedAvatar).then((response){
        _userApi.updateUser(builtUser).then((user) {
          AppValues.get().user = user;
          view.showProgress(false);
          view.goNext();
        }).catchError((error) {
          view.showProgress(false);
          view.showErrorMessage(error.toString());
        });
      }).catchError((error) {
        view.showProgress(false);
      });
    }
  }

  void _setUserData() {
    var user = AppValues.get().user;
    view.setFirstName(user.firstName);
    view.setSecondName(user.secondName);
    if(isStringNotEmpty(user.avatar))
      view.setAvatarFromNetwork(user.avatar);
  }

  void chooseAvatar() async {
    ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      _uploadedAvatar = image;
      view.setAvatarFromFile(_uploadedAvatar);
    });
  }

  User _buildUser() {
    var savedUser = AppValues.get().user;
    return User(savedUser.userName, view.getFirstName(), view.getSecondName());
  }
}
