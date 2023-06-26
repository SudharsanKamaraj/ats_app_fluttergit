import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/customerApp/util/index_path_cus.dart';


class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        compassEnabled: false,
        initialCameraPosition: MapController.kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: mapController.thisLocation != null
            ? {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(
              mapController.thisLocation!.latitude!,
              mapController.thisLocation!.longitude!,
            ),
            icon: mapController.customIcon,
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: MapController.sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: MapController.destination,
          ),
        }
            : {},
      ),
    );
  }
}