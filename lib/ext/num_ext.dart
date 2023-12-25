import 'package:flutter/cupertino.dart';

extension GapExt on num {
  Widget get gap => SizedBox(width: toDouble(), height: toDouble());
}
