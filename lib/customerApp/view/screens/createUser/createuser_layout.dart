import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class CreateUserLayout extends StatefulWidget {
  const CreateUserLayout({Key? key}) : super(key: key);

  @override
  State<CreateUserLayout> createState() => _CreateUserLayoutState();
}

class _CreateUserLayoutState extends State<CreateUserLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: CreateUserCustomer(),
          tablet: Row(),
        )
    );
  }
}
