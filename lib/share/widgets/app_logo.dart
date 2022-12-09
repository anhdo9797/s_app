import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_app/share/constants/assets.dart';

import 'package:s_app/share/widgets/widgets.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({Key? key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      Assets.logo,
      width: size,
      height: size,
      fit: BoxFit.fill,
    );
  }
}
