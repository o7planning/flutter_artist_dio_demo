import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/api_client.dart';
import '../config/api_endpoints.dart';
import '../model/model.dart';

class CurrencyRestProvider {
  // Base URL: https://o7planning.github.io
  // Path: /static/demo/flutter/flutter_artist_dio_demo/json/currency-infos.json
  Future<ApiResult<PageData<CurrencyInfo>>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    final String path =
        "/static/demo/flutter/flutter_artist_dio_demo/json/currency-infos.json";
    print("Base URL: $appBaseURL");
    print(" - Path: $path");

    // Base URL: https://o7planning.github.io
    // Path: /static/demo/flutter/flutter_artist_dio_demo/json/currency-infos.json
    ApiResult<PageData<CurrencyInfo>> result = await flutterArtistDio.jsonGetPage(
      path,
      queryParameters: queryParameters,
      converter: CurrencyInfo.fromJson,
    );
    return result;
  }

  // Base URL: https://o7planning.github.io
  // /static/demo/flutter/flutter_artist_dio_demo/json/USD.json
  // /static/demo/flutter/flutter_artist_dio_demo/json/EUR.json
  Future<ApiResult<CurrencyData>> find({required String currencyId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /static/demo/flutter/flutter_artist_dio_demo/json/USD.json
    ApiResult<CurrencyData> result = await flutterArtistDio.jsonGet(
      "/static/demo/flutter/flutter_artist_dio_demo/json/$currencyId.json",
      queryParameters: queryParameters,
      converter: CurrencyData.fromJson,
    );
    return result;
  }
}
