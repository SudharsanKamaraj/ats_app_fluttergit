import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

// class CustomDropdown extends StatefulWidget {
//   final String text;
//   final double fontSize;
//   final String fontFamily;
//   final Color fontColor;
//   final List<String> items;
//   final Function(String)? press;
//
//   const CustomDropdown(
//       {required this.text,
//         required this.fontSize,
//         required this.fontFamily,
//         required this.fontColor,
//         required this.items,
//         this.press,})
//       : super(key: key);
//
//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }
//
// class _CustomDropdownState extends State<CustomDropdown> {
//   String? valueChoose;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: Dimensions.MESSAGE_INPUT_HEIGHT,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
//           border: Border.all(
//             width: 1,
//             color: kHintTextColor
//           )),
//       child: DropdownButtonFormField(
//         icon: const Icon(Icons.arrow_drop_down_outlined),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: kBgLightColor,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         hint: Text(
//           widget.text,
//           style: TextStyle(
//             fontFamily: widget.fontFamily,
//             fontSize: widget.fontSize,
//             color: widget.fontColor,
//           ),
//         ),
//         value: valueChoose,
//         items: widget.items.map((valueItem) {
//           return DropdownMenuItem(
//             value: valueItem,
//             child: Text(valueItem),
//           );
//         }).toList(),
//     onChanged: widget.press(),
//         // onChanged: (newValue) {
//         //   setState(() {
//         //     valueChoose = newValue as String?;
//         //   });
//       ),
//     );
//   }
// }

class CustomDropdown extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color fontColor;
  final List<String> items;
  final Function(String)? press; // Update the type of the press callback to accept String
  final Function onTap;


  CustomDropdown({
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.fontColor,
    required this.items,
    this.press, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.MESSAGE_INPUT_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
        border: Border.all(
          width: 1,
          color: kHintTextColor,
        ),
      ),
      child: DropdownButtonFormField<String>( // Explicitly set the type argument to String
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
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
        value: null,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onTap:() {onTap();},
        onChanged: (String? selectedVa) {
          if (press != null) {

            press!(selectedVa!);
          }
        },
      ),
    );
  }
}


