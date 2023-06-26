import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';
import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/util/sting_const.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AuthController _toggleButtonController = Get.find<AuthController>();

  final _selectedColor = kWhiteColor;
  final _tabs = [
    const Tab(text: AppString.CUSTOMER),
    const Tab(text: AppString.PROVIDER),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
    print("tabController ${_tabController.index}");
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _handleTabSelection(int index) {
    setState(() {
      _tabController.index = index;
    });
    _toggleButtonController.handleTabSelection(index);
    debugPrint("_selectedValue: ${_toggleButtonController.selectedValue.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.07,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFF1F1F1),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
            color: _selectedColor,
          ),
          labelColor: kSecondaryColor,
          unselectedLabelColor: kPrimaryColor,
          labelStyle: const TextStyle(
            fontFamily: 'Averta-SemiBold',
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
          ),
          tabs: _tabs,
          onTap: (index) => _handleTabSelection(index),
        ),
      ),
    );
  }
}
