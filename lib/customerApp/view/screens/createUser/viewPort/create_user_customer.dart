import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class CreateUserCustomer extends StatefulWidget {
  const CreateUserCustomer({Key? key}) : super(key: key);

  @override
  State<CreateUserCustomer> createState() => _CreateUserCustomerState();
}

class _CreateUserCustomerState extends State<CreateUserCustomer> {
  final _formKey = GlobalKey<FormState>();
  // final _apiClient= Get.put(ApiClient());
  bool isValidForm = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  late String _nameInputVal = "";
  late String _emailInputVal = "";
  late String _passwordInputVal = "";
  late String _phoneNumberInputVal = "";
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  bool isSwitched = false;
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  bool submit = false;
  bool isEmailVerified = false;
  final EmailOTP _myAuth = Get.put(myAuth);

  Future<void> handleCreateUser() async {
    final userName = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final mobileNumber = phoneNumberController.text;
    await createUser(userName, email, password, mobileNumber);
    // do something after successful login
  }

  @override
  void initState() {
    super.initState();
    // nameController.addListener(() {
    //   setState(() {
    //     submit = nameController.text.isEmpty?false:true;
    //   });
    // });
    // emailController.addListener(() {
    //   setState(() {
    //     submit = emailController.text.isEmpty;
    //   });
    // });
    // passwordController.addListener(() {
    //   setState(() {
    //     submit = passwordController.text.isEmpty;
    //   });
    // });
    // phoneNumberController.addListener(() {
    //   setState(() {
    //     submit = phoneNumberController.text.isEmpty;
    //   });
    // });
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

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
                      height: Get.height * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Customer",
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
                      text: "New account",
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
                          return "Please enter your name or alias";
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _nameInputVal = inputValue!;
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
                        hintText: "name or alias",
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
                          return "Please enter your email";
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _emailInputVal = inputValue!;
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
                        hintText: "email",
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
                          return "Please enter your password";
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _passwordInputVal = inputValue!;
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
                                color: _obscured ? kSecondaryColor : kHintText,
                              )),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFFF5F5F5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "password",
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
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _phoneNumberInputVal = inputValue!;
                      },
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
                        hintText: "phone number",
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
                          val == true
                              ? setState(() {
                                  isSwitched = val;
                                })
                              : null;

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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                          await myAuth.sendOTP();
                          print("This is the send status: $val");
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: Get.width * 0.45,
                        child: const CustomText(
                          text:
                              "Activate two-factor Authentication for your security",
                          fontFamily: 'Averta-Regular',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  // SizedBox(
                  //   height: Dimensions.BUTTON_HEIGHT,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: _nameInputVal.isEmpty
                  //         ? () {
                  //             //Get.to(const CustomBottomNavigationBar());
                  //             Get.to(const VerificationScreen());
                  //             if (_formKey.currentState!.validate()) {
                  //               setState(() {
                  //                 isValidForm = true;
                  //               });
                  //             } else {
                  //               setState(() {
                  //                 isValidForm = false;
                  //               });
                  //             }
                  //           }
                  //         : null,
                  //     style: ButtonStyle(
                  //       backgroundColor: _nameInputVal.isEmpty
                  //           ? MaterialStateProperty.all<Color>(kSecondaryColor)
                  //           : MaterialStateProperty.all<Color>(kHintTextColor),
                  //       shape:
                  //           MaterialStateProperty.all<RoundedRectangleBorder>(
                  //         RoundedRectangleBorder(
                  //           borderRadius:
                  //               BorderRadius.circular(Dimensions.RADIUS_LARGE),
                  //         ),
                  //       ),
                  //     ),
                  //     child: const Text(
                  //       "Create Account",
                  //       style: TextStyle(
                  //         fontFamily: 'Averta-Bold',
                  //         fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //         color: kWhiteColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  PrimaryButton(
                    press: () {
                      // Get.to(const CustomBottomNavigationBar());
                      Get.to(const VerificationScreen());
                      //handleCreateUser();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isValidForm = true;
                        });
                      } else {
                        setState(() {
                          isValidForm = false;
                        });
                      }
                    },
                    height: Dimensions.BUTTON_HEIGHT,
                    width: double.infinity,
                    fontColor: kWhiteColor,
                    text: "Create Account",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kSecondaryColor,
                    fontFamily: 'Averta-Bold',
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  // Obx(() => CustomText(
                  //    text:
                  //    "Email status: \n ${emailAuthController.status.value}",
                  //    fontFamily: 'Averta-Regular',
                  //    fontSize: Dimensions.FONT_SIZE_SMALL,
                  //    color: kPrimaryColor,
                  //  ),),
                  //  SizedBox(
                  //    height: Get.height * 0.02,
                  //  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
