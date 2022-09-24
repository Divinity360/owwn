import 'package:fluttertoast/fluttertoast.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';
import 'package:owwn_coding_challenge/widgets/cards/user_item_card.dart';

class AppHelpers {
  AppHelpers._();

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.red,
    );
  }

}
