import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class HomeCustomer extends StatefulWidget {
  const HomeCustomer({Key? key}) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _tabBar() => const TabBar(
    tabs: <Widget>[
      Tab(
        child: CustomText(
          text: "Roadside",
          fontFamily: 'Averta-Bold',
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: kPrimaryColor,
        ),
      ),
      Tab(
        child: CustomText(
          text: "Workshop",
          fontFamily: 'Averta-Bold',
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: kPrimaryColor,
        ),
      ),
      Tab(
        child: CustomText(
          text: "More",
          fontFamily: 'Averta-Bold',
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: kPrimaryColor,
        ),
      ),
    ],
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 4, color: kSecondaryColor),
    ),
  );

  Widget _tabBarView() => TabBarView(
    children: <Widget>[
      roadsideList(),
      roadsideList(),
      roadsideList(),
    ],
  );

  Widget roadsideList() => ListView.builder(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: 3,
    itemBuilder: (BuildContext context, int index){
      return Container(
        margin: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
        width: Get.width * 0.35,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL,horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(Dimensions.RADIUS_LARGE),
          color: const Color(0xFFF6F6F6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              addSerProviderData[index].img,
              height: 130,
            ),
            SizedBox(
              height: 55,
              width: Get.width * 0.3,
              child: CustomText(
                text: addSerProviderData[index].headerTitle,
                fontFamily: 'Averta-Bold',
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                color: kPrimaryColor,
              ),
            ),
            const CustomText(
              text: "20 - 30 min",
              fontFamily: 'Averta-Medium',
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: kHintTextColor,
            ),
          ],
        ),
      );
    },
  );

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
              onTap: () {
                Get.to(SettingsLayout());
              },
              child: SizedBox(
                  height: 10,
                  child: SvgPicture.asset("assets/icon/IconMenu.svg"))),
        ),
        title: Center(
          child: Image.asset(
            'assets/image/Logo.png',
            height: 60,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_LARGE,
                  ),
                  const CustomText(
                    text: "Howdy, Mike",
                    fontFamily: 'Averta-Bold',
                    fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_LARGE,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search our Services",
                      hintStyle: const TextStyle(
                        fontFamily: 'Averta-Bold',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0xFFF5F5F5),
                        ),
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          top: Dimensions.PADDING_SIZE_LARGE,
                          bottom: Dimensions.PADDING_SIZE_LARGE),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                          top: Dimensions.PADDING_SIZE_SMALL,
                          bottom: Dimensions.PADDING_SIZE_SMALL,
                          right: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        child: SvgPicture.asset(
                          AppIcons.SEARCH,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_LARGE,
            ),
            DefaultTabController(
              length: 3,
              child: SizedBox(
                height: Get.height * 0.38,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                      child: _tabBar(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                      height: 1,
                      width: double.infinity,
                      color: const Color(0xFF979797),
                    ),
                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_LARGE,
                    ),
                    Expanded(
                      child: _tabBarView(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_LARGE,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        border:
                            Border.all(width: 1, color: kHintTextColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Road Long Name, km 2",
                              fontFamily: 'Averta-Bold',
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: kPrimaryColor,
                            ),
                            CustomText(
                              text: "Your Location",
                              fontFamily: 'Averta-Bold',
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: kHintTextColor,
                            ),
                          ],
                        ),
                        SvgPicture.asset("assets/icon/Icon Location.svg"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_LARGE,
                  ),
                  PrimaryButton(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: double.infinity,
                    fontColor: kWhiteColor,
                    text: "Request Service",
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fillColor: kSecondaryColor,
                    fontFamily: 'Averta-Bold',
                    press: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
