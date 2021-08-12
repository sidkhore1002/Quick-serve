import 'package:flutter_demo_project/services/api-service.dart';

class LoginScreenViewModel {
  loginwithEmail(context, email) async {
    var userData = await ApiService().loginWithEmail(context, email);

    if (userData == null) {
      return 1;
    }
  }
}
