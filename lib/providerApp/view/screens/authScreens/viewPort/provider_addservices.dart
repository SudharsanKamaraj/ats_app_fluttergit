import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ProviderAddServices extends StatefulWidget {
  const ProviderAddServices({Key? key}) : super(key: key);

  @override
  State<ProviderAddServices> createState() => _ProviderAddServicesState();
}

class _ProviderAddServicesState extends State<ProviderAddServices> {
  final _formKey = GlobalKey<FormState>();
  bool isValidForm = false;
  final feeController = TextEditingController();
  late String _feeInputVal = "";
  final textFieldFocusNode = FocusNode();
  bool isSwitched = false;
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  bool submit = false;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = kSecondaryColor;
    signInColor = kPrimaryColor;
    feeController.addListener(() {
      setState(() {
        submit = feeController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    feeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () {},
          child: SvgPicture.asset(AppIcons.BACK),
        ),
      ),
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
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                      text: "Add Services",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_LARGE,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: Get.width * 0.45,
                      child: const CustomText(
                        text: "What kind of service do you want to provide?",
                        fontFamily: 'Averta-Regular',
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  // CustomDropdown(
                  //   text: "Category of Service",
                  //   fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //   fontFamily: 'Averta-SemiBold',
                  //   fontColor: kHintText,
                  //   items: listCategoryService,
                  //
                  // ),
                  // const SizedBox(
                  //   height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  // ),
                  // CustomDropdown(
                  //   text: "Type of Service",
                  //   fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //   fontFamily: 'Averta-SemiBold',
                  //   fontColor: kHintText,
                  //   items: listCategoryService,
                  // ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  SizedBox(
                    height: 85,
                    child: TextFormField(
                      controller: feeController,
                      validator: (inputValue) {
                        if (inputValue!.isEmpty) {
                          return "Please enter your Fee \$";
                        }
                        return null;
                      },
                      onChanged: (inputValue) {
                        _feeInputVal = inputValue!;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kWhiteColor,
                        prefix: _feeInputVal.isEmpty
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
                        hintText: "Fee \$",
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
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: kSecondaryColor,
                      elevation: 0,
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: teckAddData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        margin: const EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        height: Get.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.RADIUS_DEFAULT),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(4, 4),
                              ),
                            ],
                            color: kWhiteColor),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 50,
                                child: Image.asset(
                                  teckAddData[index].img,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: CustomText(
                                text: teckAddData[index].headerTitle,
                                fontFamily: 'Averta-Bold',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            CustomText(
                              text: "\$ ${teckAddData[index].price.toString()}",
                              fontFamily: 'Averta-Regular',
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            SvgPicture.asset(AppIcons.MORE),
                            const SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  PrimaryButton(
                    press: () {
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
                    height: Get.height * 0.03,
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
