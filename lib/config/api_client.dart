import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_dio/flutter_artist_dio.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../model/model.dart';
import 'api_endpoints.dart';
import 'token_storage_impl.dart';

// Create FlutterArtistDio to use in this Application.
final flutterArtistDio = _createFlutterArtistDio();

// For Download.
final flutterArtistDio4Download = _createFlutterArtistDio(bytesResponse: true);

// *****************************************************************************

//
// (Optional, using [fresh_dio] package)
// This package help you add [Authorization] to headers and refresh if it expires.
// Note: LoggedInUserData implements OAuth2Token (fresh_dio package).
//
final fresh = Fresh.oAuth2<LoggedInUserData>(
  tokenStorage: TokenStorageImpl(),
  tokenHeader: (LoggedInUserData token) {
    return {"Authorization": "Bearer ${token.accessToken}"};
  },
  refreshToken: (LoggedInUserData? token, Dio client) {
    // Perform refresh and return new token
    throw UnimplementedError('Refresh token not supported!');
  },
);

// *****************************************************************************

FlutterArtistDio _createFlutterArtistDio({bool bytesResponse = false}) {
  // Create Dio object with BaseOptions.
  final Dio _dio = bytesResponse
      ? Dio(BaseOptions(baseUrl: appBaseURL, responseType: ResponseType.bytes))
      : Dio(
          BaseOptions(
            baseUrl: appBaseURL,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*',
            },
          ),
        );

  // Optional.
  // This interceptor help you add [Authorization] to headers and refresh if it expires.
  _dio.interceptors.add(fresh);

  // Logger Interceptor (Optional)
  final loggerInterceptor = FlutterArtistDioLoggerInterceptor();
  _dio.interceptors.add(loggerInterceptor);

  return FlutterArtistDio(dio: _dio, pageMapping: PageMapping());
}

// *****************************************************************************
