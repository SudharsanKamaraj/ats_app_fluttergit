import 'package:ats_customar_app/customerApp/view/myWidget/bottom_navigation_bar.dart';
import 'package:ats_customar_app/providerApp/view/myWidget/bottom_navigation_bar_pro.dart';
import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/util/sting_const.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  final selectedValue = 'Customer'.obs;

  Future<void> login(String email, String password) async {
    try {
      await storageLocal.write(key: 'isLogin', value: "true");

      final value = await authRepo.login(email, password);
      var responseData = value.body;
      LoginModal logInData = LoginModal.fromJson(responseData);

      String? token = logInData.accessToken;
      List<String>? roles = logInData.roles;

      await storageLocal.write(key: AppConstants.TOKEN, value: token ?? '');
      await storageLocal.write(
          key: AppConstants.USER_ROLES, value: roles?.join(',') ?? '');

      final String? userToken =
          await storageLocal.read(key: AppConstants.TOKEN);
      final String? userRoles =
          await storageLocal.read(key: AppConstants.USER_ROLES);

      debugPrint("userToken : $userToken");
      debugPrint("userRoles : $userRoles");

      if (selectedValue.value == "Customer" && userRoles == "customer") {
        Get.to(const CustomerBottomNavigationBar());
        debugPrint("NavigationBar : Customer");
        Get.snackbar(AppString.SUCCESS, "${logInData.message}");

      } else if (selectedValue.value == "Provider" && userRoles == "technician") {
        Get.to(const ProviderBottomNavigationBar());
        debugPrint("NavigationBar : Provider");
        Get.snackbar(AppString.SUCCESS, "${logInData.message}");
      }
    } catch (e) {
      debugPrint("login error : $e");
    }
  }

  Future<void> createUserProvider(
    String userName,
    String email,
    String password,
    String mobileNumber,
    String driverLicence,
    String truckPlate,
  ) async {
    try {
      // Call the register method from the authRepo
      await authRepo
          .createUserProvider(
        userName,
        email,
        password,
        mobileNumber,
        driverLicence,
        truckPlate,
      )
          .then((value) async {
        var responseData = value.body;
        //
        // Get.snackbar("Success", "${logInData.message}");
        // Get.to(const CustomBottomNavigationBar());
      });
    } catch (e) {
      debugPrint("Registration error: $e");
    }
  }

  void handleTabSelection(int index) {
    if (index == 0) {
      selectedValue.value = 'Customer';
    } else if (index == 1) {
      selectedValue.value = 'Provider';
    }
  }

}

// class AuthController extends GetxController implements GetxService {
//   final AuthRepo authRepo;
//   AuthController({required this.authRepo});
//
//   Future<void> login(String? email, String? password) async {
//     try {
//       if (email == null || password == null) {
//         // Handle null values if needed
//         return;
//       }
//
//       // Perform login request
//       Response response = await authRepo.login(email, password);
//       ResponseModel responseModel;
//
//       // Handle the response
//       if (response.statusCode == 200) {
//         responseModel = ResponseModel(true, 'successful');
//       } else {
//         // Login failed
//         // Handle the error response if needed
//         responseModel = ResponseModel(false, response.statusText);
//       }
//
//       // Do something with the responseModel if needed
//     } catch (e) {
//       // An error occurred
//       // Handle the error if needed
//       debugPrint("login error : $e");
//     }
//   }

// class AuthController extends GetxController implements GetxService {
//   final AuthRepo authRepo;
//   AuthController({required this.authRepo}) {
//
//   }
//
//   late bool _isLoading;
//   late bool _notification;
//   late XFile _pickedFile;
//   late Timer _timer;
//   late Location _location;
//   late LocationData locationData;
//   late CameraPosition initialCameraPosition;
//   late Map<MarkerId, Marker> markers;
//   late XFile _pickedImage;
//   late List<XFile> _pickedIdentities;
//   late List<String> _identityTypeList;
//   late int _identityTypeIndex;
//   late List<String> _dmTypeList;
//   late int _dmTypeIndex;
//   late XFile _pickedLogo;
//   late XFile _pickedCover;
//   late int _selectedZoneIndex;
//   late LatLng _restaurantLocation;
//   late List<int> _zoneIds;
//   late bool _loading;
//   late bool _inZone;
//   late int _zoneID;
//
//   bool get isLoading => _isLoading;
//   bool get notification => _notification;
//   // ProfileModel get profileModel => _profileModel;
//   XFile get pickedFile => _pickedFile;
//
//   XFile get pickedImage => _pickedImage;
//   List<XFile> get pickedIdentities => _pickedIdentities;
//   List<String> get identityTypeList => _identityTypeList;
//   int get identityTypeIndex => _identityTypeIndex;
//   List<String> get dmTypeList => _dmTypeList;
//   int get dmTypeIndex => _dmTypeIndex;
//   XFile get pickedLogo => _pickedLogo;
//   XFile get pickedCover => _pickedCover;
//   // List<ZoneModel> get zoneList => _zoneList;
//   int get selectedZoneIndex => _selectedZoneIndex;
//   LatLng get restaurantLocation => _restaurantLocation;
//   List<int> get zoneIds => _zoneIds;
//   bool get loading => _loading;
//   bool get inZone => _inZone;
//   int get zoneID => _zoneID;
//
//   // Future<ResponseModel> login(String email, String password) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.login(email, password);
//   //   ResponseModel responseModel;
//   //   if (response.statusCode == 200) {
//   //     Map<String, dynamic> responseBody = response.body;
//   //     // authRepo.saveUserToken(responseBody['token'], responseBody['zone_wise_topic']);
//   //     // await authRepo.updateToken();
//   //  responseModel = ResponseModel(true, 'successful');
//   //   } else {
//   //     responseModel = ResponseModel(false, "response.statusText");
//   //   }
//   //   _isLoading = false;
//   //   update();
//   //   return responseModel;
//   // }
//
//   // String getUserEmail() {
//   //   return authRepo.getUserEmail().toString() ?? "";
//   // }
//   //
//   // String getUserPassword() {
//   //   return authRepo.getUserPassword().toString() ?? "";
//   // }
//
//   // Future<void> getProfile() async {
//   //   Response response = await authRepo.getProfileInfo();
//   //
//   //   if (response.statusCode == 200) {
//   //     _profileModel = ProfileModel.fromJson(response.body);
//   //     if (_profileModel.active == 1) {
//   //       LocationPermission permission = await Geolocator.checkPermission();
//   //       if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever
//   //           || (GetPlatform.isIOS ? false : permission == LocationPermission.whileInUse)) {
//   //         Get.dialog(ConfirmationDialog(
//   //           icon: Images.location_permission,
//   //           iconSize: 200,
//   //           hasCancel: false,
//   //           description: 'this_app_collects_location_data'.tr,
//   //           onYesPressed: () {
//   //             Get.back();
//   //             _checkPermission(() => startLocationRecord());
//   //           },
//   //         ), barrierDismissible: false);
//   //       }else {
//   //         print("profile api location fetching...");
//   //         startLocationRecord();
//   //       }
//   //     } else {
//   //       print("profile api location fetching...1");
//   //       stopLocationRecord();
//   //     }
//   //   } else {
//   //     print("profile api failed");
//   //     ApiChecker.checkApi(response);
//   //   }
//   //   update();
//   // }
//   //
//   // Future<bool> updateUserInfo(ProfileModel updateUserModel, String token) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.updateProfile(updateUserModel, _pickedFile, token);
//   //   _isLoading = false;
//   //   bool _isSuccess;
//   //   if (response.statusCode == 200) {
//   //     _profileModel = updateUserModel;
//   //     print("profile updated ");
//   //     showCustomSnackBar(response.body['message'], isError: false);
//   //     _isSuccess = true;
//   //   } else {
//   //     print("profile not updated ");
//   //     ApiChecker.checkApi(response);
//   //     _isSuccess = false;
//   //   }
//   //   update();
//   //   return _isSuccess;
//   // }
//   //
//   // Future<bool> adddriverdoc(String name,String token,XFile image) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.adddriverdoc(name, _pickedFile, token);
//   //   _isLoading = false;
//   //   bool _isSuccess;
//   //   if (response.statusCode == 200) {
//   //     showCustomSnackBar(response.body['message'], isError: false);
//   //     _isSuccess = true;
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //     _isSuccess = false;
//   //   }
//   //   update();
//   //   return _isSuccess;
//   // }
//   //
//   // Future<bool> adddriverpmt(String wmethod, String email, String cardno, String token) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.adddriverpmt(wmethod, email, cardno, token);
//   //   _isLoading = false;
//   //   bool _isSuccess;
//   //   if (response.statusCode == 200) {
//   //     showCustomSnackBar(response.body['message'], isError: false);
//   //     _isSuccess = true;
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //     _isSuccess = false;
//   //   }
//   //   update();
//   //   return _isSuccess;
//   // }
//   //
//   // Future pickImage() async {
//   //   _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   update();
//   //   return _pickedFile;
//   // }
//   //
//   // Future<bool> changePassword(ProfileModel updatedUserModel, String password) async {
//   //   _isLoading = true;
//   //   update();
//   //   bool _isSuccess;
//   //   Response response = await authRepo.changePassword(updatedUserModel, password);
//   //   _isLoading = false;
//   //   if (response.statusCode == 200) {
//   //     String message = response.body["message"];
//   //     showCustomSnackBar(message, isError: false);
//   //     _isSuccess = true;
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //     _isSuccess = false;
//   //   }
//   //   update();
//   //   return _isSuccess;
//   // }
//   //
//   // Future<bool> updateActiveStatus() async {
//   //   Response response = await authRepo.updateActiveStatus();
//   //   bool _isSuccess;
//   //   if (response.statusCode == 200) {
//   //     _profileModel.active = _profileModel.active == 0 ? 1 : 0;
//   //     showCustomSnackBar(response.body['message'], isError: false);
//   //     _isSuccess = true;
//   //     if (_profileModel.active == 1) {
//   //       LocationPermission permission = await Geolocator.checkPermission();
//   //       if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever
//   //           || (GetPlatform.isIOS ? false : permission == LocationPermission.whileInUse)) {
//   //         Get.dialog(ConfirmationDialog(
//   //           icon: Images.location_permission,
//   //           iconSize: 200,
//   //           hasCancel: false,
//   //           description: 'this_app_collects_location_data'.tr,
//   //           onYesPressed: () {
//   //             Get.back();
//   //             _checkPermission(() => startLocationRecord());
//   //           },
//   //         ), barrierDismissible: false);
//   //       }else {
//   //         startLocationRecord();
//   //       }
//   //     } else {
//   //       stopLocationRecord();
//   //     }
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //     _isSuccess = false;
//   //   }
//   //   update();
//   //   return _isSuccess;
//   // }
//   //
//   // void startLocationRecord() {
//   //   print("location fetching...");
//   //   _location.enableBackgroundMode(enable: true);
//   //   // _timer?.cancel();
//   //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
//   //     recordLocation();
//   //   });
//   // }
//   //
//   // void stopLocationRecord() {
//   //   _location.enableBackgroundMode(enable: false);
//   //   _timer?.cancel();
//   // }
//   //
//   // Future<void> recordLocation() async {
//   //   print("location fetching...2");
//   //   final LocationData _locationResult = await _location.getLocation();
//   //   print('This is current Location: Latitude: ${_locationResult.latitude} Longitude: ${_locationResult.longitude}');
//   //   String _address;
//   //   try{
//   //     List<GeoCoding.Placemark> _addresses = await GeoCoding.placemarkFromCoordinates(_locationResult.latitude, _locationResult.longitude);
//   //     GeoCoding.Placemark _placeMark = _addresses.first;
//   //     _address = '${_placeMark.name}, ${_placeMark.subAdministrativeArea}, ${_placeMark.isoCountryCode}';
//   //     locationData = _locationResult;
//   //     initialCameraPosition= CameraPosition(
//   //         target: LatLng(locationData.latitude,locationData.longitude),
//   //         zoom: 15);
//   //     markers.clear();
//   //     MarkerId markerId = MarkerId("driver");
//   //     Marker marker = Marker(markerId: markerId, icon:BitmapDescriptor.defaultMarker, position: LatLng(locationData.latitude,locationData.longitude));
//   //     markers[markerId] = marker;
//   //   }catch(e) {
//   //     _address = 'Unknown Location Found';
//   //   }
//   //   RecordLocationBody _recordLocation = RecordLocationBody(
//   //     location: _address, latitude: _locationResult.latitude, longitude: _locationResult.longitude,
//   //   );
//   //
//   //   await authRepo.recordLocation(_recordLocation);
//   //
//   //   update();
//   // }
//   //
//   // Future<ResponseModel> forgetPassword(String email) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.forgetPassword(email);
//   //
//   //   ResponseModel responseModel;
//   //   if (response.statusCode == 200) {
//   //     responseModel = ResponseModel(true, response.body["message"]);
//   //   } else {
//   //     responseModel = ResponseModel(false, response.statusText);
//   //   }
//   //   _isLoading = false;
//   //   update();
//   //   return responseModel;
//   // }
//   //
//   // Future<void> updateToken() async {
//   //   await authRepo.updateToken();
//   // }
//   //
//   // Future<ResponseModel> verifyToken(String number) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.verifyToken(number, _verificationCode);
//   //   ResponseModel responseModel;
//   //   if (response.statusCode == 200) {
//   //     responseModel = ResponseModel(true, response.body["message"]);
//   //   } else {
//   //     responseModel = ResponseModel(false, response.statusText);
//   //   }
//   //   _isLoading = false;
//   //   update();
//   //   return responseModel;
//   // }
//   //
//   // Future<ResponseModel> resetPassword(String resetToken, String phone, String password, String confirmPassword) async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.resetPassword(resetToken, phone, password, confirmPassword);
//   //   ResponseModel responseModel;
//   //   if (response.statusCode == 200) {
//   //     responseModel = ResponseModel(true, response.body["message"]);
//   //   } else {
//   //     responseModel = ResponseModel(false, response.statusText);
//   //   }
//   //   _isLoading = false;
//   //   update();
//   //   return responseModel;
//   // }
//   //
//   // String _verificationCode = '';
//   //
//   // String get verificationCode => _verificationCode;
//   //
//   // void updateVerificationCode(String query) {
//   //   _verificationCode = query;
//   //   update();
//   // }
//   //
//   //
//   // bool _isActiveRememberMe = false;
//   //
//   // bool get isActiveRememberMe => _isActiveRememberMe;
//   //
//   // void toggleRememberMe() {
//   //   _isActiveRememberMe = !_isActiveRememberMe;
//   //   update();
//   // }
//   //
//   // bool isLoggedIn() {
//   //   return authRepo.isLoggedIn();
//   // }
//   //
//   // Future<bool> clearSharedData() async {
//   //   return await authRepo.clearSharedData();
//   // }
//   //
//   // void saveUserNumberAndPassword(String number, String password, String countryCode) {
//   //   authRepo.saveUserNumberAndPassword(number, password, countryCode);
//   // }
//   //
//   // String getUserNumber() {
//   //   return authRepo.getUserNumber() ?? "";
//   // }
//   //
//   // String getUserCountryCode() {
//   //   return authRepo.getUserCountryCode() ?? "";
//   // }
//   //
//   // String getUserPassword() {
//   //   return authRepo.getUserPassword() ?? "";
//   // }
//   //
//   // Future<bool> clearUserNumberAndPassword() async {
//   //   return authRepo.clearUserNumberAndPassword();
//   // }
//   //
//   // String getUserToken() {
//   //   return authRepo.getUserToken();
//   // }
//   //
//   // bool setNotificationActive(bool isActive) {
//   //   _notification = isActive;
//   //   authRepo.setNotificationActive(isActive);
//   //   update();
//   //   return _notification;
//   // }
//   //
//   // void initData() {
//   //   _pickedFile = null;
//   // }
//   //
//   // void _checkPermission(Function callback) async {
//   //   LocationPermission permission = await Geolocator.requestPermission();
//   //   permission = await Geolocator.checkPermission();
//   //   if(permission == LocationPermission.denied
//   //       || (GetPlatform.isIOS ? false : permission == LocationPermission.whileInUse)) {
//   //     Get.dialog(CustomAlertDialog(description: 'you_denied'.tr, onOkPressed: () async {
//   //       Get.back();
//   //       await Geolocator.requestPermission();
//   //       _checkPermission(callback);
//   //     }), barrierDismissible: false);
//   //   }else if(permission == LocationPermission.deniedForever) {
//   //     Get.dialog(CustomAlertDialog(description: 'you_denied_forever'.tr, onOkPressed: () async {
//   //       Get.back();
//   //       await Geolocator.openAppSettings();
//   //       _checkPermission(callback);
//   //     }), barrierDismissible: false);
//   //   }else {
//   //     callback();
//   //   }
//   // }
//   //
//   // Future removeDriver() async {
//   //   _isLoading = true;
//   //   update();
//   //   Response response = await authRepo.deleteDriver();
//   //   _isLoading = false;
//   //   if (response.statusCode == 200) {
//   //     showCustomSnackBar('your_account_remove_successfully'.tr, isError: false);
//   //     Get.find<AuthController>().clearSharedData();
//   //     Get.find<AuthController>().stopLocationRecord();
//   //     Get.offAllNamed(RouteHelper.getSignInRoute());
//   //   }else{
//   //     Get.back();
//   //     ApiChecker.checkApi(response);
//   //   }
//   // }
//   //
//   // void setDMTypeIndex(String dmType, bool notify) {
//   //   _dmTypeIndex = _dmTypeList.indexOf(dmType);
//   //   if(notify) {
//   //     update();
//   //   }
//   // }
//   //
//   // void setZoneIndex(int index) {
//   //   _selectedZoneIndex = index;
//   //   update();
//   // }
//   //
//   // Future<void> getZoneList() async {
//   //   _pickedLogo = null;
//   //   _pickedCover = null;
//   //   _selectedZoneIndex = 0;
//   //   _restaurantLocation = null;
//   //   _zoneIds = null;
//   //   Response response = await authRepo.getZoneList();
//   //   if (response.statusCode == 200) {
//   //     _zoneList = [];
//   //     response.body.forEach((zone) => _zoneList.add(ZoneModel.fromJson(zone)));
//   //     setLocation(LatLng(
//   //       double.parse(Get.find<SplashController>().configModel.defaultLocation.lat ?? '0'),
//   //       double.parse(Get.find<SplashController>().configModel.defaultLocation.lng ?? '0'),
//   //     ));
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //   }
//   //   update();
//   // }
//   //
//   // void setLocation(LatLng location) async {
//   //   ZoneResponseModel _response = await getZone(
//   //     location.latitude.toString(), location.longitude.toString(), false,
//   //   );
//   //   if(_response != null && _response.isSuccess && _response.zoneIds.length > 0) {
//   //     _restaurantLocation = location;
//   //     _zoneIds = _response.zoneIds;
//   //     for(int index=0; index<_zoneList.length; index++) {
//   //       if(_zoneIds.contains(_zoneList[index].id)) {
//   //         _selectedZoneIndex = index;
//   //         break;
//   //       }
//   //     }
//   //   }else {
//   //     _restaurantLocation = null;
//   //     _zoneIds = null;
//   //   }
//   //   update();
//   // }
//   //
//   // Future<ZoneResponseModel> getZone(String lat, String long, bool markerLoad, {bool updateInAddress = false}) async {
//   //   if(markerLoad) {
//   //     _loading = true;
//   //   }else {
//   //     _isLoading = true;
//   //   }
//   //   print('problem start');
//   //   if(!updateInAddress){
//   //     update();
//   //   }
//   //   ZoneResponseModel _responseModel;
//   //   Response response = await authRepo.getZone(lat, long);
//   //   if(response.statusCode == 200) {
//   //     _inZone = true;
//   //     _zoneID = int.parse(jsonDecode(response.body['zone_id'])[0].toString());
//   //     List<int> _zoneIds = [];
//   //     jsonDecode(response.body['zone_id']).forEach((zoneId){
//   //       _zoneIds.add(int.parse(zoneId.toString()));
//   //     });
//   //     // List<ZoneData> _zoneData = [];
//   //     // response.body['zone_data'].forEach((zoneData) => _zoneData.add(ZoneData.fromJson(zoneData)));
//   //     // _responseModel = ZoneResponseModel(true, '' , _zoneIds, _zoneData);
//   //     // if(updateInAddress) {
//   //     //   print('here problem');
//   //     //   AddressModel _address = getUserAddress();
//   //     //   _address.zoneData = _zoneData;
//   //     //   saveUserAddress(_address);
//   //     // }
//   //   }else {
//   //     _inZone = false;
//   //     _responseModel = ZoneResponseModel(false, response.statusText, [], []);
//   //   }
//   //   if(markerLoad) {
//   //     _loading = false;
//   //   }else {
//   //     _isLoading = false;
//   //   }
//   //   update();
//   //   return _responseModel;
//   // }
//   //
//   // AddressModel getUserAddress() {
//   //   AddressModel _addressModel;
//   //   try {
//   //     _addressModel = AddressModel.fromJson(jsonDecode(authRepo.getUserAddress()));
//   //   }catch(e) {}
//   //   return _addressModel;
//   // }
//   //
//   // Future<bool> saveUserAddress(AddressModel address) async {
//   //   String userAddress = jsonEncode(address.toJson());
//   //   return await authRepo.saveUserAddress(userAddress, address.zoneIds);
//   // }
//   //
//   // void setIdentityTypeIndex(String identityType, bool notify) {
//   //   int _index = 0;
//   //   for(int index=0; index<_identityTypeList.length; index++) {
//   //     if(_identityTypeList[index] == identityType) {
//   //       _index = index;
//   //       break;
//   //     }
//   //   }
//   //   _identityTypeIndex = _index;
//   //   if(notify) {
//   //     update();
//   //   }
//   // }
//   //
//   // void pickDmImage(bool isLogo, bool isRemove) async {
//   //   if(isRemove) {
//   //     _pickedImage = null;
//   //     _pickedIdentities = [];
//   //   }else {
//   //     if (isLogo) {
//   //       _pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //     } else {
//   //       XFile _xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //       if(_xFile != null) {
//   //         _pickedIdentities.add(_xFile);
//   //       }
//   //     }
//   //     update();
//   //   }
//   // }
//   //
//   // void removeIdentityImage(int index) {
//   //   _pickedIdentities.removeAt(index);
//   //   update();
//   // }
//   //
//   // Future<void> registerDeliveryMan(DeliveryManBody deliveryManBody) async {
//   //   _isLoading = true;
//   //   update();
//   //   List<MultipartBody> _multiParts = [];
//   //   _multiParts.add(MultipartBody('image', _pickedImage));
//   //   for(XFile file in _pickedIdentities) {
//   //     _multiParts.add(MultipartBody('identity_image[]', file));
//   //   }
//   //   Response response = await authRepo.registerDeliveryMan(deliveryManBody, _multiParts);
//   //   if (response.statusCode == 200) {
//   //     Get.offAllNamed(RouteHelper.getSignInRoute());
//   //     showCustomSnackBar('delivery_man_registration_successful'.tr, isError: false);
//   //   } else {
//   //     ApiChecker.checkApi(response);
//   //   }
//   //   _isLoading = false;
//   //   update();
//   // }
//   //
//   //
//   // getFcmToken() async {
//   //   try{
//   //     String fcmtoken = await FirebaseMessaging.instance.getToken();
//   //     String userToken = getUserToken();
//   //     debugPrint("fcm token $fcmtoken");
//   //
//   //     ProfileModel _updatedUser = ProfileModel(fcmToken:fcmtoken);
//   //     await updateUserInfo(_updatedUser,userToken);
//   //   }catch(e){
//   //     debugPrint("fcm token error ${e.toString()}");
//   //   }
//   // }
// }

// Future<void> login(String email, String password, String deviceToken) async {
//   final url = Uri.parse('http://192.168.0.111:3001/api/signin');
//
//   try {
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode(
//           {'email': email, 'password': password, 'deviceToken': deviceToken}),
//     );
//
//     print("this is response $response");
//     print("this is payload ${json.encode({
//           'email': email,
//           'password': password,
//           'deviceToken': deviceToken
//         })}");
//
//     if (response.statusCode == 200) {
//       await storage.write(key: 'isLogin', value: "true");
//       final responseData = json.decode(response.body);
//       final token = responseData['accessToken'];
//       await storage.write(key: 'tokenValue', value: "$token");
//       final id = responseData['id'];
//       Get.defaultDialog(
//           title: "successfully!", middleText: "login successfully!.");
//       print("this is responseData $responseData");
//       print(" this is token $token");
//       Get.to(const CustomBottomNavigationBar());
//     } else {
//       print("Failed to login user: ${response.statusCode},${response.body}");
//       throw Exception('Response');
//     }
//   } catch (e) {
//     // TODO: Handle the error if the user creation fails
//     print("Failed to login user: $e");
//     Get.defaultDialog(title: "oops!", middleText: e.toString());
//   }
// }
