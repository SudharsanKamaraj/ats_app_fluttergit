import 'package:ats_customar_app/customerApp/view/screens/servicesScreen/viewPort/services_customer.dart';
import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';

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
          mobile: ServiceCustomer(),
          tablet: Row(),
        )
    );
  }
}
