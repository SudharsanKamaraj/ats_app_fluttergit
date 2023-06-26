import 'package:ats_customar_app/util/index_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(const FlutterSecureStorage());
  FirebaseMessagingService firebaseMessagingService =
      FirebaseMessagingService();
  String? deviceId = await firebaseMessagingService.getDeviceId();
  await storageLocal.write(key: AppConstants.DEVICETOKEN, value: deviceId ?? '');

  final String deviceToken = await storageLocal.read(key: AppConstants.DEVICETOKEN) ?? '';
  debugPrint('deviceToken: $deviceToken');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(
          AuthController(
            authRepo: AuthRepo(
              apiClient: ApiClient(
                appBaseUrl: AppConstants.BASE_URL,
                storageLocal: Get.find(),
              ),
              storageLocal: Get.find(),
            ),
          ),
        );
      }),
      home: const SplashScreen(),
      // home: ServiceLayout(),
      // home: AuthLayout(),
      // home: StreamBuilder<bool>(
      //   stream: myAuthenticationStream(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData && snapshot.data == true) {
      //       return Home();
      //     } else {
      //       return const AuthLayout();
      //     }
      //   },
      // ),
    );
  }
}

Stream<bool> myAuthenticationStream() {
  return Stream<bool>.value(true);
}

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getDeviceId() async {
    String? deviceId;

    try {
      deviceId = await _firebaseMessaging.getToken();
    } catch (e) {
      debugPrint('Error getting device ID: $e');
    }

    return deviceId;
  }
}
