import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/features/home/provider/home_provider.dart';
import 'package:casaProvider/features/home/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/images.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/empty_widget.dart';
import '../../../components/shimmer/custom_shimmer.dart';
import '../../../data/config/di.dart';
import '../widgets/home_header.dart';

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
      sl<HomeProvider>().scroll(controller);
      sl<HomeProvider>().getNextSessions();
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
            child: Consumer<HomeProvider>(builder: (_, provider, child) {
              return provider.isLoading
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                      child: ListAnimator(
                        controller: controller,
                        data: List.generate(
                          10,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                                bottom: Dimensions.PADDING_SIZE_SMALL.h),
                            child: CustomShimmerContainer(
                              height: 100,
                              width: context.width,
                              radius: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  : provider.reservations.isNotEmpty
                      ? RefreshIndicator(
                          color: Styles.PRIMARY_COLOR,
                          onRefresh: () async {
                            sl<HomeProvider>().getNextSessions();
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_DEFAULT.w),
                                  child: ListAnimator(
                                    controller: controller,
                                    data: List.generate(
                                      provider.reservations.length,
                                      (index) => HomeSessionsCard(
                                        product: provider.reservations[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          color: Styles.PRIMARY_COLOR,
                          onRefresh: () async {
                            sl<HomeProvider>().getNextSessions();
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_DEFAULT.w),
                                  child: ListAnimator(
                                    data: [
                                      EmptyState(
                                        img: Images.emptyReservations,
                                        imgHeight: 215.h,
                                        imgWidth: 215.w,
                                        txt: getTranslated(
                                            "empty_next_reservations_title",
                                            context),
                                        subText: getTranslated(
                                            "empty_next_reservations_description",
                                            context),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
            }),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
