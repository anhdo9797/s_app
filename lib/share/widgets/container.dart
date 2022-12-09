import 'package:flutter/material.dart';
import 'package:s_app/share/constants/constants.dart';
import 'package:s_app/share/widgets/widgets.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;
  final double padding;

  const ContainerWidget(
      {Key? key, required this.child, this.padding = AppDimension.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
