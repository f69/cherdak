import 'package:flutter/material.dart';

extension GapExt on num {
  Widget get gap => SizedBox(width: toDouble(), height: toDouble());
}
