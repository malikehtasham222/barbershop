part of '../inbox_page.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: AppLocalizations.of(context)!.inbox,
      ),
      body: ListView(
        children: const [
           _BuildOnlineBarber(),
           SizedBox(height: Const.space25),
           _BuildRecentChats(),
        ],
      ),
    );
  }
}

