import 'package:flutter/material.dart';
import 'package:s_app/modules/base/base.dart';
import 'package:s_app/modules/main/tabs/home/home.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (_) => HomeViewModel(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, HomeViewModel vm) {
    return const Scaffold(
      body: Center(child: Text("home tab")),
    );
  }
}
