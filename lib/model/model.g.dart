// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationInfoImpl _$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    PaginationInfoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationInfoImplToJson(PaginationInfoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
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

CurrencyInfoPage _$CurrencyInfoPageFromJson(Map<String, dynamic> json) =>
    CurrencyInfoPage(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CurrencyInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paginationInfo: json['pagination'] == null
          ? null
          : PaginationInfoImpl.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CurrencyInfoPageToJson(CurrencyInfoPage instance) =>
    <String, dynamic>{
      'pagination': instance.paginationInfo,
      'items': instance.items,
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
