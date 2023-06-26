import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ServiceFinishedLayout extends StatefulWidget {
  const ServiceFinishedLayout({Key? key}) : super(key: key);

  @override
  State<ServiceFinishedLayout> createState() => _ServiceFinishedLayoutState();
}

class _ServiceFinishedLayoutState extends State<ServiceFinishedLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: ServiceFinished(),
          tablet: Row(),
        )
    );
  }
}