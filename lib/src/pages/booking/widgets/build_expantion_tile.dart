part of '../booking_page.dart';

class _BuildExpantionTile extends StatefulWidget {
  final CategoryModel service;

  const _BuildExpantionTile({Key? key, required this.service})
      : super(key: key);

  @override
  __BuildExpantionTileState createState() => __BuildExpantionTileState();
}

class __BuildExpantionTileState extends State<_BuildExpantionTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ExpansionTile(
        title: Text(
          widget.service.name ?? '',
          style: theme.textTheme.headlineSmall!.copyWith(
            fontSize: 14,
          ),
        ),
        trailing: Text(
          AppLocalizations.of(context)!.view_all,
          style: theme.textTheme.bodyLarge,
        ),
        leading: CircleAvatar(
          radius: Const.radius,
          backgroundColor: theme.cardColor,
          child: SvgPicture.asset(
            widget.service.icon ?? '',
            width: 25,
            colorFilter: ColorFilter.mode(
              theme.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        children: widget.service.services!.map(
          (e) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.cardColor),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(
                        widget.service.icon ?? '',
                        width: 25,
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Const.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                e.name ?? '',
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (e.isSelected == false) {
                                  setState(() {
                                    e.isSelected = true;
                                  });
                                } else {
                                  setState(() {
                                    e.isSelected = false;
                                  });
                                }
                              },
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: theme.primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    color: (e.isSelected == true)
                                        ? theme.primaryColor
                                        : theme.colorScheme.background,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Const.space5),
                        Row(
                          children: [
                            Icon(
                              FeatherIcons.clock,
                              size: 14,
                              color: theme.unselectedWidgetColor,
                            ),
                            const SizedBox(width: Const.space5),
                            Text('10 Min', style: theme.textTheme.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: Const.space5),
                        Text('Lorem ipsum dolor sit amet',
                            style: theme.textTheme.bodyMedium),
                        const SizedBox(height: Const.space5),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Const.space12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                                NumberFormat.currency(
                                  symbol: r'$',
                                  decimalDigits: 0,
                                ).format(e.price),
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 14,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
