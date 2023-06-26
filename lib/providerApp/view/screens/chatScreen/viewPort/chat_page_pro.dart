import 'package:ats_customar_app/util/index_path.dart';
import 'package:ats_customar_app/providerApp/util/index_path.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
              child:
                  SizedBox(height: 10, child: SvgPicture.asset(AppIcons.BACK))),
        ),
        title: const Center(
          child: CustomText(
            text: "AMO Chat",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    right: messages[index].messageType == "receiver" ? 40 : 0,
                    left : messages[index].messageType == "receiver" ? 0 : 40,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE,
                      vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                              Dimensions.RADIUS_EXTRA_LARGE),
                          topRight: const Radius.circular(
                              Dimensions.RADIUS_EXTRA_LARGE),
                          bottomRight:
                              (messages[index].messageType == "receiver"
                                  ? const Radius.circular(
                                      Dimensions.RADIUS_EXTRA_LARGE)
                                  : const Radius.circular(0)),
                          bottomLeft:
                              (messages[index].messageType == "receiver"
                                  ? const Radius.circular(0)
                                  : const Radius.circular(
                                      Dimensions.RADIUS_EXTRA_LARGE)),
                        ),
                        color: (messages[index].messageType == "receiver"
                            ? kSecondaryColor
                            : const Color(0xFFF3F3F3)),
                      ),
                      padding: const EdgeInsets.all(
                          Dimensions.PADDING_SIZE_DEFAULT),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              text: messages[index].name,
                              fontFamily: 'Averta-Bold',
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              color: messages[index].messageType == "receiver"
                                  ? kWhiteColor
                                  : kPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              text: messages[index].messageContent,
                              fontFamily: 'Averta-Regular',
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: messages[index].messageType == "receiver"
                                  ? kWhiteColor
                                  : kPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              text: messages[index].messageTime,
                              fontFamily: 'Averta-Bold',
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: kDividerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE),
            child: Divider(
              height: 1,
              color: kDividerColor,
            ),
          ),
          const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE,
                vertical: Dimensions.PADDING_SIZE_SMALL),
           padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            height: Dimensions.MESSAGE_INPUT_HEIGHT,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, color: const Color(0xFFF5F5F5),
              ),
              borderRadius:
                  BorderRadius.circular(Dimensions.RADIUS_LARGE),
              color: kWhiteColor,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type Here…",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'Averta-Bold',
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: kPrimaryColor,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Averta-Bold',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    AppIcons.SENDARR,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
