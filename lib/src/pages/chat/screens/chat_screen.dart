part of '../chat_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   late ChatModel _chat;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _chat = Get.arguments as ChatModel;
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context,chat: _chat),
      body: Column(
        children: [
          _BuildChatList(chat: _chat),
          _BuildChatArea(textController: _textController)
        ],
      ),
    );
  }
}
