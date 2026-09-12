// lib/core/network/exception_mapper.dart
import 'package:dio/dio.dart';

import 'package:route_x/core/error/failures.dart';

/// Translates raw exceptions (mainly [DioException]) into domain [Failure]s.
///
/// Repositories use this so that no `DioException` ever leaks into the
/// presentation layer — the UI only ever sees [Failure] values.
class ExceptionMapper {
  const ExceptionMapper();

  /// Maps a raw [error] (typically a [DioException]) to a domain [Failure].
  ///
  /// Network-level problems become [NetworkFailure]; HTTP 400/422 become
  /// [ValidationFailure]; 401/403 become [UnauthorizedFailure]; everything
  /// else is a generic [ServerFailure].
  Failure map(Object error) {
    if (error is! DioException) {
      return ServerFailure(error.toString());
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.cancel:
      case DioExceptionType.transformTimeout:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        switch (code) {
          case 400:
          case 422:
            return ValidationFailure(_message(error) ?? 'Invalid input');
          case 401:
          case 403:
            return UnauthorizedFailure(_message(error) ?? 'Session expired');
          default:
            return ServerFailure(_message(error) ?? 'Something went wrong');
        }

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const NetworkFailure();
    }
  }

  /// Best-effort extraction of a human-readable message from the response body
  /// (`{"message": "..."}` or `{"error": "..."}`). Returns `null` when the
  /// shape is unknown — the real API contract is still to be confirmed.
  static String? _message(DioException error) {
    final data = error.response?.data;
    if (data is Map) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) return message;
      final errorField = data['error'];
      if (errorField is String && errorField.isNotEmpty) return errorField;
    }
    return null;
  }
}
