// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
  json['id'] as String,
  json['symbol'] as String,
  json['name'] as String,
)..description = json['description'] as String?;

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'description': instance.description,
    };

CurrencyInfo _$CurrencyInfoFromJson(Map<String, dynamic> json) => CurrencyInfo(
  json['id'] as String,
  json['symbol'] as String,
  json['name'] as String,
);

Map<String, dynamic> _$CurrencyInfoToJson(CurrencyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
    };

LoggedInUserData _$LoggedInUserDataFromJson(Map<String, dynamic> json) =>
    LoggedInUserData(
      json['accessToken'] as String,
      (json['expiresIn'] as num?)?.toInt(),
      json['refreshToken'] as String?,
      json['scope'] as String?,
      json['tokenType'] as String?,
      json['email'] as String,
      json['isSystemUser'] as bool,
      json['userName'] as String,
    );

Map<String, dynamic> _$LoggedInUserDataToJson(LoggedInUserData instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'scope': instance.scope,
      'tokenType': instance.tokenType,
      'email': instance.email,
      'isSystemUser': instance.isSystemUser,
      'userName': instance.userName,
    };
