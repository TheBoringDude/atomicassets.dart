class BaseAPIResponse<T> {
  bool success;
  T? data;
  int? queryTime;
  String? message;

  BaseAPIResponse(
      {required this.success,
      required this.data,
      required this.queryTime,
      required this.message});

  factory BaseAPIResponse.fromJson(Map<String, dynamic> data) {
    return BaseAPIResponse(
        success: data["success"],
        data: data["data"],
        queryTime: data["query_time"],
        message: data["message"]);
  }
}
