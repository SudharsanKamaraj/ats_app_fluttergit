import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ActivityLayout extends StatefulWidget {
  const ActivityLayout({Key? key}) : super(key: key);

  @override
  State<ActivityLayout> createState() => _ActivityLayoutState();
}

class _ActivityLayoutState extends State<ActivityLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: ActivityScreen(),
          tablet: Row(),
        )
    );
  }
}