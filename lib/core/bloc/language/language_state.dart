part of 'language_bloc.dart';

/// Holds the current language code (`en` or `ar`).
class LanguageState {
  final String languageCode;

  const LanguageState({required this.languageCode});

  /// Factory for the initial / default state.
  factory LanguageState.initial() => const LanguageState(languageCode: 'en');

  LanguageState copyWith({String? languageCode}) =>
      LanguageState(languageCode: languageCode ?? this.languageCode);
}
