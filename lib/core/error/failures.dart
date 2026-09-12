// lib/core/error/failures.dart
import 'package:equatable/equatable.dart';

/// Base class for all domain-level errors in the application.
abstract class Failure extends Equatable {
  const Failure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Represents a failure originating from client-side validation logic.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Represents a failure originating from an API or network operation.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents a failure originating from a network layer problem
/// (offline, timeouts, DNS) — distinct from a server that answered.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// Represents a 401/403 response — the session is missing, expired or the
/// refresh cycle failed. Consumers should route back to Login.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired']);
}

/// Represents a failure originating from local storage boundaries.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
