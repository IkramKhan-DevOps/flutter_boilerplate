
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/api_network.dart';

final apiServicesProvider = Provider<NetworkApiService>((ref) {
  return NetworkApiService(); // Instance of API service
});

