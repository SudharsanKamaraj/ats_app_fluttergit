import 'package:flutter/material.dart';

class AuthResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const AuthResponsive({Key? key, required this.mobile, required this.tablet}) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 650;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 768) {
          return tablet;
        }else {
          return mobile;
        }
      },
    );
  }
}