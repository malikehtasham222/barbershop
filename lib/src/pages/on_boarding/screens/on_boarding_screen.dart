part of '../on_boarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BuildBody(
            controller: _controller,
            onPageChanged: (v) {
              setState(() => _currentIndex = v);
            },
          ),
          const _BuildSkipButton(),
          _BuildFooter(
            currentIndex: _currentIndex,
            pageController: _controller,
          )
        ],
      ),
    );
  }
}
