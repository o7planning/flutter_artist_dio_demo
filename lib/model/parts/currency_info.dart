part of '../model.dart';

@JsonSerializable()
class CurrencyInfo {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'name')
  String name;

  CurrencyInfo(this.id, this.symbol, this.name);

  CurrencyInfo.named({
    required this.id,
    required this.symbol,
    required this.name,
  });

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) =>
      _$CurrencyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyInfoToJson(this);

  @override
  String toString() {
    return "CurrencyInfo($id, $name)";
  }
}
