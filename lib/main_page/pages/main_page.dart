import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:casaProvider/app/core/utils/styles.dart';
import 'package:casaProvider/app/core/utils/dimensions.dart';
import 'package:casaProvider/app/core/utils/extensions.dart';
import 'package:casaProvider/main_page/pages/dashboard.dart';
import 'package:casaProvider/main_page/provider/main_page_provider.dart';
import 'package:provider/provider.dart';
import '../../features/more/page/more.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: Styles.WHITE_COLOR,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                height: context.height,
                width: context.width,
                child: ZoomDrawer(
                  disableDragGesture: true,
                  isRtl: true,
                  showShadow: true,
                  angle: 0.0,
                  shadowLayer1Color: Colors.black.withOpacity(0.1),
                  shadowLayer2Color: Colors.transparent,
                  borderRadius: 24,
                  slideWidth: context.width * (0.75),
                  menuBackgroundColor: Styles.WHITE_COLOR,
                  controller: _drawerController,
                  menuScreen: More(),
                  mainScreen: const DashBoard(),
                ),
              ),
              Consumer<MainPageProvider>(builder: (_, provider, child) {
                return Visibility(
                  visible: provider.isOpen == true,
                  child: IconButton(
                    onPressed: () {
                      provider.updateIsOpen(false);
                      _drawerController.toggle!();
                    },
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(
                        Dimensions.PADDING_SIZE_DEFAULT,
                        (Dimensions.PADDING_SIZE_DEFAULT + context.toPadding),
                        Dimensions.PADDING_SIZE_DEFAULT,
                        Dimensions.PADDING_SIZE_DEFAULT),
                    icon: const Icon(
                      Icons.close,
                      color: Styles.SPLASH_BACKGROUND_COLOR,
                      size: 24,
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
