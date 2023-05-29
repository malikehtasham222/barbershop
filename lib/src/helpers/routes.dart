import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/pages/about/about_page.dart';
import 'package:barbershop_new/src/pages/add_credit_card/add_credit_card_page.dart';
import 'package:barbershop_new/src/pages/appointment/appointment_page.dart';
import 'package:barbershop_new/src/pages/appointment_detail/appointment_detail_page.dart';
import 'package:barbershop_new/src/pages/barber/barber_page.dart';
import 'package:barbershop_new/src/pages/barbershop/barbershop_page.dart';
import 'package:barbershop_new/src/pages/booking/booking_page.dart';
import 'package:barbershop_new/src/pages/booking_detail/booking_detail_page.dart';
import 'package:barbershop_new/src/pages/booking_payment/booking_payment_page.dart';
import 'package:barbershop_new/src/pages/booking_success/booking_success_page.dart';
import 'package:barbershop_new/src/pages/browse_barber/browse_barber_page.dart';
import 'package:barbershop_new/src/pages/browse_barbershop/browse_barbershop_page.dart';
import 'package:barbershop_new/src/pages/change_password/change_password_page.dart';
import 'package:barbershop_new/src/pages/chat/chat_page.dart';
import 'package:barbershop_new/src/pages/comment/comment_page.dart';
import 'package:barbershop_new/src/pages/create_new_password/create_new_password_page.dart';
import 'package:barbershop_new/src/pages/favorite/favorite_page.dart';
import 'package:barbershop_new/src/pages/filter/filter_page.dart';
import 'package:barbershop_new/src/pages/followers/followers_page.dart';
import 'package:barbershop_new/src/pages/following/following_page.dart';
import 'package:barbershop_new/src/pages/forgot_password/forgot_password_page.dart';
import 'package:barbershop_new/src/pages/forgot_password_success/forgot_password_success_page.dart';
import 'package:barbershop_new/src/pages/gallery/gallery_page.dart';
import 'package:barbershop_new/src/pages/language/language_page.dart';
import 'package:barbershop_new/src/pages/like/like_page.dart';
import 'package:barbershop_new/src/pages/notification/notification_page.dart';
import 'package:barbershop_new/src/pages/on_boarding/on_boarding_page.dart';
import 'package:barbershop_new/src/pages/otp_verification/otp_verification_page.dart';
import 'package:barbershop_new/src/pages/payment_method/payment_method_page.dart';
import 'package:barbershop_new/src/pages/paypal/paypal_page.dart';
import 'package:barbershop_new/src/pages/phone_verification/phone_verification_page.dart';
import 'package:barbershop_new/src/pages/profile_edit/profile_edit_page.dart';
import 'package:barbershop_new/src/pages/schedule/schedule_page.dart';
import 'package:barbershop_new/src/pages/search/search_page.dart';
import 'package:barbershop_new/src/pages/setting/setting_page.dart';
import 'package:barbershop_new/src/pages/sign_in/sign_in_page.dart';
import 'package:barbershop_new/src/pages/sign_up/sign_up_page.dart';
import 'package:barbershop_new/src/pages/social_network_sign_in/social_network_sign_in_page.dart';
import 'package:barbershop_new/src/pages/splash/splash_page.dart';
import 'package:barbershop_new/src/pages/support/support_page.dart';
import 'package:barbershop_new/src/widgets/custom_bottom_navigation_bar.dart';
import 'package:get/get.dart';

List<GetPage> allPages = [
  GetPage<dynamic>(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.socialNetwork,
    page: () => const SocialNetworkSignInScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.forgotPassword,
    page: () => const ForgotPasswordScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.forgotPasswordSuccess,
    page: () => const ForgotPasswordSuccess(),
  ),
  GetPage<dynamic>(
    name: Routes.createNewPassword,
    page: () => const CreateNewPasswordScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.changePassword,
    page: () => const ChangePasswordScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.phoneVerification,
    page: () => const PhoneVerificationScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.otpVerification,
    page: () => const OTPVerificationScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.home,
    page: () => const CustomBottomNavigationBar(),
  ),
  GetPage<dynamic>(
    name: Routes.nearby,
    page: () => const CustomBottomNavigationBar(selectedIndex: 1),
  ),
  GetPage<dynamic>(
    name: Routes.inbox,
    page: () => const CustomBottomNavigationBar(selectedIndex: 2),
  ),
  GetPage<dynamic>(
    name: Routes.appointment,
    page: () => const CustomBottomNavigationBar(selectedIndex: 3),
  ),
  GetPage<dynamic>(
    name: Routes.profile,
    page: () => const CustomBottomNavigationBar(selectedIndex: 4),
  ),
  GetPage<dynamic>(
    name: Routes.filter,
    page: () => const FilterScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.chat,
    page: () => const ChatScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.appointment,
    page: () => const AppointmentScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.appointmentDetail,
    page: () => const AppointmentDetailScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.favorite,
    page: () => const FavoriteScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.paymentMethod,
    page: () => const PaymentMethodScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.addCreditCard,
    page: () => const AddCreditCardScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.paypal,
    page: () => const PaypalScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.support,
    page: () => const SupportScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.language,
    page: () => const LanguageScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.about,
    page: () => const AboutScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.following,
    page: () => const FollowingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.follower,
    page: () => const FollowersScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.like,
    page: () => const LikeScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.setting,
    page: () => const SettingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.notification,
    page: () => const NotificationScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.browseBarbershop,
    page: () => const BrowseBarbershopScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.browseBarber,
    page: () => const BrowseBarberScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.profileEdit,
    page: () => const ProfileEditScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.search,
    page: () => const SearchScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.barbershop,
    page: () => const BarbershopScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.barber,
    page: () => const BarberScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.gallery,
    page: () => const GalleryScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.comment,
    page: () => const CommentScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.bookingService,
    page: () => const BookingServiceScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.schedule,
    page: () => const ScheduleScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.bookingDetail,
    page: () => const BookingDetailScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.bookingPayment,
    page: () => const BookingPaymentScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.bookingSuccess,
    page: () => const BookingSuccessScreen(),
  ),

];
