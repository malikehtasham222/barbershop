part of '../home_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return headerContent(
      context,
      backgroundImage: 'assets/background_1.jpg',
    );
  }

  ClipPath headerContent(
      BuildContext context, {
        String backgroundImage="",
      }) {
    final theme = Theme.of(context);

    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: Screens.width(context),
        height: 250.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black54,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Const.margin),
              child: Column(
                children: [
                  const SizedBox(height: Const.space15),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed<dynamic>(Routes.profileEdit),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Const.space12),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  Assets.profilePhoto,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: Const.space12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Alex!',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .relax_look_great_feel_confident,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: Const.space12),
                        InkWell(
                          onTap: () => Get.toNamed<dynamic>(Routes.notification),
                          borderRadius: BorderRadius.circular(Const.space12),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.2),
                              borderRadius: BorderRadius.circular(Const.space12),
                            ),
                            child: const Icon(
                              FeatherIcons.bell,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Const.space25 * 2),
                  InkWell(
                    onTap: ()=> Get.toNamed<dynamic>(Routes.search),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Const.space12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(Const.radius),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            FeatherIcons.search,
                            color: Colors.white,
                          ),
                          const SizedBox(width: Const.space12),
                          Text(
                            AppLocalizations.of(context)!
                                .search_for_barbershop_name,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
