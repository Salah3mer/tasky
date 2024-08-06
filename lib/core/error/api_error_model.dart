class ApiErrorModel {
  String? message;
  String? error;
  int? statusCode;

  ApiErrorModel({this.message, this.error, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      error: json['error'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
        'statusCode': statusCode,
      };
}
