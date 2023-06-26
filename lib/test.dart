import 'package:flutter/material.dart';

class OtpValidationTextField extends StatefulWidget {
  final int otpLength;
  final Function(String) onOtpEntered;

  OtpValidationTextField({required this.otpLength, required this.onOtpEntered});

  @override
  _OtpValidationTextFieldState createState() => _OtpValidationTextFieldState();
}

class _OtpValidationTextFieldState extends State<OtpValidationTextField> {
  late List<TextEditingController> _textControllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _textControllers = List.generate(
      widget.otpLength,
          (_) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.otpLength,
          (_) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    String otp = _textControllers.map((controller) => controller.text).join();
    widget.onOtpEntered(otp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.otpLength, (index) {
        return Container(
          width: 30,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: TextField(
            controller: _textControllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              counterText: '',
            ),
            onChanged: (value) => _onTextChanged(index, value),
          ),
        );
      }),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  StarRating({super.key, this.starCount = 5, this.rating = 0.0, required this.color, required this.size});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return Icon(
          index < widget.rating.floor()
              ? Icons.star
              : Icons.star,
          color: widget.color ?? Theme.of(context).primaryColor,
          size: widget.size ?? 24.0,
        );
      }),
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _errorMessage;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      // Login successful, navigate to the home screen or perform any desired action
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null)
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              child: Text('Log in'),
              onTap: _signInWithEmailAndPassword,
            ),
          ],
        ),
      ),
    );
  }
}

 */


/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map> list = [
    {
      "time": "2020-06-16T10:31:12.000Z",
      "message":
      "P2 BGM-01 HV buiten materieel (Gas lekkage) Franckstraat Arnhem 073631"
    },
    {
      "time": "2020-06-16T10:29:35.000Z",
      "message": "A1 Brahmslaan 3862TD Nijkerk 73278"
    },
    {
      "time": "2020-06-16T10:29:35.000Z",
      "message": "A2 NS Station Rheden Dr. Langemijerweg 6991EV Rheden 73286"
    },
    {
      "time": "2020-06-15T09:41:18.000Z",
      "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
    },
    {
      "time": "2020-06-14T09:40:58.000Z",
      "message":
      "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              bool isSameDate = true;
              final String dateString = list[index]['time'];
              final DateTime date = DateTime.parse(dateString);
              final item = list[index];
              if (index == 0) {
                isSameDate = false;
              } else {
                final String prevDateString = list[index - 1]['time'];
                final DateTime prevDate = DateTime.parse(prevDateString);
                isSameDate = date.isSameDate(prevDate);
              }
              if (index == 0 || !(isSameDate)) {
                return Column(children: [
                  Text(date.formatDate()),
                  ListTile(title: Text('item $index'))
                ]);
              } else {
                return ListTile(title: Text('item $index'));
              }
            }),
      ),
    );
  }
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {

  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}

 */

// import 'package:ats_customar_app/util/index_path_cus.dart';
// import 'package:sticky_grouped_list/sticky_grouped_list.dart';
//
// List<Element> _elements = <Element>[
//   Element('More', 'Lorem Ipsum','5 Days', AppImages.TeckAddData4),
//   Element('Workshop', 'Battery Boost Copy','20 - 30min.', AppImages.TeckAddData3),
//   Element('Workshop', 'Change Tire','20 - 30min.', AppImages.TeckAddData2),
//   Element('Workshop', 'Towing Truck','20 - 30min.', AppImages.TeckAddData1),
//   Element('Roadside', 'A/C Repair','2 Days', AppImages.TeckAddData6),
//   Element('Roadside', 'Brake Maintenance','1 Days', AppImages.TeckAddData5),
//   Element('Roadside', 'Engine Rebuild','5 Days', AppImages.TeckAddData4),
// ];
//
// class NotificationsScreen extends StatefulWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationsScreen> createState() => _NotificationsScreenState();
// }
//
// class _NotificationsScreenState extends State<NotificationsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10),
//           child: Image.asset(
//             "assets/images/Fetch logo.png",
//             height: 40,
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 25),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: CustomText(
//                 text: "Notifications",
//                 fontFamily: 'Averta-Bold',
//                 fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
//                 color: kPrimaryColor,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
//         child: StickyGroupedListView<Element, String>(
//           elements: _elements,
//           order: StickyGroupedListOrder.ASC,
//           groupBy: (Element element) => (element.modal),
//           groupComparator: (String value1, String value2) =>
//               value2.compareTo(value1),
//           itemComparator: (Element element1, Element element2) =>
//               element2.modal.compareTo(element1.modal),
//           groupSeparatorBuilder: _getGroupSeparator,
//           itemBuilder: _getItem,
//         ),
//       ),
//     );
//   }
//
//   Widget _getGroupSeparator(Element element) {
//     return Container(
//       color: kWhiteColor,
//       height: 40,
//       child: Align(
//         alignment: Alignment.topLeft,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             element.modal,
//             style: const TextStyle(
//               fontFamily: 'Averta-Bold',
//               fontSize: Dimensions.FONT_SIZE_CLASSIC_LARGE,
//               color: kSecondaryColor,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _getItem(BuildContext ctx, Element element) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
//       margin: const EdgeInsets.symmetric(
//           vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
//       height: Get.height * 0.1,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 0,
//             blurRadius: 10,
//             offset: const Offset(4, 4),
//           ),
//         ],
//         color: const Color(0xFFF6F6F6),
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: 50, child: Image.asset(element.img)),
//           const SizedBox(
//             width: 5,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(
//                   text: element.serviceType,
//                   fontFamily: 'Averta-Bold',
//                   fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
//                   color: kPrimaryColor,
//                 ),
//                 const SizedBox(
//                   height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                 ),
//                 CustomText(
//                   text: element.periods,
//                   fontFamily: 'Averta-Bold',
//                   fontSize: Dimensions.FONT_SIZE_SMALL,
//                   color: kShadow,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//

/*
import 'package:ats_customar_app/models/addserv_provider_pro.dart';
import 'package:ats_customar_app/util/index_path_cus.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomNavigationBar1 extends StatefulWidget {
  const CustomBottomNavigationBar1({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar1> createState() =>
      _CustomBottomNavigationBar1State();
}

class _CustomBottomNavigationBar1State extends State<CustomBottomNavigationBar1> {
  int currentIndex = 0;

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
          if (currentIndex == index) {
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: _getPageByIndex(index),
              );
            });
          } else {
// Return an empty container or any other widget when the index doesn't match
            return Container();
          }
        },
      ),
    );
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const RequestsLayout();
      case 2:
        return const ServiceLayout();
      case 3:
        return const ActivityLayout();
      default:
        return const HomePage();
    }
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

 */

//
// class CustomStickyGroupedListView<Element, GroupByType> extends StatefulWidget {
//   final List<Element> elements;
//   final GroupByType Function(Element element) groupBy;
//   final Widget Function(GroupByType value) groupSeparatorBuilder;
//   final Widget Function(int index, Element element) itemBuilder;
//   final int Function(Element element1, Element element2) itemComparator;
//   final int Function(GroupByType value1, GroupByType value2) groupComparator;
//
//   const CustomStickyGroupedListView({
//     required this.elements,
//     required this.groupBy,
//     required this.groupSeparatorBuilder,
//     required this.itemBuilder,
//     required this.itemComparator,
//     required this.groupComparator,
//   });
//
//   @override
//   _CustomStickyGroupedListViewState<Element, GroupByType> createState() => _CustomStickyGroupedListViewState<Element, GroupByType>();
// }
//
// class _CustomStickyGroupedListViewState<Element, GroupByType> extends State<CustomStickyGroupedListView<Element, GroupByType>> {
//   late final List<List<Element>> _groupedElements;
//   late final List<GroupByType> _groupKeys;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Group the elements by the groupBy function
//     _groupedElements = [];
//     _groupKeys = [];
//     for (final element in widget.elements) {
//       final groupByValue = widget.groupBy(element);
//       final groupIndex = _groupKeys.indexOf(groupByValue);
//       if (groupIndex == -1) {
//         _groupedElements.add([element]);
//         _groupKeys.add(groupByValue);
//       } else {
//         _groupedElements[groupIndex].add(element);
//       }
//     }
//
//     // Sort the groups and elements
//     _groupKeys.sort(widget.groupComparator);
//     for (final groupElements in _groupedElements) {
//       groupElements.sort(widget.itemComparator);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _groupedElements.length * 2 - 1,
//       itemBuilder: (context, index) {
//         if (index.isOdd) {
//           // Separator
//           return widget.groupSeparatorBuilder(_groupKeys[index ~/ 2]);
//         } else {
//           // Item
//           final groupIndex = index ~/ 2;
//           final itemIndex = groupIndex == 0
//               ? 0
//               : _groupedElements[groupIndex - 1].length + groupIndex;
//           return widget.itemBuilder(
//             itemIndex,
//             _groupedElements[groupIndex][itemIndex - groupIndex - 1],
//           );
//         }
//       },
//     );
//   }
// }
//
