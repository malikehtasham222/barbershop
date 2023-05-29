part of '../search_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _searchController;
  int? _barbershopFound = allBarbershopList.length;
  late List<BarbershopModel> _barbershopList = allBarbershopList;
  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  void searchBarbershop(String query) {
    final result = allBarbershopList.where((barbershop) {
      final titleLower = barbershop.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _barbershopList = result;
      _barbershopFound = _barbershopList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: Column(
        children: [
          _HeaderSection(
            productFound: _barbershopFound,
            searchController: _searchController,
            onChanged: searchBarbershop,
            onSearchTap: () {},
            onFilterTap: ()=>Get.toNamed<dynamic>(Routes.filter),
          ),
          _BodySection(itemCount: _barbershopList),
        ],
      ),
    );
  }
}
