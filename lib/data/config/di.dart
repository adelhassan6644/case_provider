import 'package:casaProvider/features/notifications/repo/notifications_repo.dart';
import 'package:dio/dio.dart';
import 'package:casaProvider/features/home/repo/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/localization/provider/language_provider.dart';
import '../../app/localization/provider/localization_provider.dart';
import '../../app/theme/theme_provider/theme_provider.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/home/provider/home_provider.dart';
import '../../features/reservations/provider/reservations_provider.dart';
import '../../features/reservations/repo/reservations_repo.dart';
import '../../features/notifications/provider/notifications_provider.dart';
import '../../features/profile/provider/profile_provider.dart';
import '../../features/profile/repo/profile_repo.dart';
import '../../features/session_details/provider/session_details_provider.dart';
import '../../features/session_details/repo/session_details_repo.dart';
import '../../features/setting/provider/config_provider.dart';
import '../../features/setting/repo/config_repo.dart';
import '../../main_page/provider/main_page_provider.dart';
import '../api/end_points.dart';
import '../network/network_info.dart';
import '../dio/dio_client.dart';
import '../dio/logging_interceptor.dart';
import '../../features/auth/repo/auth_repo.dart';
import '../../features/splash/provider/splash_provider.dart';
import '../../features/splash/repo/splash_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(
        EndPoints.baseUrl,
        dio: sl(),
        loggingInterceptor: sl(),
        sharedPreferences: sl(),
      ));

  // Repository
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(
      () => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => ProfileRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => HomeRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => ReservationsRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => NotificationsRepo(sharedPreferences: sl(), dioClient: sl()));


  sl.registerLazySingleton(
      () => SessionDetailsRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => ConfigRepo(sharedPreferences: sl(), dioClient: sl()));


  //provider
  sl.registerLazySingleton(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LanguageProvider());
  sl.registerLazySingleton(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => MainPageProvider());
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => SessionDetailsProvider(repo: sl()));
  sl.registerLazySingleton(() => HomeProvider(homeRepo: sl()));
  sl.registerLazySingleton(() => ReservationsProvider(repo: sl()));
  sl.registerLazySingleton(
      () => NotificationsProvider(notificationsRepo: sl()));
  sl.registerLazySingleton(() => ProfileProvider(profileRepo: sl()));
  sl.registerLazySingleton(() => ConfigProvider(repo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
