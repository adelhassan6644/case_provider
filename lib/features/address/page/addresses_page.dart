import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/components/animated_widget.dart';
import 'package:casaProvider/components/custom_app_bar.dart';
import 'package:casaProvider/components/custom_button.dart';
import 'package:casaProvider/features/address/provider/addresses_provider.dart';
import 'package:casaProvider/main_models/base_model.dart';
import 'package:casaProvider/navigation/custom_navigation.dart';
import 'package:casaProvider/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/svg_images.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_simple_dialog.dart';
import '../../../components/empty_widget.dart';
import '../../../components/shimmer/custom_shimmer.dart';
import '../widgets/address_card.dart';
import '../widgets/delete_confirmation_dialog.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Consumer<AddressesProvider>(builder: (_, provider, child) {
        return Scaffold(
          backgroundColor: Styles.SCAFFOLD_BG,
          body: Column(
            children: [
              CustomAppBar(
                title: getTranslated("addresses", context),
              ),
              !provider.isLoading
                  ? Expanded(
                      child: RefreshIndicator(
                        color: Styles.PRIMARY_COLOR,
                        onRefresh: () async {
                          provider.getAddresses();
                        },
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            if (provider.model != null &&
                                provider.model!.data!.isNotEmpty)
                              ...List.generate(
                                  provider.model!.data!.length,
                                  (index) => Dismissible(
                                        background: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomButton(
                                              width: 85.w,
                                              height: 30.h,
                                              text: getTranslated(
                                                  "delete", context),
                                              svgIcon: SvgImages.cancel,
                                              iconSize: 12,
                                              iconColor: Styles.IN_ACTIVE,
                                              textColor: Styles.IN_ACTIVE,
                                              backgroundColor: Styles.IN_ACTIVE
                                                  .withOpacity(0.12),
                                            ),
                                          ],
                                        ),
                                        key: ValueKey(index),
                                        confirmDismiss:
                                            (DismissDirection direction) async {
                                          CustomSimpleDialog.parentSimpleDialog(
                                            customListWidget: [
                                              DeleteConfirmationDialog(
                                                  id: provider
                                                      .model!.data![index].id)
                                            ],
                                          );
                                          return false;
                                        },
                                        child: AddressCard(
                                          onTap: () => provider.selectAddress(
                                              provider.model!.data![index]),
                                          addressItem:
                                              provider.model!.data![index],
                                          // isSelect: provider.selectedAddress?.id ==provider.model!.data![index].id ,
                                        ),
                                      )),
                            if (provider.model == null ||
                                provider.model!.data!.isEmpty)
                              EmptyState(
                                  txt: getTranslated(
                                      "there_is_no_addresses", context)),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                        child: ListAnimator(
                          data: [
                            SizedBox(
                              height: 8.h,
                            ),
                            ...List.generate(
                                10,
                                (index) => Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              Dimensions.PADDING_SIZE_SMALL.h),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Styles.LIGHT_BORDER_COLOR,
                                                  width: 1.h))),
                                      child: CustomShimmerContainer(
                                        width: context.width,
                                        height: 80.h,
                                        radius: 15,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                child: CustomButton(
                  text: getTranslated("add_address", context),
                  onTap: () => CustomNavigator.push(Routes.PICK_LOCATION,
                      arguments: BaseModel(
                        valueChanged: provider.onSelectStartLocation,
                      )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
