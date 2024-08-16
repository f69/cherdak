import 'package:flutter/cupertino.dart';
import 'package:styled_widget/styled_widget.dart';

class AppActivityIndicator extends StatelessWidget {
  const AppActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator().center();
  }
}
