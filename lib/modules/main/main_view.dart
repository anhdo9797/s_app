import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_app/modules/base/base.dart';
import 'package:s_app/modules/main/main_provider.dart';
import 'package:s_app/modules/main/tabs/analysis/analysis_view.dart';
import 'package:s_app/modules/main/tabs/home/home_view.dart';
import 'package:s_app/share/extension/extension.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int tabIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<MainProvider>(
      vmBuilder: (_) => MainProvider(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, MainProvider vm) {
    List<Widget> tabs = [
      const HomeTab(),
      const AnalysisTab(),
    ];

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: tabs,
      ),
      floatingActionButton: const FloatActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: context.colors.surface,
        icons: const [
          UniconsLine.estate,
          UniconsLine.chart,
        ],
        activeIndex: tabIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() {
          setState(() {
            tabIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
          });
        }),
        //other params
      ),
    );
  }
}

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({super.key});

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      log(barcodeScanRes, name: "QR SCAN");
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: scanQR,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: context.colors.primaryContainer.withOpacity(0.6),
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              UniconsLine.exchange,
              size: 32,
            )),
      ),
    );
  }
}
