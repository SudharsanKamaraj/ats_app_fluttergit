import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ProfileIcon extends StatelessWidget {
  final String img;
  final VoidCallback? onTap;
  final int notificationCount;

  const ProfileIcon({
    Key? key,
    this.onTap,
    required this.img,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_LARGE),
        width: Get.width * 0.13,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: Get.width * 0.13,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey,
              ),
              child: Image.asset(img),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: kSecondaryColor),
                alignment: Alignment.center,
                child: CustomText(
                  text: '$notificationCount',
                  fontFamily: 'Averta-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  color: kWhiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}