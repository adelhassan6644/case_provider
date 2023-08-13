import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/features/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import '../../../data/config/di.dart';
import '../../maps/provider/map_provider.dart';
import '../../reservations/provider/reservations_provider.dart';
import '../widgets/home_dates.dart';
import '../widgets/home_header.dart';
import '../widgets/home_banners.dart';
import '../widgets/home_products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      sl<MapProvider>().getCurrentLocation();
      sl<HomeProvider>().scroll(controller);
      sl<HomeProvider>().getProducts();
      // sl<HomeProvider>().getBanners();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        children: [
          const HomeHeader(),
          Expanded(
            child: RefreshIndicator(
              color: Styles.PRIMARY_COLOR,
              onRefresh: () async {
                sl<HomeProvider>().getProducts();
                sl<ReservationsProvider>().getNextReservations();
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: const [
                        HomeBanner(),
                        HomeDates(),
                        HomeProducts()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
