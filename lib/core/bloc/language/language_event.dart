part of 'language_bloc.dart';

/// Base class for all language-related events.
abstract class LanguageEvent {}

/// Toggles between `en` ↔ `ar`.
class ToggleLanguageEvent extends LanguageEvent {}
