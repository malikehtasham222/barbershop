part of '../inbox_page.dart';

class _BuildListTile extends StatelessWidget {
  final ChatModel chat;

  const _BuildListTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {
        Get.toNamed<dynamic>(Routes.chat,arguments: chat);
      },
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: theme.cardColor,
            backgroundImage:
                CachedNetworkImageProvider(chat.barber?.photo ?? ''),
          ),
          if (chat.totalUnread == null || chat.totalUnread == 0)
            const SizedBox()
          else
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: theme.primaryColor,
                child: Text(
                  chat.totalUnread.toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    // fontSize: 5,
                  ),
                ),
              ),
            )
        ],
      ),
      title: Text(chat.barber?.name ?? '', style: theme.textTheme.headlineSmall),
      subtitle: Text(
        chat.lastMessage ?? '',
        style: theme.textTheme.bodyMedium,
        maxLines: 1,
      ),
      trailing: Text(
        DateFormat.jm().format(chat.dateTime ?? DateTime.now()),
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 10),
      ),
    );
  }
}
