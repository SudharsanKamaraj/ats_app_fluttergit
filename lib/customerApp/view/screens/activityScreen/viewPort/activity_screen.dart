import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>{
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
            text: "Activity",
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
                text: "This month",
                fontFamily: 'Averta-Bold',
                fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                color: kPrimaryColor,
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
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
                            addSerProviderData[index].img,
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: addSerProviderData[index].date,
                                fontFamily: 'Averta-SemiBold',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSecondaryColor,
                              ),
                              const SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              ),
                              CustomText(
                                text: addSerProviderData[index].headerTitle,
                                fontFamily: 'Averta-Bold',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                        CustomText(
                          text: "\$ ${addSerProviderData[index].price}",
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
                height: Get.width * 0.4,
              ),
              SecondaryButton(
                height: Dimensions.BUTTON_HEIGHT,
                width: double.infinity,
                fontColor: kPrimaryColor,
                text: "More",
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fillColor: kWhiteColor,
                fontFamily: 'Averta-Bold',
                press: () {},
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
