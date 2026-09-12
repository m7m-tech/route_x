// lib/core/storage/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Abstraction over the platform keychain/keystore that holds the user's
/// session (access token, refresh token and identity metadata).
///
/// The data layer depends on this interface — never on
/// `flutter_secure_storage` directly — so tests can inject a fake.
abstract class SecureStorageService {
  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();
  Future<String?> readUserId();
  Future<String?> readUserRole();

  /// Persists both tokens after a refresh cycle.
  Future<void> writeTokens({
    required String accessToken,
    required String refreshToken,
  });

  /// Persists a full new session (login / OTP verification / google).
  Future<void> writeSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String role,
  });

  /// Wipes every stored key (logout, refresh failure).
  Future<void> clear();
}

/// Concrete [SecureStorageService] backed by `flutter_secure_storage`.
///
/// Reads/writes sensitive session data to the platform keychain (iOS) or
/// Android EncryptedSharedPreferences. Registered as a **LazySingleton** in
/// the DI container so the same instance is used across the app lifecycle.
class SecureStorageServiceImpl implements SecureStorageService {
  /// Creates the service, optionally accepting a custom [FlutterSecureStorage]
  /// for testing.
  SecureStorageServiceImpl({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';
  static const _userIdKey = 'auth_user_id';
  static const _userRoleKey = 'auth_user_role';

  @override
  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  @override
  Future<String?> readUserId() => _storage.read(key: _userIdKey);

  @override
  Future<String?> readUserRole() => _storage.read(key: _userRoleKey);

  @override
  Future<void> writeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<void> writeSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String role,
  }) async {
    await writeTokens(accessToken: accessToken, refreshToken: refreshToken);
    await _storage.write(key: _userIdKey, value: userId);
    await _storage.write(key: _userRoleKey, value: role);
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _userRoleKey);
  }
}
