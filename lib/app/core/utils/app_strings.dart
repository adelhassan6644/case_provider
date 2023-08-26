
import '../../../features/language/provider/language_provider.dart';

class AppStrings {
  static const String appName = 'Casa Provider';
  static const String googleApiKey = 'AIzaSyBxi2NcKA8JE90J07U9M2D90tHgaSg3Xjg';
  static const String defaultAddress = 'المملكة العربية السعودية ، الرياض';
  static const String defaultLat = '24.67401824245781';
  static const String defaultLong = '46.691234707832336';


  static const String fontFamily = 'ar';
  static const String noRouteFound = 'No Route Found';
  static const String cachedRandomQuote = 'CACHED_RANDOM_QUOTE';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String serverFailure = 'Server Failure';
  static const String cacheFailure = 'Cache Failure';
  static const String unexpectedError = 'Unexpected Error';
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  static const String locale = 'locale';
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: 'Images.united_kindom',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: 'Images.arabic',
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
