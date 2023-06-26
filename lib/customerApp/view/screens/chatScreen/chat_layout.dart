import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class ChatLayout extends StatefulWidget {
  const ChatLayout({Key? key}) : super(key: key);

  @override
  State<ChatLayout> createState() => _ChatLayoutState();
}

class _ChatLayoutState extends State<ChatLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Responsive(
          mobile: ChatPage(),
          tablet: Row(),
        )
    );
  }
}