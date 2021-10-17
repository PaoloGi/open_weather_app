import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/widgets/error_dialog.dart';

import 'navigator_utils.dart';

abstract class ExtendedChangeNotifier extends ChangeNotifier {

  bool isLoading = false;

  void showError(String text) async {
    if(!kIsWeb){
      await ScaffoldMessenger.of(NavigatorUtils.navState.currentContext!).showSnackBar(
          SnackBar(
              content: Text(text),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 6)
          )
      ).closed;
    }
    else{
      DialogUtils.errorDialog(NavigatorUtils.navState.currentContext!, text: text);
    }
  }

  errorHandlingRest(Function function) async  {
    isLoading = true;
    notifyListeners();
    try{
      await function();
    }
    catch(ex, stacktrace){
      print("error function" + function.toString());
      print(ex.toString());
      print("Stack: $stacktrace");
      if(ex is FormatException){
        FormatException exe = ex;
        print(exe.source.toString() +" " + exe.message);
      }
      showError(ex.toString());
    }
    isLoading = false;
    notifyListeners();
  }

}
