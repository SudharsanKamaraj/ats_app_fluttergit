import 'package:ats_customar_app/util/index_path.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  const CustomText({Key? key, required this.text, required this.fontFamily, required this.color, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
