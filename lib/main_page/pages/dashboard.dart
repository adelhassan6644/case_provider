import 'package:casaProvider/features/home/provider/home_provider.dart';
import 'package:casaProvider/features/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/features/profile/page/profile.dart';
import 'package:casaProvider/main_page/provider/main_page_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/styles.dart';
import '../../data/config/di.dart';
import '../../data/network/network_info.dart';
import '../../features/home/page/home.dart';
import '../../features/more/page/more.dart';
import '../../features/reservations/page/reservations.dart';
import '../widget/nav_bar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    NetworkInfo.checkConnectivity();
    sl<HomeProvider>().getCategories();
    sl<ProfileProvider>().getProfile();
    super.initState();
  }

  Widget fragment(int index) {
    switch (index) {
      case 0:
        return const Reservations();
      case 1:
        return const Profile();
      case 2:
        return const More();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(builder: (_, provider, child) {
      return Scaffold(
        backgroundColor: Styles.SCAFFOLD_BG,
        bottomNavigationBar: const NavBar(),
        body: fragment(provider.selectedIndex),
      );
    });
  }
}
