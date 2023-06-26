import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>{
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
              child: SizedBox(
                  height: 10,
                  child: SvgPicture.asset("assets/icon/IconMenu.svg"))),
        ),
        title: const Center(
          child: CustomText(
            text: "Requests",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              const CustomText(
                text: "Now",
                fontFamily: 'Averta-Bold',
                fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                color: kPrimaryColor,
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      border: Border.all(width: 3, color: kWhiteColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(4, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraits) {
                          return SizedBox(
                              height: constraits.maxHeight / 1, child: const MapSample());
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    height: Get.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      color: kWhiteColor,
                    ),
                    child: Row(
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
                                text: "ASAP",
                                fontFamily: 'Averta-SemiBold',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              ),
                              CustomText(
                                text: "Towing Truck",
                                fontFamily: 'Averta-Bold',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                        const CustomText(
                          text: "\$ 250,00",
                          fontFamily: 'Averta-Regular',
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.33,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: PrimaryButton(
                        height: Dimensions.BUTTON_HEIGHT,
                        width: Get.width * 0.5,
                        fontColor: kWhiteColor,
                        text: "Open Service Request",
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fillColor: kSecondaryColor,
                        fontFamily: 'Averta-Bold',
                        press: () {
                          _controller.serRequestsCustomDialog();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.width * 0.05,
              ),
              const CustomText(
                text: "Future Requests",
                fontFamily: 'Averta-Bold',
                fontSize: Dimensions.FONT_SIZE_CLASSIC_LARGE,
                color: kPrimaryColor,
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    height: Get.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0,
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
                        SizedBox(
                          width: 80,
                          child: Image.asset(
                            AppImages.TeckAddData3,
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
                                text: "May 1, 2023",
                                fontFamily: 'Averta-SemiBold',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              ),
                              CustomText(
                                text: "Battery Boost",
                                fontFamily: 'Averta-Bold',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                        const CustomText(
                          text: "\$ 250,00",
                          fontFamily: 'Averta-Regular',
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
