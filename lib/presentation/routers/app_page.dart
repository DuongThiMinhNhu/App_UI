import 'package:app_ui/presentation/routers/app_routes.dart';
import 'package:app_ui/presentation/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
final pages = [
  GetPage(
      name: AppRoutes.Onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBindings()),
];