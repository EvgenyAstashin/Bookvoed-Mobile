import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart' as pd;

class ProgressDialog {

  pd.ProgressDialog _pd;

  ProgressDialog(BuildContext context, {message : 'Please wait...'}) {
    _pd = pd.ProgressDialog(context, type: pd.ProgressDialogType.Normal, isDismissible: false);
    _pd.style(message: message);
  }

  void show(bool show) {
    if(show)
      _pd.show();
    else
      _pd.hide();
  }
}