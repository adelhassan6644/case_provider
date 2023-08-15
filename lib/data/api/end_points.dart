class EndPoints {
  static const String baseUrl =
      'https://massage-app.softwarecloud2.com/api/v1/';
  static const String googleMapsBaseUrl = 'https://maps.googleapis.com';
  static const String imageUrl = 'https://massage-app.softwarecloud2.com/';
  static const String apiKey =
      's7xrpFdw4G0F21rfLyD4TaBkjVJYgwGfI3y60OyRnjw9zOggruX30e1as2d3';
  static const String topic = 'casaProvider';
  static const String logIn = 'worker/login';
  static const String register = 'worker';
  static const String forgetPassword = 'worker/resetPassword/email';
  static const String checkMailForResetPassword =
      'worker/resetPassword/checkCode';
  static const String resetPassword = 'worker/resetPassword/newPassword';
  static changePassword(id) => 'worker/changePassword/$id';
  static const String resend = 'worker/email/verification';
  static const String verifyEmail = 'worker/check/verificationCode';
  static getProfile(id) => 'worker/$id';
  static updateProfile(id) => 'worker/$id';
  static getAddresses(id) => 'address/$id';
  static deleteAddress(id) => 'address/$id';
  static String addAddress = 'address';

  /// Notifications
  static getNotifications(id) => 'worker/notification/$id';
  static readNotification(userId, id) => 'worker/notification/read/$userId/$id';
  static deleteNotification(userId, id) => 'worker/notification/delete/$userId/$id';

  /// Session
  static cancelReservation(id) => 'reservation/$id';
  static endReservations(id) => 'worker/end/reservation/$id';
  static nextReservations(id) => 'worker/next/reservation/$id';
  static previousReservations(id) => 'worker/past/reservation/$id';
  static sessionDetails(id) => 'worker/reservation/$id';

  static const String feedBack = 'feedback';
  static const String setting = 'setting';
  static const String contact = 'contact';

  /// maps
  static const String GEOCODE_URI = '/maps/api/geocode/';
  static const String Autocomplete = '/maps/api/place/autocomplete/';
//https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=AIzaSyB_l2x6zgnLTF4MKxX3S4Df9urLN6vLNP0
//'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=n,&key=AIzaSyB_l2x6zgnLTF4MKxX3S4Df9urLN6vLNP0
}
