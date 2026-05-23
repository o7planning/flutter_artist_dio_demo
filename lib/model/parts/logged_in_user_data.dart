part of '../model.dart';

@JsonSerializable()
class LoggedInUserData implements ILoggedInUser, OAuth2Token {
  @override // for OAuth2Token
  @JsonKey(name: 'accessToken')
  String accessToken;

  @override // for OAuth2Token
  @JsonKey(name: "expiresIn")
  int? expiresIn;

  @override // for OAuth2Token
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  @override // for OAuth2Token
  @JsonKey(name: "scope")
  String? scope;

  @override // for OAuth2Token
  @JsonKey(name: "tokenType")
  String? tokenType;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  String email;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  bool isSystemUser;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  String userName;

  LoggedInUserData(
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tokenType,
    this.email,
    this.isSystemUser,
    this.userName,
  );

  LoggedInUserData.named({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
    required this.email,
    required this.isSystemUser,
    required this.userName,
  });

  factory LoggedInUserData.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedInUserDataToJson(this);

  @override
  DateTime? get expiresAt => null;

  @override
  DateTime? get issuedAt => null;
}
