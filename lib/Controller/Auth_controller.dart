import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage _box = GetStorage();
  final RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    final email = _box.read('user_email');
    isLoggedIn.value = email != null;
  }

  void login(String email, String password) {
    // In a real app, you would validate credentials against a backend
    // For this demo, we'll just save the email to indicate logged in state
    _box.write('user_email', email);
    isLoggedIn.value = true;
  }

  void logout() {
    _box.remove('user_email');
    isLoggedIn.value = false;
  }
}
