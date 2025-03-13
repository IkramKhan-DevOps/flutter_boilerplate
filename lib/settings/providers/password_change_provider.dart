
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/settings_provider.dart';
import '../../core/errors/app_errors.dart';
import '../../core/network/api_network.dart';
import '../../core/network/api_urls.dart';

class PasswordChangeProvider extends StateNotifier<bool> {

  final NetworkApiService apiServices;
  PasswordChangeProvider(this.apiServices) : super(false);

  Future<void> changePasswordAPI(dynamic data, BuildContext context) async {
    state = true;
    try {
      var response = await apiServices.postAPI(APIUrl.passwordChange, data, true, true);
      Toast.show(context, "Password changed successfully", 'success');
    } catch (error) {
      Toast.show(context, error.toString(), 'danger');
    } finally {
      state = false;
    }
  }
}

final passwordChangeProvider = StateNotifierProvider<PasswordChangeProvider, bool>((ref) {
  final apiServices = ref.read(apiServicesProvider);
  return PasswordChangeProvider(apiServices);
});
