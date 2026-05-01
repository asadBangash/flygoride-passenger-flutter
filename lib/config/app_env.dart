/// Environment passed at build time so one codebase can target staging,
/// production, or a local Laravel server without editing [functions.dart].
///
/// Examples:
/// ```text
/// flutter run --dart-define=API_BASE_URL=http://flygoride_backend.test/
/// flutter build apk --dart-define=API_BASE_URL=https://staging.flygoride.com/
/// ```
class AppEnv {
  AppEnv._();

  /// Matches Laravel `APP_WEBSITE_URL` / API host.
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://staging.flygoride.com/',
  );

  /// Ensures a trailing slash for `${url}api/v1/...` concatenation.
  static String normalizedApiBase() {
    final u = apiBaseUrl.trim();
    if (u.isEmpty) return 'https://staging.flygoride.com/';
    return u.endsWith('/') ? u : '$u/';
  }

  static const String mapsAndroidKey = String.fromEnvironment(
    'GOOGLE_MAPS_ANDROID_KEY',
    defaultValue: 'android map key',
  );

  static const String mapsIosKey = String.fromEnvironment(
    'GOOGLE_MAPS_IOS_KEY',
    defaultValue: 'ios map key',
  );
}
