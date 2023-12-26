import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/components/base_app_bar.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';

class FilterValuePage extends StatelessWidget {
  const FilterValuePage({
    super.key,
    required this.caption,
    required this.values,
    required this.selectedValue,
  });
  final String caption;
  final List<String> values;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: caption.text2Bold,
        leading: const Icon(Icons.arrow_back).pressable(onPressed: context.pop),
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.p20, vertical: 16),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          final color = value == selectedValue ? null : AppColors.inactiveGrey;

          return value.text1SemiBold
              .textColor(color)
              .padding(vertical: 8)
              .pressable(onPressed: () => context.pop(value));
        },
      ),
    );
  }
}
