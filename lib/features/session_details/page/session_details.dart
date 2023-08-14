import 'package:casaProvider/app/localization/localization/language_constant.dart';
import 'package:casaProvider/components/shimmer/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/styles.dart';
import '../../../app/core/utils/svg_images.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_simple_dialog.dart';
import '../../../components/empty_widget.dart';
import '../../../data/config/di.dart';
import '../provider/session_details_provider.dart';
import '../widgets/end_session_dialog.dart';
import '../widgets/reservation_details_widget.dart';

class SessionDetails extends StatefulWidget {
  final int id;

  const SessionDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<SessionDetails> createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  @override
  void initState() {
    Future.delayed(Duration.zero,
        () => sl<SessionDetailsProvider>().getSessionDetails(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Consumer<SessionDetailsProvider>(
            builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: provider.model?.subService),

              ///Session Details
              provider.isLoading
                  ? const _SessionDetailsWidgetShimmer()
                  : provider.model != null
                      ? SessionDetailsWidget(model: provider.model!)
                      : const EmptyState(),

              ///End Session
              Visibility(
                visible: !provider.isLoading && provider.model != null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_SMALL.h,
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                  child: CustomButton(
                    text: getTranslated("end_session", context),
                    svgIcon: SvgImages.arrowLeft,
                    iconColor: Styles.WHITE_COLOR,
                    onTap: () {
                      CustomSimpleDialog.parentSimpleDialog(
                        customListWidget: [
                          EndSessionDialog(
                            id: provider.model?.id,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _SessionDetailsWidgetShimmer extends StatelessWidget {
  const _SessionDetailsWidgetShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        child: Column(
          children: [
            CustomShimmerContainer(
              height: 250.h,
              width: context.width,
              radius: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_SMALL.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomShimmerContainer(
                          width: 150,
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: const CustomShimmerContainer(
                            width: 150,
                            height: 30,
                          ),
                        ),
                        ...List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: CustomShimmerContainer(
                              width: context.width,
                              height: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 184.h,
                    child: Center(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (c, index) => Padding(
                          padding: EdgeInsets.only(
                              right: index == 0 ? 24.w : 0, left: 12.w),
                          child: CustomShimmerContainer(
                            width: 100.w,
                            height: 150.h,
                            radius: 8,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
