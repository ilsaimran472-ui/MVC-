import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/app/data/models/api_exception.dart';
import 'package:mvc/app/data/models/api_request_model.dart';
import 'package:mvc/app/data/repositeries/auth_repository.dart';
import 'package:mvc/app/data/repositeries/session_service.dart';
import 'package:mvc/app/routes/routes_management.dart';
import '../../../routes/app_routes.dart';



class LoginController extends GetxController {
  final AuthRepository _authRepository;
  final SessionService _session = Get.find<SessionService>();

  LoginController({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

// these are the form key and text controllers for the login form

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// these are the observable variables for the loading state and password visibility
  final isLoading = false.obs;
  final obscurePassword = true.obs;

  void toggleObscure() => obscurePassword.value = !obscurePassword.value;

// This method is called when the user taps the login button. It validates the form, sends the login request, and handles the response.
  Future<void> loginmethod() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    try {
      final request = LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final authResponse = await _authRepository.login(request);
      await _session.saveSession(authResponse);

      Get.offAllNamed(Routes.HOME);
      Get.snackbar('Welcome', 'Logged in successfully');
    } on ApiException catch (e) {
      Get.snackbar('Login Failed', e.message,
          backgroundColor: Colors.red.shade50);
    } catch (e) {
      Get.snackbar('Login Failed', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }


// This method is called when the user taps the "Sign Up" button. It navigates to the signup page.
  void goToSignup() => Get.toNamed(Routes.SIGNUP);


// This method is called when the user taps the "Forgot Password" button. It navigates to the forgot password page.
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
