abstract class BaseApiService {

  Future<dynamic> getAPI(String url, [bool isToken]);
  Future<dynamic> postAPI(String url, dynamic data, [bool isToken, bool noJson]);
  Future<dynamic> putAPI(String url, dynamic data);
  Future<dynamic> deleteAPI(String url, [bool isToken, bool noJson]);

}