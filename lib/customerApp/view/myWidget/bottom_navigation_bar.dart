import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';
import 'package:flutter/cupertino.dart';

class CustomerBottomNavigationBar extends StatefulWidget {
  const CustomerBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomerBottomNavigationBar> createState() =>
      _CustomerBottomNavigationBarState();
}

class _CustomerBottomNavigationBarState extends State<CustomerBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: kPrimaryColor,
          activeColor: kHintTextColor,
          inactiveColor: kHintTextColor,
          height: 85,
          items: <BottomNavigationBarItem>[
            _bottomNavigationBarItem(AppIcons.NAV_HOME, "Home", context),
            _bottomNavigationBarItem(AppIcons.NAV_REQUEST, "Requests", context),
            _bottomNavigationBarItem(
                AppIcons.NAV_SCAN, "Services", context),
            _bottomNavigationBarItem(AppIcons.NAV_ACTIVITY, "Activity", context)
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: HomePage(),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: RequestsLayout(),
                );
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: ServiceLayout(),
                );
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: ActivityLayout(),
                );
              });
            default:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: HomePage(),
                );
              });
          }
        },
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavigationBarItem(
    image, String label, BuildContext context) {
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SvgPicture.asset(
            image,
            color: kHintTextColor,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gilroy-Regular',
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: kWhiteColor,
    activeIcon: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SvgPicture.asset(
            image,
            color: kSecondaryColor,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gilroy-Regular',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    ),
  );
}

// BottomNavigationBarItem _bottomNavigationBarItem(
//     image, String label, BuildContext context) {
//   bool itemActiveColor = false;
//   return BottomNavigationBarItem(
//     icon: Column(
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: SvgPicture.asset(
//             image,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Expanded(
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontFamily: 'Gilroy-Regular',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
