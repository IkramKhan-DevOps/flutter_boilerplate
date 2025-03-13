
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/settings_provider.dart';
import '../../core/errors/app_errors.dart';
import '../../core/network/api_network.dart';
import '../../core/network/api_urls.dart';
import '../../core/storage/auth_storage.dart';

class AccountRemoveStateNotifier extends StateNotifier<bool> {

  final NetworkApiService apiServices;
  AccountRemoveStateNotifier(this.apiServices) : super(false);

  Future<void> removeAccount(dynamic data, BuildContext context, WidgetRef ref, [bool isDelete = false]) async {
    state = true;
    String url = isDelete ? APIUrl.accountDelete : APIUrl.accountDeactivate;
    try {

      var response = await apiServices.postAPI(url, data, true, true);
      Toast.show(context, "Your account ${isDelete ? 'deactivated': 'deleted'} successfully.", 'success');
      AuthToken.logoutUser(context);

    } catch (error) {
      Toast.show(context, error.toString(), 'danger');
    } finally {
      state = false;
    }
  }
}

final accountRemoveProvider = StateNotifierProvider<AccountRemoveStateNotifier, bool>((ref) {
  final apiServices = ref.read(apiServicesProvider);
  return AccountRemoveStateNotifier(apiServices);
});
