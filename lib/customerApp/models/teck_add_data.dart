import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';
import 'package:ats_customar_app/util/index_path.dart';
//List<Item> selectedScheduldData=<Item>[];

List<TeckAddData> teckAddData = <TeckAddData>[
  TeckAddData(
    headerTitle: 'Tire Change',
    img: AppImages.TeckAddData1,
    price: 150.00,
  ),
  TeckAddData(
    headerTitle: 'Towing',
    img: AppImages.TeckAddData2,
    price: 250.00,
  ),
];

class TeckAddData {
  String headerTitle;
  String img;
  double price;

  TeckAddData({
    required this.headerTitle,
    required this.img,
    required this.price,
  });

  Map toJson() {
    return {
      'headerTitle': headerTitle,
      'img': img,
      'price': price,
    };
  }

}
