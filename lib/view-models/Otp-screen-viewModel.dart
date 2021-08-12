import 'package:flutter_demo_project/services/api-service.dart';

class OTPScreenViewModel {
  verifyOtp(context, otp) async {
    var userData = await ApiService().verifyOtp(context, otp);

    if (userData == null) {
      return 1;
    }
  }
}
