import 'package:ats_customar_app/util/index_path.dart';

class PrimaryButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final String fontFamily;
  final Color fontColor;
  final Color fillColor;
  final double fontSize;
  final Function press;
  const PrimaryButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.fontFamily,
      required this.fontColor,
      required this.fillColor,
      required this.fontSize,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          press();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(fillColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
