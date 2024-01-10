import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/app/app_const.dart';
import '/ext/context_ext.dart';
import '/model/request_params.dart';
import '/pages/filter_value_page.dart';
import '/service/common_providers.dart';
import 'filter_item.dart';

class ServiceFilterItem extends HookConsumerWidget {
  const ServiceFilterItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(internalFilterProvider);

    String? getServiceName() => serviceTypes[filter.serviceType];

    void selectService() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.serviceType,
          values: [
            context.l10n.all,
            ...serviceTypes.values,
          ],
          selectedValue: serviceTypes[filter.serviceType]));

      if (selectedName != null) {
        final selectedServiceType = serviceTypes.entries
            .firstWhereOrNull((e) => e.value == selectedName)
            ?.key;

        ref.watch(internalFilterProvider.notifier).update(
            (state) => state.copyWith(serviceType: selectedServiceType));
      }
    }

    return FilterItem(
        text: context.l10n.serviceType,
        value: getServiceName(),
        onPressed: selectService);
  }
}
