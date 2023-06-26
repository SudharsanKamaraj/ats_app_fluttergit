import 'package:ats_customar_app/util/index_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController loginController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    loginController.checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundConstant(),
          Align(
            alignment: Alignment.center,
            child: AppLogoConstant(
              height: size.height * 0.12,
            )
          ),
        ],
      ),
    );
  }
}
