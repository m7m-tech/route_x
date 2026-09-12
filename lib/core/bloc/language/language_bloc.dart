import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

/// Global Bloc that manages the app-wide locale (en ↔ ar).
///
/// Provided at the root of the widget tree via `MultiBlocProvider`
/// so that any screen can `context.read<LanguageBloc>().add(ToggleLanguageEvent())`.
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState.initial()) {
    on<ToggleLanguageEvent>(_onToggleLanguage);
  }

  void _onToggleLanguage(
    ToggleLanguageEvent event,
    Emitter<LanguageState> emit,
  ) {
    final newCode = state.languageCode == 'en' ? 'ar' : 'en';
    emit(state.copyWith(languageCode: newCode));
  }
}
