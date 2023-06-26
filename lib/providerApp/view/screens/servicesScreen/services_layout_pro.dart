import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ServiceLayout extends StatefulWidget {
  const ServiceLayout({Key? key}) : super(key: key);

  @override
  State<ServiceLayout> createState() => _ServiceLayoutState();
}

class _ServiceLayoutState extends State<ServiceLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: AddServiceProvider(),
          tablet: Row(),
        )
    );
  }
}
