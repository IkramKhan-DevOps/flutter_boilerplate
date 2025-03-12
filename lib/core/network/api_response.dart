
import 'api_status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.status, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete() : status = Status.COMPLETE;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }

}