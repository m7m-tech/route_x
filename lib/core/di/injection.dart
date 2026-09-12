// lib/core/di/injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_x/core/network/auth_status_controller.dart';
import 'package:route_x/core/network/dio_client.dart';
import 'package:route_x/core/storage/secure_storage_service.dart';
import 'package:route_x/core/services/media/image_picker_service.dart';
import 'package:route_x/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:route_x/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:route_x/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:route_x/features/onboarding/domain/usecases/get_onboarding_items_usecase.dart';
import 'package:route_x/features/onboarding/presentation/bloc/onboarding_cubit.dart';
// import 'package:route_x/features/auth/data/datasources/auth_remote_data_source.dart';
// import 'package:route_x/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:route_x/features/auth/domain/repositories/auth_repository.dart';
// import 'package:route_x/features/auth/domain/repositories/login_repository.dart';
// import 'package:route_x/features/auth/domain/usecases/forgot_password_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/google_sign_in_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/login_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/pick_profile_image_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/refresh_token_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/register_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/reset_password_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/validate_signup_step1_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/validate_signup_step3_usecase.dart';
// import 'package:route_x/features/auth/domain/usecases/verify_otp_usecase.dart';
// import 'package:route_x/features/auth/presentation/bloc/forgot_password/forgot_password_cubit.dart';
// import 'package:route_x/features/auth/presentation/bloc/login/login_bloc.dart';
// import 'package:route_x/features/auth/presentation/bloc/signup/signup_bloc.dart';

/// Global [GetIt] service locator instance.
///
/// Access registered dependencies anywhere via `getIt<T>()`.
final getIt = GetIt.instance;

/// Registers every dependency the application needs.
///
/// Called once from `main()` before `runApp`. Dependencies are grouped by
/// layer: core/external first, then per-feature (data sources → repositories
/// → use-cases → BLoCs). All registrations use `LazySingleton` unless the
/// object must be fresh per usage (`Factory`).
void setupDependencyInjection() {
  // ── Core / External ───────────────────────────────────────────────────
  getIt.registerLazySingleton<ImagePickerService>(
    () => ImagePickerServiceImpl(),
  );

  // Session signal channel — the refresh interceptor fires forceLogout() on it
  // and the app root listens (see main.dart) to route back to Login.
  getIt.registerLazySingleton<AuthStatusController>(
    () => AuthStatusController(),
  );

  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(),
  );

  // Two isolated Dio instances: the full-chain client for data sources, plus a
  // bare one used exclusively by the refresh interceptor (never re-enters the
  // interceptor chain itself).
  getIt.registerLazySingleton<Dio>(
    () => DioClient.createClient(
      storage: getIt<SecureStorageService>(),
      authStatus: getIt<AuthStatusController>(),
    ),
  );
  getIt.registerLazySingleton<Dio>(
    () => DioClient.createRefreshClient(),
    instanceName: 'refreshDio',
  );

  // // ── Features ──────────────────────────────────────────────────────────

  // // AUTH FEATURE
  // // Data sources
  // getIt.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSource(dio: getIt<Dio>()),
  // );

  // // Repositories
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     remoteDataSource: getIt<AuthRemoteDataSource>(),
  //     storage: getIt<SecureStorageService>(),
  //   ),
  // );
  // // Dedicated login contract → same underlying implementation (ISP).
  // getIt.registerLazySingleton<LoginRepository>(
  //   () => getIt<AuthRepository>() as LoginRepository,
  // );

  // // UseCases
  // getIt.registerLazySingleton(
  //   () => ValidateSignupStep1UseCase(repository: getIt<AuthRepository>()),
  // );
  // getIt.registerLazySingleton(
  //   () => PickProfileImageUseCase(imagePickerService: getIt()),
  // );
  // getIt.registerLazySingleton(() => const ValidateSignupStep3UseCase());
  // getIt.registerLazySingleton<LoginUseCase>(
  //   () => LoginUseCase(repository: getIt<LoginRepository>()),
  // );
  // getIt.registerLazySingleton<GoogleSignInUseCase>(
  //   () => GoogleSignInUseCase(repository: getIt<LoginRepository>()),
  // );
  // getIt.registerLazySingleton<RegisterUseCase>(
  //   () => RegisterUseCase(repository: getIt<AuthRepository>()),
  // );
  // getIt.registerLazySingleton<VerifyOtpUseCase>(
  //   () => VerifyOtpUseCase(repository: getIt<AuthRepository>()),
  // );
  // getIt.registerLazySingleton<ForgotPasswordUseCase>(
  //   () => ForgotPasswordUseCase(repository: getIt<AuthRepository>()),
  // );
  // getIt.registerLazySingleton<ResetPasswordUseCase>(
  //   () => ResetPasswordUseCase(repository: getIt<AuthRepository>()),
  // );
  // getIt.registerLazySingleton<RefreshTokenUseCase>(
  //   () => RefreshTokenUseCase(repository: getIt<AuthRepository>()),
  // );

  // // BLoCs
  // // BLoCs are typically registered as Factories so that distinct parts of the
  // // app get a fresh instance if needed, but since Signup spans multiple screens,
  // // it is kept alive by the route provider.
  // getIt.registerFactory(
  //   () => SignupBloc(
  //     validateStep1UseCase: getIt(),
  //     pickProfileImageUseCase: getIt(),
  //     validateStep3UseCase: getIt(),
  //     registerUseCase: getIt(),
  //   ),
  // );

  // // One LoginBloc instance per login route (disposed when the route pops).
  // getIt.registerFactory<LoginBloc>(
  //   () => LoginBloc(
  //     loginUseCase: getIt<LoginUseCase>(),
  //     googleSignInUseCase: getIt<GoogleSignInUseCase>(),
  //   ),
  // );

  // // One ForgotPasswordCubit per screen, so the flow's accumulated state
  // // (email, current step) survives navigation between its three screens.
  // getIt.registerFactory<ForgotPasswordCubit>(
  //   () => ForgotPasswordCubit(
  //     forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
  //     resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
  //   ),
  // );

  // ORDERS FEATURE
  // getIt.registerLazySingleton<OrderRemoteDataSource>(
  //   () => OrderRemoteDataSource(dio: getIt<Dio>()),
  // );
  // getIt.registerLazySingleton<OrderRepository>(
  //   () => OrderRepositoryImpl(
  //     remoteDataSource: getIt<OrderRemoteDataSource>(),
  //     storage: getIt<SecureStorageService>(),
  //   ),
  // );
  // getIt.registerLazySingleton<CreateOrderUseCase>(
  //   () => CreateOrderUseCase(repository: getIt<OrderRepository>()),
  // );
  // getIt.registerFactory<CreateOrderCubit>(
  //   () => CreateOrderCubit(createOrderUseCase: getIt<CreateOrderUseCase>()),
  // );
  // ONBOARDING FEATURE
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(),
  );
  getIt.registerLazySingleton(
    () => GetOnboardingItemsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton(
    () => CompleteOnboardingUseCase(repository: getIt()),
  );
  getIt.registerFactory(
    () => OnboardingCubit(
      getOnboardingItemsUseCase: getIt(),
      completeOnboardingUseCase: getIt(),
    ),
  );
}
