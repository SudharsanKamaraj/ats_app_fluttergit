import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

const double loginAlign = -1;
const double signInAlign = 1;

enum UserRole {
  customer,
  provider,
}

class ToggleButton extends StatefulWidget {
  final String firstText;
  final String secondText;
  final double width;
  final double height;
  const ToggleButton({Key? key, required this.firstText, required this.secondText, required this.width, required this.height}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  UserRole currentUserRole = UserRole.customer;
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = kSecondaryColor;
    signInColor = kPrimaryColor;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("this is currentUserRole $currentUserRole");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.RADIUS_LARGE),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF1F1F1),
             spreadRadius: 3,
             blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.RADIUS_LARGE),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = loginAlign;
                loginColor = kSecondaryColor;
                signInColor = kPrimaryColor;
                currentUserRole = UserRole.customer;
              });
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.firstText,
                  style: TextStyle(
                    color: loginColor,
                    fontFamily: 'Averta-Bold'
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = signInAlign;
                signInColor = kSecondaryColor;
                loginColor = kPrimaryColor;
                currentUserRole = UserRole.provider;
              });
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.secondText,
                  style: TextStyle(
                    color: signInColor,
                      fontFamily: 'Averta-Bold'
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
