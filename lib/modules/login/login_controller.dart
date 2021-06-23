import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> signIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final response = await _googleSignIn.signIn();
      final user =
          User(name: response!.displayName!, photoUrl: response.photoUrl);
      authController.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
