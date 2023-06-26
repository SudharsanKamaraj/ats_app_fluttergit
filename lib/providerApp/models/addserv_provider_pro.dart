import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';
//List<Item> selectedScheduldData=<Item>[];

List<AddSerProviderData> addSerProviderData = <AddSerProviderData>[
  AddSerProviderData(
      headerTitle: 'Towing Truck',
      img: AppImages.TeckAddData1,
      price: 150.00,
      servicesType: "Roadside",
    date: "Apr 15, 2023",
  ),
  AddSerProviderData(
      headerTitle: 'Change Tire',
      img: AppImages.TeckAddData2,
      price: 250.00,
      servicesType: "Roadside",
    date: "Apr 5, 2023",
  ),
  AddSerProviderData(
    headerTitle: 'Battery Boost Copy',
    img: AppImages.TeckAddData3,
    price: 250.00,
    servicesType: "Roadside",
    date: "Apr 1, 2023",
  ),
  AddSerProviderData(
    headerTitle: 'Engine Rebuild',
    img: AppImages.TeckAddData4,
    price: 250.00,
    servicesType: "Workshop",
    date: "Apr 1, 2023",
  ),
  AddSerProviderData(
    headerTitle: 'Brake Maintenance',
    img: AppImages.TeckAddData5,
    price: 250.00,
    servicesType: "Workshop",
    date: "Apr 1, 2023",
  ),
  AddSerProviderData(
    headerTitle: 'A/C Repair',
    img: AppImages.TeckAddData6,
    price: 250.00,
    servicesType: "Workshop",
    date: "Apr 1, 2023",
  ),
];

class AddSerProviderData {
  String headerTitle;
  String img;
  double price;
  String servicesType;
  String date;

  AddSerProviderData({
    required this.headerTitle,
    required this.img,
    required this.price,
    required this.servicesType,
    required this.date,
  });

  Map toJson() {
    return {
      'headerTitle': headerTitle,
      'img': img,
      'price': price,
      'servicesType': servicesType,
      'date': date,
    };
  }
}
