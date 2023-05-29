part of '../social_network_sign_in_page.dart';

class SocialNetworkSignInScreen extends StatelessWidget {
  const SocialNetworkSignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: const [
           _BuildBackgroundImage(),
           _BuildGradient(),
           _BuildBody(),
           _BuildFooter()
        ],
      ),
    );
  }
}
