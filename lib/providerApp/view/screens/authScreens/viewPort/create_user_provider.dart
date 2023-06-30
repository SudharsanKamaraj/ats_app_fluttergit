import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';
import 'package:ats_customar_app/util/sting_const.dart';

class CreateUserProvider extends StatefulWidget {
  const CreateUserProvider({Key? key}) : super(key: key);

  @override
  State<CreateUserProvider> createState() => _CreateUserProviderState();
}

class _CreateUserProviderState extends State<CreateUserProvider> {
  final AuthController authController = Get.find<AuthController>();
  final EmailOTP _myAuth = Get.put(myAuth);
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final drivingLicController = TextEditingController();
  final trackPlateController = TextEditingController();
  late String _nameInputVal = "";
  late String _emailInputVal = "";
  late String _passwordInputVal = "";
  late String _phoneNumberInputVal = "";
  late String _drivingLicInputVal = "";
  late String _trackPlateInputVal = "";
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  bool isSwitched = false;
  bool submit = false;
  bool isValidForm = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            const BackgroundConstant(),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.1, bottom: size.height * 0.07),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AppLogoConstant(
                        height: size.height * 0.12,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "${AppString.SERVICE} ${AppString.PROVIDER}",
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
                      text: "${AppString.NEW} ${AppString.ACCOUNT}",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: nameController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_NAME;
                        }
                        return inputValue.length < 5 ? AppString.NAME_GREATER_FIVE : null;;
                      },
                      onChanged: (inputValue) {
                        _nameInputVal = inputValue;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _nameInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "${AppString.FULL} ${AppString.NAME}",
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: emailController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_EMAIL;
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _emailInputVal = inputValue;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _emailInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: AppString.EMAIL,
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: passwordController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_PASS;
                        }
                        return inputValue.length < 5 ? AppString.PASS_GREATER_FIVE : null;;
                      },
                      onChanged: (inputValue) {
                        _passwordInputVal = inputValue;
                      },
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _passwordInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, top: 10, bottom: 10),
                          child: GestureDetector(
                              onTap: _toggleObscured,
                              child: SvgPicture.asset(
                                AppIcons.PASS_EYR,
                                height: 10,
                                color: _obscured ? kHintText : kSecondaryColor,
                              )),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: AppString.PASSWORD,
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: phoneNumberController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_PHON_NUM;
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _phoneNumberInputVal = inputValue;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _phoneNumberInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "${AppString.PHONE} ${AppString.NUMBER}",
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: drivingLicController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_DRIVE_LIC;
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _drivingLicInputVal = inputValue;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _drivingLicInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "${AppString.DRIVERS} ${AppString.LICENCE}",
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: trackPlateController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_TRUCK_PL;
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _trackPlateInputVal = inputValue;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _trackPlateInputVal.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: Dimensions.PADDING_SIZE_LARGE,
                                  width: Dimensions.PADDING_SIZE_LARGE,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor),
                                  child: const Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "${AppString.TRUCK} ${AppString.PLATE}",
                        hintStyle: const TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kHintText,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_LARGE),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomSwitch(
                        value: isSwitched,
                        onChanged: (bool val) async {
                          setState(() {
                            isSwitched = val;
                          });

                          await _myAuth.setConfig(
                            appEmail: "sudharsan.k@amofetch.com",
                            appName: "ats_customer_app",
                            userEmail: emailController.text,
                            otpLength: 8,
                            otpType: OTPType.digitsOnly,
                          );


                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isValidForm = true;
                            });
                          } else {
                            setState(() {
                              isValidForm = false;
                            });
                          }

                          if (await _myAuth.sendOTP() == true) {
                            Get.to(const VerificationProvider());
                            Get.snackbar(AppString.SUCCESS, AppString.OTP_SEND);
                          } else {
                            Get.snackbar("${AppString.OOPS} !", AppString.OTP_NOT_SEND);
                          }

                          await myAuth.sendOTP();
                          print("This is the send status: $val");
                        },

                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                        child: const CustomText(
                          text:
                              AppString.TWO_FACTOR_SEN,
                          fontFamily: 'Averta-Regular',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SecondaryButton(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: double.infinity,
                    fontColor: kPrimaryColor,
                    text: "${AppString.ADD} ${AppString.SERVICE}",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kWhiteColor,
                    fontFamily: 'Averta-Bold',
                    press: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  PrimaryButton(
                    press: () {
                      // Get.to(const CustomBottomNavigationBar());
                      // Get.to(const VerificationProvider());
                      // handleCreateUser();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isValidForm = true;
                        });
                      } else {
                        setState(() {
                          isValidForm = false;
                        });
                      }
                      authController.createUserProvider(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          phoneNumberController.text,
                          drivingLicController.text,
                          trackPlateController.text);
                    },
                    height: Dimensions.BUTTON_HEIGHT,
                    width: double.infinity,
                    fontColor: kWhiteColor,
                    text: "${AppString.CREATE} ${AppString.ACCOUNT}",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kSecondaryColor,
                    fontFamily: 'Averta-Bold',
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
