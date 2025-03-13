import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_network.dart';
import '../../../core/network/api_network_base.dart';
import '../../../core/network/api_urls.dart';
import '../../../models/profile_model.dart';

final profileProvider=Provider<ProfileNotifier>((ref)=>ProfileNotifier());
final profileNetworkProvider = FutureProvider<ProfileModel>((ref) async{
  final user = ref.watch(profileProvider);
  return user.getProfile();
});

class ProfileLoadingNotifier extends StateNotifier<bool> {
  ProfileLoadingNotifier() : super(false);

  void setLoading(bool isLoading) {
    state = isLoading;
  }
}

// Create a provider for the loading state
final profileLoadingProvider = StateNotifierProvider<ProfileLoadingNotifier, bool>((ref) {
  return ProfileLoadingNotifier();
});


class ProfileNotifier {

  Future<ProfileModel> getProfile() async {
    final BaseApiService apiServices = NetworkApiService();
    final response = await apiServices.getAPI(APIUrl.profile, true);
    return ProfileModel.fromJson(response);
  }

  Future<void> updateProfile(Map<String, dynamic> updatedData) async {
    final BaseApiService apiServices = NetworkApiService();
    final response = await apiServices.putAPI(APIUrl.profile, updatedData);
  }

}
