import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';

class Element {
  String modal;
  String serviceType;
  String periods;
  String img;

  Element(this.modal, this.serviceType, this.periods, this.img);
}

List<Element> _elements = <Element>[
  // Element('More', 'Lorem Ipsum','5 Days', AppImages.TeckAddData4),
  Element('Roadside', 'Towing Truck', '20 - 30min.', AppImages.TeckAddData1),
  Element('Roadside', 'Change Tire', '20 - 30min.', AppImages.TeckAddData2),
  Element(
      'Roadside', 'Battery Boost Copy', '20 - 30min.', AppImages.TeckAddData3),
  Element('Workshop', 'Engine Rebuild', '5 Days', AppImages.TeckAddData4),
  Element('Workshop', 'Brake Maintenance', '2 Days', AppImages.TeckAddData5),
  Element('Workshop', 'A/C Repair', '1 Days', AppImages.TeckAddData6),
  Element('More', 'Lorem Ipsum', '5 Days', AppImages.TeckAddData4),
];

class ServiceCustomer extends StatefulWidget {
  const ServiceCustomer({Key? key}) : super(key: key);

  @override
  State<ServiceCustomer> createState() => _ServiceCustomerState();
}

class _ServiceCustomerState extends State<ServiceCustomer> {
  Widget _getGroupSeparator(Element element) {
    return Container(
      color: kWhiteColor,
      height: 40,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            element.modal,
            style: const TextStyle(
              fontFamily: 'Averta-Bold',
              fontSize: Dimensions.FONT_SIZE_CLASSIC_LARGE,
              color: kSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _getItem(BuildContext ctx, Element element) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      margin: const EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      height: Get.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
        color: const Color(0xFFF6F6F6),
      ),
      child: Row(
        children: [
          SizedBox(width: 50, child: Image.asset(element.img)),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: element.serviceType,
                  fontFamily: 'Averta-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                CustomText(
                  text: element.periods,
                  fontFamily: 'Averta-Bold',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kHintTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.PADDING_SIZE_LARGE,
          right: Dimensions.PADDING_SIZE_LARGE,
          top: Dimensions.PADDING_SIZE_LARGE,
        ),
        child: Column(
          children: [
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
                    bottom: Dimensions.PADDING_SIZE_LARGE
                ),
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
            Expanded(
              child: StickyGroupedListView<Element, String>(
                physics: const BouncingScrollPhysics(),
                elements: _elements,
                order: StickyGroupedListOrder.ASC,
                groupBy: (Element element) => (element.modal),
                groupComparator: (String value1, String value2) =>
                    value2.compareTo(value1),
                itemComparator: (Element element1, Element element2) =>
                    element1.modal.compareTo(element2.modal),
                groupSeparatorBuilder: _getGroupSeparator,
                itemBuilder: _getItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
