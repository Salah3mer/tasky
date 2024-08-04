class AuthErrorModel {
  String? message;
  String? error;
  int? statusCode;

  AuthErrorModel({this.message, this.error, this.statusCode});

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) {
    return AuthErrorModel(
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
