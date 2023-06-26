import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';

class ServiceFinished extends StatefulWidget {
  const ServiceFinished({Key? key}) : super(key: key);

  @override
  State<ServiceFinished> createState() => _ServiceFinishedState();
}

class _ServiceFinishedState extends State<ServiceFinished> {
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_LARGE,
              right: Dimensions.PADDING_SIZE_SMALL,
              top: Dimensions.PADDING_SIZE_LARGE,
              bottom: Dimensions.PADDING_SIZE_LARGE),
          child: InkWell(
              onTap: () {},
              child:
                  SizedBox(height: 10, child: SvgPicture.asset(AppIcons.BACK))),
        ),
        title: const Center(
          child: CustomText(
            text: "Service",
            fontFamily: 'Averta-Bold',
            fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
            color: kSecondaryColor,
          ),
        ),
        actions: [
          ProfileIcon(
            img: AppImages.PROFILE,
            notificationCount: 2,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: Column(
            children: [
              const SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Apr 15, 2023",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        ),
                        CustomText(
                          text: 'Towing Truck',
                          fontFamily: 'Averta-Bold',
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  CustomText(
                    text: "\$ 150.00",
                    fontFamily: 'Averta-Regular',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_LARGE,
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: kWhiteColor,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      width: Get.width * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Image.asset(AppImages.PROFILE),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Mike Smith",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                          color: kPrimaryColor,
                        ),
                        CustomText(
                          text: "Client",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kHintTextColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: "Date/Urgency",
                  fontFamily: 'Averta-SemiBold',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kHintTextColor,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'Averta-SemiBold',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
              const Divider(
                height: 1,
                color: kHintTextColor,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Location",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kHintTextColor,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        ),
                        CustomText(
                          text: "Road Long Name, km 2",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                  SecondaryButton(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: Get.width * 0.37,
                    fontColor: kPrimaryColor,
                    text: "Go to Waze",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kWhiteColor,
                    fontFamily: 'Averta-Bold',
                    press: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: kContentBGC,
                ),
                child: Row(
                  children: [
                    const CustomText(
                      text: "Distance:",
                      fontFamily: 'Averta-Medium',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kPrimaryColor,
                    ),
                    const Expanded(
                      child: CustomText(
                        text: " 5.4 Miles",
                        fontFamily: 'Averta-Regular',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kSecondaryColor,
                      ),
                    ),
                    SvgPicture.asset(AppIcons.CLOCK),
                    const SizedBox(
                      width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    const CustomText(
                      text: "15 min.",
                      fontFamily: 'Averta-Regular',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kSecondaryColor,
                    ),
                    const SizedBox(
                      width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    const CustomText(
                      text: "away",
                      fontFamily: 'Averta-Medium',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: kContentBGC,
                ),
                child: const CustomText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kHintTextColor,
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              SizedBox(
                height: Get.height * 0.12,
                child: Row(
                  children: [
                    Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                        color: kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: SvgPicture.asset(
                                AppIcons.GALLERY_ADD,
                                color: kSecondaryColor,
                                height: 60,
                              ),
                              onPressed: () {}),
                          const CustomText(
                            text: "add photo",
                            fontFamily: 'Averta-SemiBold',
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.PADDING_SIZE_LARGE,
                    ),
                    Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      ),
                      margin: const EdgeInsets.only(
                          right: Dimensions.PADDING_SIZE_SMALL),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                        child: Stack(children: [
                          Container(
                            height: Get.height * 0.12,
                            width: Get.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_DEFAULT),
                              color: kWhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              AppImages.TOWINGTRUCK,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: InkWell(
                              onTap: () {},
                              child: const RotationTransition(
                                  turns: kAlwaysCompleteAnimation,
                                  child: Icon(
                                    Icons.add,
                                    color: kWhiteColor,
                                    size: 20,
                                  )),
                            ),),
                        ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              PrimaryButton(
                height: Dimensions.BUTTON_HEIGHT,
                width: double.infinity,
                fontColor: kWhiteColor,
                text: "Service Finished",
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fillColor: kSecondaryColor,
                fontFamily: 'Averta-Bold',
                press: () {
                  _controller.ratingCustomerDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
