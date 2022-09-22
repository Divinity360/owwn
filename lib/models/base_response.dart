class BaseResponse<T> {
  const BaseResponse({this.error, this.data});

  final String? error;
  final T? data;
}
