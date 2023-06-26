import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

const storage = FlutterSecureStorage();

class AddServiceProvider extends StatefulWidget {
  const AddServiceProvider({Key? key}) : super(key: key);

  @override
  State<AddServiceProvider> createState() => _AddServiceProviderState();
}

class _AddServiceProviderState extends State<AddServiceProvider> {
  final feeController = TextEditingController();
  late String _feeInputVal = "";
  List<Service> dataList = [];
  List<ServiceFilter> filterList = [];
  List<ServiceFilter> filterList2 = [];
  List categorySelect = listCategoryService;
  var valueChoose="".obs;
  String? typeChoose;

  @override
  void initState() {
    super.initState();
    getData();
    filterData();
    print("categorySelect : $categorySelect");
  }

  Future<void> getData() async {
    final token = await storage.read(key: 'tokenValue') ?? '';

    try {
      await fetchData(token).then((value) {
        dataList = value.service!;

        setState(() {});
      });
    } catch (e) {
      print('Error: $e');
      print('token: $token');
    }
  }

  Future<void> filterData() async {
    final token = await storage.read(key: 'tokenValue') ?? '';

    try {
      await fetchDataFilter(token).then((value) {
        filterList = value.serviceFilter!;

        dataList = dataList.where((data) {
          return filterList.any((filter) => filter.serviceType == data.serviceType);
        }).toList();

        setState(() {});
      });
    } catch (e) {
      print('Error: $e');
      print('token: $token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_LARGE,
              right: Dimensions.PADDING_SIZE_SMALL,
              top: Dimensions.PADDING_SIZE_LARGE,
              bottom: Dimensions.PADDING_SIZE_LARGE),
          child: InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 10,
                  child: SvgPicture.asset("assets/icon/IconMenu.svg"))),
        ),
        title: const Center(
          child: CustomText(
            text: "Service",
            fontFamily: 'Averta-Bold',
            fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
            color: kSecondaryColor,
          ),
        ),
        actions: [
          ProfileIcon(
            img: AppImages.PROFILE,
            notificationCount: 2,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_LARGE,
            right: Dimensions.PADDING_SIZE_LARGE,
            top: Dimensions.PADDING_SIZE_LARGE,
          ),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    margin: const EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    height: Get.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      color: const Color(0xFFF6F6F6),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 50,
                            child: Image.asset(
                              addSerProviderData[index].img,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: dataList[index].serviceType!,
                                fontFamily: 'Averta-Bold',
                                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                color: kPrimaryColor,
                              ),
                              CustomText(
                                text:
                                    "${dataList[index].serviceCategory} . \$ ${addSerProviderData[index].price} .",
                                fontFamily: 'Averta-Midume',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kHintTextColor,
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(AppIcons.MORE),
                        const SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              CustomDropdown(

                text: "Type of Service",
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fontFamily: 'Averta-SemiBold',
                fontColor: kHintText,
                items: listCategoryService, // Convert to List<String> using cast method
                onTap:(){
                  setState(() {
                    typeChoose=null;
                    print("valueChoose : $typeChoose,  ${filterList.length}");

                  });
                },
                press: (newValue) {
                  setState(() {

                    valueChoose.value = newValue;

                    print("valueChoose : $valueChoose,  ${filterList.length}");
                  });
                },
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              Obx(() => CustomDropdown(
                onTap: (){

                },
                text: "Type of Service",
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fontFamily: 'Averta-SemiBold',
                fontColor: kHintText,
                items:  filterList.where((element) => element.serviceCategory==valueChoose.value).toList().map((e) => e.serviceType.toString()).toList(), // Convert to List<String> using cast method
                press: (newValue) {
                  setState(() {
                    typeChoose = newValue as String?;
                    print("typechoos : $typeChoose, ${filterList.length}");
                  });
                },
              ),),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: feeController,
                  validator: (inputValue) {
                    if (inputValue!.isEmpty) {
                      return "Please enter your Fee \$";
                    }
                    return null;
                  },
                  onChanged: (inputValue) {
                    _feeInputVal = inputValue;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kWhiteColor,
                    prefix: _feeInputVal.isEmpty
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: Dimensions.PADDING_SIZE_LARGE,
                              width: Dimensions.PADDING_SIZE_LARGE,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: kPrimaryColor),
                              child: const Icon(
                                Icons.check,
                                color: kWhiteColor,
                                size: 15,
                              ),
                            ),
                          ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFFF5F5F5),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Fee \$",
                    hintStyle: const TextStyle(
                      fontFamily: 'Averta-SemiBold',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kHintText,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_LARGE),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: kSecondaryColor,
                  elevation: 0,
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }


}
