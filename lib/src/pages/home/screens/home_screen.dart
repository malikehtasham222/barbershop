part of '../home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _BuildHeader(),
          const _BuildScrollableCategory(),
          const SizedBox(height: Const.space25),
          _BuildScrollableBarbershop(
            itemList: bestBarbershopList,
            label: AppLocalizations.of(context)!.best_barbershop,
            onSeeAllTap: () => Get.toNamed<dynamic>(
              Routes.browseBarbershop,
              arguments: BrowseBarbershopArgument(
                title: AppLocalizations.of(context)!.best_barbershop,
                barbershopList: bestBarbershopList,
              ),
            ),
          ),
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
            itemList: popularBarbershopList,
            label: AppLocalizations.of(context)!.popular_barbershop,
            onSeeAllTap: () => Get.toNamed<dynamic>(
              Routes.browseBarbershop,
              arguments: BrowseBarbershopArgument(
                title: AppLocalizations.of(context)!.popular_barbershop,
                barbershopList: bestBarbershopList,
              ),
            ),
          ),
          const SizedBox(height: Const.space25),
        ],
      ),
    );
  }
}
