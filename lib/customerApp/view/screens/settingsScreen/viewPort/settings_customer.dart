import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';

class SettingsCustomer extends StatefulWidget {
  const SettingsCustomer({Key? key}) : super(key: key);

  @override
  State<SettingsCustomer> createState() => _SettingsCustomerState();
}

class _SettingsCustomerState extends State<SettingsCustomer> {
  final MyController _controller = Get.put(MyController());
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

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
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                  height: 10,
                  child: SvgPicture.asset(AppIcons.BACK))),
        ),
        title: const Center(
          child: CustomText(
            text: "Settings",
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
              horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.SMS),
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "Notifications",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  CustomSwitch(
                    value: isSwitched1,
                    onChanged: (bool val) {
                      setState(() {
                        isSwitched1 = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              SizedBox(
                width: Get.width * 0.7,
                child: const CustomText(
                  text:
                      "By unchecking this option, you will on longer receive useful information about services and app updates.",
                  fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              const Divider(
                height: 1,
                color: kDividerColor,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.LOCATION),
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "Localization",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  CustomSwitch(
                    value: isSwitched2,
                    onChanged: (bool val) {
                      setState(() {
                        isSwitched2 = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              SizedBox(
                width: Get.width * 0.7,
                child: const CustomText(
                  text:
                      "By unchecking this option, you will not allow the app to use your GPS location.",
                  fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              const Divider(
                height: 1,
                color: kDividerColor,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.LOCK),
                  const SizedBox(
                    width: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "Tow-factor authentication ",
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                  CustomSwitch(
                    value: isSwitched3,
                    onChanged: (bool val) {
                      setState(() {
                        isSwitched3 = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              SizedBox(
                width: Get.width * 0.7,
                child: const CustomText(
                  text:
                      "You need to inform a password and a code for your security.",
                  fontFamily: 'Averta-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: Get.height * 0.3,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  vertical: Dimensions.PADDING_SIZE_LARGE
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Row(
                  children:[
                    SvgPicture.asset(AppIcons.NOTEPAD),
                    const SizedBox(
                      width: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    const Expanded(
                      child: CustomText(
                        text: "Privacy policy",
                        fontFamily: 'Averta-Bold',
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: kPrimaryColor,
                      ),
                    ),
                    RotatedBox(quarterTurns: 2,child: SvgPicture.asset(AppIcons.BACK)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
