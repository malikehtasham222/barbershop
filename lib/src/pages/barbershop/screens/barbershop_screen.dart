part of '../barbershop_page.dart';

class BarbershopScreen extends StatefulWidget {
  const BarbershopScreen({Key? key}) : super(key: key);

  @override
  State<BarbershopScreen> createState() => _BarbershopScreenState();
}

class _BarbershopScreenState extends State<BarbershopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BarbershopModel _barbershop;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _barbershop = Get.arguments as BarbershopModel;
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  List<Widget> salonTab(BuildContext context) => [
        Tab(text: AppLocalizations.of(context)!.about),
        Tab(text: AppLocalizations.of(context)!.services),
        Tab(text: AppLocalizations.of(context)!.gallery),
        Tab(text: AppLocalizations.of(context)!.review),
      ];

  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri(
        scheme: 'https',
        host: url,
      ),
      mode: LaunchMode.externalApplication,
    )) {
      // showToast(msg: AppLocalizations.of(context)!.website_not_available);
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchPhoneCall(String number) async {
    await launchUrl(Uri(
      scheme: 'tel',
      path: number,
    ));
  }

  Future<void> _launchShare() async {
    await Share.share('check out my website https://google.com');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _BuildSliverAppBar(
            isBookmarked: _isBookmarked,
            barbershop: _barbershop,
            onShareTap: _launchShare,
            onBookmarkTap: () {
              setState(() => _isBookmarked = !_isBookmarked);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: Const.space25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BuildFeatureTile(
                      icon: FeatherIcons.globe,
                      label: AppLocalizations.of(context)!.website,
                      onTap: () => _launchInBrowser('www.google.com'),
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.phoneCall,
                      label: AppLocalizations.of(context)!.call,
                      onTap: () => _launchPhoneCall('081353020948'),
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.map,
                      label: AppLocalizations.of(context)!.direction,
                      onTap: () {
                        //TODO: Direction
                      },
                    ),
                    _BuildFeatureTile(
                      icon: FeatherIcons.calendar,
                      label: AppLocalizations.of(context)!.book,
                      onTap: () => Get.toNamed<dynamic>(Routes.bookingService),
                    ),
                  ],
                ),
                const SizedBox(height: Const.space25),
                const _BuildScrollableBarber(),
                const SizedBox(height: Const.space15),
                TabBar(
                  controller: _tabController,
                  indicatorColor: theme.primaryColor,
                  labelColor: theme.primaryColor,
                  unselectedLabelColor: theme.disabledColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: salonTab(context),
                ),
                Center(
                  child: [
                    const _AboutTabBarView(),
                    const _ServicesTabBarView(),
                    _GalleryTabBarView(barbershop: _barbershop),
                    const _ReviewTabBarView(),
                  ][_tabController.index],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
