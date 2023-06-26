import 'package:ats_customar_app/customerApp/view/screens/createUser/viewPort/create_user_customer.dart';
import 'package:ats_customar_app/providerApp/util/color_const.dart';
import 'package:ats_customar_app/providerApp/view/screens/authScreens/viewPort/create_user_provider.dart';
import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/util/sting_const.dart';

import '../authWidegts/toggle_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  bool isValidForm = false;
  // final emailController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String _emailInputVal = "";
  late String _passwordInputVal = "";
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  bool isVisible = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
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
                  const ToggleButton(),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: emailController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return AppString.PLZ_ENTER_EMAILORNAME;
                        }
                        return inputValue.length < 5 ? AppString.NAME_GREATER_FIVE : null;
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
                        hintText: "${AppString.EMAIL} ${AppString.OR} ${AppString.USERNAME}",
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
                        return null;
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
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: size.width * 0.35,
                        color: const Color(0xFFCBCBCB),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(AppString.OR,
                          style: TextStyle(
                            fontFamily: 'Averta-Bold',
                            fontSize: 15,
                            color: Color(0xFFE41636),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 1,
                        width: size.width * 0.35,
                        color: const Color(0xFFCBCBCB),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        height: size.height * 0.07,
                        width: size.width * 0.2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F1F1),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.APPLE_LOGO,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        height: size.height * 0.07,
                        width: size.width * 0.2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F1F1),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.FB_LOGO,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        height: size.height * 0.07,
                        width: size.width * 0.2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F1F1),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.INSTA_LOGO,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        height: size.height * 0.07,
                        width: size.width * 0.2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF1F1F1),
                        ),
                        child: Image.asset(
                          AppIcons.GOOGLE_LOGO,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.1),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() {
                            isValidForm = true;
                          });
                        } else {
                          setState(() {
                            isValidForm = false;
                          });
                        }
                        authController.login(
                            emailController.text, passwordController.text);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFE41636),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: const Text(
                        "${AppString.ENTER} ${AppString.AMO}",
                        style: TextStyle(
                          fontFamily: 'Averta-Bold',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppString.FORFOT_PASS,
                        style: TextStyle(
                          fontFamily: 'Averta-SemiBold',
                          fontSize: 14,
                          color: Color(0xFF000000),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: const Color(0xFFCBCBCB),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint(
                              "authController.selectedValue.value ${authController.selectedValue.value}");
                          if (authController.selectedValue.value ==
                                  "Customer") {
                            Get.to(const CreateUserCustomer());
                            debugPrint("NavigationBar : Customer");
                          } else {
                            Get.to(const CreateUserProvider());
                            debugPrint("NavigationBar : Provider");
                          }
                          // Get.to(const CreateUserProvider());
                        },
                        child: const Text(
                          AppString.CREATE_USER,
                          style: TextStyle(
                            fontFamily: 'Averta-SemiBold',
                            fontSize: 14,
                            color: Color(0xFF000000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
