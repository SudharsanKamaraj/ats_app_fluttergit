import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';



class CustomDropdown extends StatefulWidget {
  final List<dynamic> items;
  final String text;
  final String fontFamily;
  final Color fontColor;
  final double fontSize;

  const CustomDropdown(
      {Key? key,
      required this.items,
      required this.text,
      required this.fontFamily,
      required this.fontColor,
      required this.fontSize})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.MESSAGE_INPUT_HEIGHT,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          border: Border.all(
            width: 1,
            color: kHintTextColor
          )),
      child: DropdownButtonFormField(
        icon: const Icon(Icons.arrow_drop_down_outlined),
        decoration: InputDecoration(
          filled: true,
          fillColor: kBgLightColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
            borderSide: BorderSide.none,
          ),
        ),
        hint: Text(
          widget.text,
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize,
            color: widget.fontColor,
          ),
        ),
        value: valueChoose,
        items: widget.items.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue as String?;
          });
        },
      ),
    );
  }
}
