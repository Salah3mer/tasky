class UserModel {
  final String? id;
  final String? accessToken;
  final String? refreshToken;
  final String? displayName;

  const UserModel(
      {this.displayName, this.id, this.accessToken, this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String?,
        accessToken: json['access_token'] as String?,
        refreshToken: json['refresh_token'] as String?,
        displayName: json['displayName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'displayName': displayName,
      };
}
