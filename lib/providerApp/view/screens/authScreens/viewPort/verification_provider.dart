import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class VerificationProvider extends StatefulWidget {
  const VerificationProvider({
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationProvider> createState() => _VerificationProviderState();
}

class _VerificationProviderState extends State<VerificationProvider> {
  final _formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  String? _otp;
  final EmailOTP _myAuth = Get.put(myAuth);


  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  final TextEditingController _fieldSeven = TextEditingController();
  final TextEditingController _fieldEight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.LOGIN_BGMAP,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/Rectangle.png',
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImages.LOGO,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Service Provider",
                      fontFamily: 'Averta-SemiBold',
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: kSecondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Validation",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Hi Rebeca,",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: Get.width * 0.7,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Please check your email and pleas here the ',
                          style: TextStyle(
                            fontFamily: 'Averta-Regular',
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: kPrimaryColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'code ',
                                style: TextStyle(
                                  fontFamily: 'Averta-Bold',
                                )),
                            TextSpan(
                              text:
                              "that we've sent you to activate your account.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.1, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFF5F5F5),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(_fieldOne, true), // auto focus
                        OtpInput(_fieldTwo, false),
                        OtpInput(_fieldThree, false),
                        OtpInput(_fieldFour, false),
                        const Text("-"),
                        OtpInput(_fieldFive, false),
                        OtpInput(_fieldSix, false),
                        OtpInput(_fieldSeven, false),
                        OtpInput(_fieldEight, false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  SizedBox(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _otp = _fieldOne.text +
                              _fieldTwo.text +
                              _fieldThree.text +
                              _fieldFour.text +
                              _fieldFive.text +
                              _fieldSix.text +
                              _fieldSeven.text +
                              _fieldEight.text;
                        });

                        print("print otpPrint = $_otp");

                        if (await _myAuth.verifyOTP(
                          otp: _otp,
                        )) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP is verified"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid OTP"),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(kWhiteColor),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: const BorderSide(width: 2),
                            borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Dind’t get the Email",
                        style: TextStyle(
                          fontFamily: 'Averta-Bold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: Get.width * 0.07,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}


