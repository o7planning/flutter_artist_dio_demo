part of '../model.dart';

@JsonSerializable()
class CurrencyData implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String? description;

  CurrencyData(this.id, this.symbol, this.name);

  CurrencyData.named({
    required this.id,
    required this.symbol,
    required this.name,
    this.description,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDataToJson(this);

  @override
  String toString() {
    return "CurrencyData($id, $name)";
  }
}
