import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';



class MapController extends GetxController {
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor customIcon;
  LocationData? thisLocation;

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void setCustomMarkerIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), AppIcons.YOURLOCATION);
  }

  Future<void> getLocation() async {
    Location location = Location();
    LocationData currentLocation = await location.getLocation();
    thisLocation = currentLocation!;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          ),
          zoom: 15,
        ),
      ),
    );
    update(); // update the state of the controller
  }


  static const LatLng sourceLocation = LatLng(11.049983, 77.054013);
  static const LatLng destination = LatLng(11.036933, 77.038318);

  late List<LatLng> polylineCoordinates;

  void getPolyPoints() {
    polylineCoordinates = [
      sourceLocation,
      const LatLng(11.044903, 77.054327),
      const LatLng(11.045973, 77.053319),
      const LatLng(11.048040, 77.052460),
      destination,
    ];
  }

  @override
  void onInit() {
    super.onInit();
    setCustomMarkerIcon();
    getPolyPoints();
    Future.delayed(const Duration(seconds: 4), () {
      update(); // update the state of the controller
    });
  }
}

