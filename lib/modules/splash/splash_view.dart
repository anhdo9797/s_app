import 'package:flutter/material.dart';
import 'package:s_app/data/local/pref.dart';
import 'package:s_app/routes/routes.dart';

import 'package:s_app/share/utils/size_config.dart';
import 'package:s_app/share/widgets/app_logo.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig();
    size.init(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLogo(
              key: const ValueKey("appLogo"),
              size: size.screenWidth * 0.5,
            ),
          ],
        ),
      ),
    );
  }

  appInit() async {
    // await DBProvider.db.database;
    await Future.delayed(const Duration(seconds: 1));
    if (AppPref.firstInstall) {
      AppRouter.routes.goNamed(APP_PAGE.onboard.toName);
      AppPref.firstInstall = false;
    } else {
      AppRouter.routes.goNamed(APP_PAGE.main.toName);
    }

    FlutterNativeSplash.remove(); // remove native splash
  }

  @override
  void dispose() {
    super.dispose();
  }
}
