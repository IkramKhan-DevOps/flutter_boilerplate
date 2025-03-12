import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_errors.dart';
import '../../../core/network/api_network.dart';
import '../../../core/network/api_urls.dart';
import '../../../core/storage/auth_storage.dart';
import '../../../providers/settings_provider.dart';

// Login Notifier
class LoginNotifier extends StateNotifier<bool> {
  final NetworkApiService apiServices;

  LoginNotifier(this.apiServices) : super(false); // Initial state is not loading

  Future<void> loginAPI(dynamic data, BuildContext context) async {
    state = true; // Set loading to true
    try {
      var response = await apiServices.postAPI(APIUrl.signIn, data);
      await AuthToken.saveToken(response['key']);
      await AuthToken.checkLoginStatus(context);
    } catch (error) {
      Toast.show(context, error.toString(), 'danger');
    } finally {
      state = false;
    }
  }
}

// Provider for LoginNotifier
final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  final apiServices = ref.read(apiServicesProvider);  // Fetch the API services
  return LoginNotifier(apiServices);  // Pass the API service to the notifier
});