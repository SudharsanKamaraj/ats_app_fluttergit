import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({Key? key}) : super(key: key);

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: SettingsCustomer(),
          tablet: Row(),
        )
    );
  }
}
