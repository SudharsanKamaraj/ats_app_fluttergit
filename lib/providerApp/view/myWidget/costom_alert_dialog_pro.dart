import 'package:ats_customar_app/customerApp/view/screens/test.dart';
import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

void requestsCustomDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Container(
        width: double.infinity,
        height: Get.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kWhiteColor,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
              vertical: Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Image.asset(
                      AppImages.TeckAddData1,
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  const Expanded(
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
                  const CustomText(
                    text: "\$ 150.00",
                    fontFamily: 'Averta-Regular',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_LARGE,
                  ),
                ],
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
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
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
                    const Expanded(
                      child: CustomText(
                        text: "Mike Smith",
                        fontFamily: 'Averta-SemiBold',
                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              const Row(
                children: [
                  Expanded(
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
                          fontFamily: 'Averta-Regular',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Date",
                        fontFamily: 'Averta-SemiBold',
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: kHintTextColor,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      CustomText(
                        text: "ASAP",
                        fontFamily: 'Averta-Regular',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
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
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
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
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: kContentBGC,
                ),
                child: const CustomText(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kHintTextColor,
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: Get.width * 0.37,
                    fontColor: kWhiteColor,
                    text: "Accept",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kSecondaryColor,
                    fontFamily: 'Averta-Bold',
                    press: () {},
                  ),
                  SecondaryButton(
                    height: Dimensions.BUTTON_HEIGHT,
                    width:Get.width * 0.37,
                    fontColor: kPrimaryColor,
                    text: "Decline",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kWhiteColor,
                    fontFamily: 'Averta-Bold',
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void ratingCustomDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Container(
        width: double.infinity,
        height: Get.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kWhiteColor,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
              vertical: Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                child: const CustomText(
                  text: 'Rate Your Experience',
                  fontFamily: 'Averta-Bold',
                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                  color: kPrimaryColor,
                ),
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
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
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
                          text: "James Porter",
                          fontFamily: 'Averta-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        ),
                        CustomText(
                          text: "Truck - Plate: YYY-0000",
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
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              SizedBox(
                width: Get.width * 0.5,
                child: const Text(
                  "How was your experience with James?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,)
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              ThreeToggleButton(),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              StarRating(
                starCount: 5,
                rating: 3.5,
                color: const Color(0xFFFFD02B),
                size: 30.0,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              PrimaryButton(
                height: Dimensions.BUTTON_HEIGHT,
                width: double.infinity,
                fontColor: kWhiteColor,
                text: "Submit",
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fillColor: kSecondaryColor,
                fontFamily: 'Averta-Bold',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

