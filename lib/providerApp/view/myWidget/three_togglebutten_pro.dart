import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ThreeToggleButton extends StatefulWidget {
  const ThreeToggleButton({Key? key}) : super(key: key);

  @override
  _ThreeToggleButtonState createState() {
    return _ThreeToggleButtonState();
  }
}

class _ThreeToggleButtonState extends State<ThreeToggleButton>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = kWhiteColor;
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'Great!'),
    const Tab(text: 'Ok.'),
    const Tab(text: 'More'),
  ];

  final _iconTabs = [
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.search)),
    const Tab(icon: Icon(Icons.settings)),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
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
              borderRadius: BorderRadius.circular(8.0),
              color: _selectedColor,),
          labelColor: kSecondaryColor,
          unselectedLabelColor: kPrimaryColor,
          labelStyle: const TextStyle(
            fontFamily: 'Averta-SemiBold',
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
          ),
          tabs: _tabs,
        ),
      ),
    );
  }
}