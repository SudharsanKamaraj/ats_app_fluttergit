class ChatMessage{
  String name;
  String messageContent;
  String messageType;
  String messageTime;
  ChatMessage({required this.name,required this.messageContent, required this.messageType, required this.messageTime});
}

List<ChatMessage> messages = [
  ChatMessage(name: "Sky",messageContent: "Hi there! Consectetur adipiscing edit. Vitae arch bibendum, premium quad sed, vestibulum sapiens. Any thoughts?", messageType: "sender",messageTime: "16:01"),
  ChatMessage(name: "Amo",messageContent: "Hello! Thanks for getting in touch. Loren ipsum dolor sit?", messageType: "receiver",messageTime: "16:06"),
];