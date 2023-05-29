part of '../splash_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: Const.splashDuration),
      () => Get.offAllNamed<dynamic>(Routes.onBoarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SvgPicture.asset(
            Assets.logo,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
