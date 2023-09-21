import 'index.dart';

class FirebaseClient implements IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool? customHeaders}) {
    // return "";
    return Future.value(MappedNetworkServiceResponse<T>());
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, data,
      {bool customHeaders = false}) {
    // return "";
    return Future.value(MappedNetworkServiceResponse<T>());
  }
}
