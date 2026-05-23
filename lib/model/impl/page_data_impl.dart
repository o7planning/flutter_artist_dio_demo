part of '../model.dart';

///
/// Extending the [PageData] class is necessary
/// so that we can declare mappings between JSON and Dart objects.
///
abstract class PageDataImpl<I extends Object> extends PageData<I> {
  @override
  @JsonKey(name: 'pagination')
  PaginationInfoImpl? paginationInfo;
  @override
  @JsonKey(name: 'items', defaultValue: [])
  List<I> items = [];

  PageDataImpl({required this.paginationInfo, required this.items});
}
