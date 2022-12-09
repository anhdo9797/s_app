import 'package:flutter/material.dart';
import 'package:s_app/modules/base/base.dart';

import 'analysis_view_model.dart';

class AnalysisTab extends StatefulWidget {
  const AnalysisTab({super.key});

  @override
  State<AnalysisTab> createState() => _AnalysisTabState();
}

class _AnalysisTabState extends State<AnalysisTab> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AnalysisViewModel>(
      vmBuilder: (_) => AnalysisViewModel(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AnalysisViewModel vm) {
    return const Scaffold(
      body: Center(child: Text("Analysis tab")),
    );
  }
}
