// =============================================================================
//  APP BASE URL: **************************************************************
// =============================================================================

///
/// Prefix URL for Rest API.
///
library;

/// Demo:
/// https://o7planning.github.io/static/demo/flutter_artist_dio_demo/json/currency-infos.json
///
/// IMPORTANT: If you run in localhost:
/// flutter run -d chrome --web-browser-flag "--disable-web-security"
///
const appBaseURL = "https://o7planning.github.io";

// =============================================================================
// STATIC RESOURCE BASE URL: ***************************************************
// =============================================================================

///
/// Prefix URL for Static Resources (Profile Image, Icon,..)
///
const staticResourceBaseURL = "https://o7planning.github.io";

// =============================================================================
//
// =============================================================================

String? getStaticResourceURL(String? path) {
  if (path == null || path.isEmpty) {
    return null;
  }
  if (path.startsWith("http://") || path.startsWith("https://")) {
    return path;
  }
  return "$staticResourceBaseURL$path";
}
