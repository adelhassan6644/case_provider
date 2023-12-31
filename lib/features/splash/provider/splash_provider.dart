import 'package:flutter/cupertino.dart';
import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:casaProvider/navigation/routes.dart';
import '../repo/splash_repo.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({required this.splashRepo});

  startTheApp() {
    Future.delayed(const Duration(milliseconds: 4500), () {
      if (splashRepo.isFirstTime()) {
        CustomNavigator.push(Routes.ON_BOARDING, clean: true);
      } else if (!splashRepo.isLogin()) {
        CustomNavigator.push(Routes.LOGIN, clean: true);
      } else {
        CustomNavigator.push(Routes.DASHBOARD, clean: true, arguments: 0);
      }
      splashRepo.setFirstTime();
    });
  }
}
