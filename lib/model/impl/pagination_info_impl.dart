part of '../model.dart';

///
/// Implementing the [PaginationInfo] interface is necessary
/// so that we can declare mappings between JSON and Dart objects.
///
@JsonSerializable()
class PaginationInfoImpl implements PaginationInfo {
  @override
  @JsonKey(name: 'currentPage')
  int currentPage;
  @override
  @JsonKey(name: 'pageSize')
  int pageSize;
  @override
  @JsonKey(name: 'totalItems')
  int totalItems;
  @override
  @JsonKey(name: 'totalPages')
  int totalPages;

  PaginationInfoImpl({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
  });

  factory PaginationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoImplFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$PaginationInfoImplToJson(this);
}
