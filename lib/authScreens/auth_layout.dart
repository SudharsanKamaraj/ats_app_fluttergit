import 'package:ats_customar_app/util/index_path.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AuthResponsive(
      mobile: SplashScreen(),
      tablet: Row(),
    ));
  }
}
