part of '../nearby_page.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'Hi, Alex!',
        enableLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.filter),
            color: theme.primaryColor,
            icon: const Icon(
              Icons.filter_alt,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: Const.space15),
          _BuildHeader(controller: _controller),
          const SizedBox(height: Const.space25),
          _BuildScrollableBarber(
            itemList: topBarberList,
            label: AppLocalizations.of(context)!.barber_specialist,
            onSeeAllTap: () => Get.toNamed<dynamic>(
              Routes.browseBarber,
              arguments: BrowseBarberArgument(
                title: AppLocalizations.of(context)!.barber_specialist,
                barberList: topBarberList,
              ),
            ),
          ),
          const SizedBox(height: Const.space25),
          _BuildScrollableBarbershop(
            itemList: nearestBarbershopList,
            label: AppLocalizations.of(context)!.nearest_barbershop,
            onSeeAllTap: () => Get.toNamed<dynamic>(
              Routes.browseBarbershop,
              arguments: BrowseBarbershopArgument(
                title: AppLocalizations.of(context)!.best_barbershop,
                barbershopList: bestBarbershopList,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Open Google Map
        },
        backgroundColor: theme.primaryColor,
        child: const Icon(
          FeatherIcons.map,
          color: Colors.white,
        ),
      ),
    );
  }
}
