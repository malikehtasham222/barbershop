part of '../browse_barbershop_page.dart';

class BrowseBarbershopArgument{
  final String title;
  final List<BarbershopModel> barbershopList;

  BrowseBarbershopArgument({required this.title, required this.barbershopList});
}

class BrowseBarbershopScreen extends StatefulWidget {
  const BrowseBarbershopScreen({Key? key}) : super(key: key);

  @override
  State<BrowseBarbershopScreen> createState() => _BrowseBarbershopScreenState();
}

class _BrowseBarbershopScreenState extends State<BrowseBarbershopScreen> {
  late BrowseBarbershopArgument _args;

  @override
  void initState(){
    super.initState();
    _args = Get.arguments as BrowseBarbershopArgument;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: _args.title),
      body: ListView.builder(
        itemCount: _args.barbershopList.length,
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        itemBuilder: (context, index) {
          final barbershop = _args.barbershopList[index];
          return _BuildBarbershopCard(barbershop: barbershop);
        },
      ),
    );
  }
}
