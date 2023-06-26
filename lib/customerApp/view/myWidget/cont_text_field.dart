// import 'package:ats_customar_app/util/index_path_cus.dart';
//
// class ContTextField extends StatefulWidget {
//   const ContTextField({Key? key}) : super(key: key);
//
//   @override
//   State<ContTextField> createState() => _ContTextFieldState();
// }
//
// class _ContTextFieldState extends State<ContTextField> {
//   bool isValidForm = false;
//   late String textController;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: isValidForm ? Dimensions.MESSAGE_INPUT_HEIGHT : 80,
//       child: TextFormField(
//         controller: textController,
//         validator: (inputValue){
//           if(inputValue!.isEmpty){
//             return "Please enter your first name";
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: kWhiteColor,
//           border:  OutlineInputBorder(
//             borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
//           ),
//           // hintText: "login",
//           // hintStyle: TextStyle(
//           //   fontFamily: 'Gilroy-Reguler',
//           //   fontSize: Dimensions.FONT_SIZE_DEFAULT,
//           //   color: kHintText,
//           //     fontStyle: FontStyle.italic
//           // ),
//         ),
//       ),
//     );
//   }
// }
//
//
