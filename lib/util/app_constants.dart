import 'package:ats_customar_app/util/index_path.dart';

const storageLocal = FlutterSecureStorage();
EmailOTP myAuth = EmailOTP();

class BackgroundConstant extends StatelessWidget {
  const BackgroundConstant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AppImages.APP_BG_MAP,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AppImages.APP_BG_MAP_GRADIENT,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}

class AppLogoConstant extends StatelessWidget {
  final double height;
  const AppLogoConstant({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Image.asset(
      AppImages.LOGO,
      height: height,
    );
  }
}



class AppConstants {
  static const String APP_NAME = 'ATS';
  // static const double APP_VERSION = 1.6;

  static const String BASE_URL = 'http://192.168.0.111:3001';
  // static const String CONFIG_URI = '/api/v1/config';
  // static const String FORGET_PASSWORD_URI = '/api/v1/auth/delivery-man/forgot-password';
  // static const String VERIFY_TOKEN_URI = '/api/v1/auth/delivery-man/verify-token';
  // static const String RESET_PASSWORD_URI = '/api/v1/auth/delivery-man/reset-password';
  static const String LOGIN_URI = '/api/signin';
  static const String CREATE_USER_URI = '/api/users';
  // static const String TOKEN_URI = '/api/v1/delivery-man/update-fcm-token';
  // static const String CURRENT_ORDERS_URI = '/api/v1/delivery-man/current-orders?token=';
  // static const String ADD_DRIVER_DOC = '/api/v1/delivery-man/adddoc';
  // static const String ADD_DRIVER_PMT = '/api/v1/delivery-man/addpmt';
  // static const String ALL_ORDERS_URI = '/api/v1/delivery-man/all-orders';
  // static const String LATEST_ORDERS_URI = '/api/v1/delivery-man/latest-orders?token=';
  // static const String RECORD_LOCATION_URI = '/api/v1/delivery-man/record-location-data';
  // static const String PROFILE_URI = '/api/v1/delivery-man/profile?token=';
  // static const String UPDATE_ORDER_STATUS_URI = '/api/v1/delivery-man/update-order-status';
  // static const String UPDATE_PAYMENT_STATUS_URI = '/api/v1/delivery-man/update-payment-status';
  // static const String ORDER_DETAILS_URI = '/api/v1/delivery-man/order-details?token=';
  // static const String ACCEPT_ORDER_URI = '/api/v1/delivery-man/accept-order';
  // static const String ACTIVE_STATUS_URI = '/api/v1/delivery-man/update-active-status';
  // static const String UPDATE_PROFILE_URI = '/api/v1/delivery-man/update-profile';
  // static const String NOTIFICATION_URI = '/api/v1/delivery-man/notifications?token=';
  // static const String ABOUT_US_URI = '/about-us';
  // static const String PRIVACY_POLICY_URI = '/privacy-policy';
  // static const String TERMS_AND_CONDITIONS_URI = '/terms-and-conditions';
  // static const String DRIVER_REMOVE = '/api/v1/delivery-man/remove-account?token=';
  // static const String DM_REGISTER_URI = '/api/v1/auth/delivery-man/store';
  // static const String ZONE_LIST_URI = '/api/v1/zone/list';
  // static const String ZONE_URI = '/api/v1/config/get-zone-id';
  // static const String CURRENT_ORDER_URI = '/api/v1/delivery-man/order?token=';
  //
  // // chat url
  // static const String GET_CONVERSATION_LIST = '/api/v1/delivery-man/message/list';
  // static const String GET_MESSAGE_LIST_URI = '/api/v1/delivery-man/message/details';
  // static const String SEND_MESSAGE_URI = '/api/v1/delivery-man/message/send';
  // static const String SEARCH_CONVERSATION_LIST_URI = '/api/v1/delivery-man/message/search-list';
  //
  // Shared Key
  static const String THEME = 'ats_theme';
  static const String TOKEN = 'ats_token';
  static const String DEVICETOKEN = 'ats_deviceToken';
  static const String USER_ROLES = 'ats_user_roles';
  static const String COUNTRY_CODE = 'ats_country_code';
  static const String LANGUAGE_CODE = 'ats_language_code';
  static const String USER_PASSWORD = 'ats_user_password';
  static const String USER_ADDRESS = 'ats_user_address';
  static const String USER_NUMBER = 'ats_user_number';
  static const String USER_EMAIL = 'ats_user_email';
  static const String USER_COUNTRY_CODE = 'ats_user_country_code';
  static const String NOTIFICATION = 'ats_notification';
  static const String NOTIFICATION_COUNT = 'ats_notification_count';
  static const String IGNORE_LIST = 'ats_ignore_list';
  static const String TOPIC = 'all_zone_ats_man';
  static const String ZONE_TOPIC = 'zone_topic';
  static const String LOCALIZATION_KEY = 'language';
  static const String LANG_INTRO = 'language_intro';
  //
  // // Status
  // static const String PENDING = 'pending';
  // static const String CONFIRMED = 'confirmed';
  // static const String ACCEPTED = 'accepted';
  // static const String PROCESSING = 'processing';
  // static const String HANDOVER = 'handover';
  // static const String PICKED_UP = 'picked_up';
  // static const String DELIVERED = 'delivered';
  // static const String CANCELED = 'canceled';
  // static const String FAILED = 'failed';
  // static const String REFUNDED = 'refunded';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: AppImages.ENGLISH, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: AppImages.ARABIC, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}