import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_errors.dart';
import '../../../core/network/api_network.dart';
import '../../../core/network/api_urls.dart';
import '../../../core/storage/auth_storage.dart';
import '../../../providers/settings_provider.dart';


class SignUpNotifier extends StateNotifier<bool> {
  final NetworkApiService apiServices;

  SignUpNotifier(this.apiServices) : super(false); // Initial state is not loading

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    state = true; // Set loading to true
    try {

      // Call the API service to sign up
      var response = await apiServices.postAPI(APIUrl.signUp, data);
      Toast.show(context, 'Sign Up Successful, Verification email has been sent to your email', 'success');
      Navigator.pop(context);

    } catch (error) {
      Toast.show(context, error.toString(), 'danger');
    } finally {
      state = false; // Set loading to false in both success and failure cases
    }
  }

  Future<void> afterSignUpSuccess(String token) async {
    AuthToken.saveToken(token); // Save token after login
  }
}

// Provider for SignUpNotifier
final signUpProvider = StateNotifierProvider<SignUpNotifier, bool>((ref) {
  final apiServices = ref.read(apiServicesProvider);  // Fetch the API services
  return SignUpNotifier(apiServices);  // Pass the API service to the notifier
});