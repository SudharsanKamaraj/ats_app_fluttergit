import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class RequestsLayout extends StatefulWidget {
  const RequestsLayout({Key? key}) : super(key: key);

  @override
  State<RequestsLayout> createState() => _RequestsLayoutState();
}

class _RequestsLayoutState extends State<RequestsLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: RequestsScreen(),
          tablet: Row(),
        )
    );
  }
}