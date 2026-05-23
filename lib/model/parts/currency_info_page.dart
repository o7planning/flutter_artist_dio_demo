part of '../model.dart';

@JsonSerializable()
class CurrencyInfoPage extends PageDataImpl<CurrencyInfo> {
  CurrencyInfoPage({required super.items, required super.paginationInfo});

  factory CurrencyInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CurrencyInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyInfoPageToJson(this);
}
