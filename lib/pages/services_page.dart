import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/components/cards/service_card.dart';
import '/components/filter/filter_panel.dart';
import '/components/misc/data_list.dart';
import '/ext/context_ext.dart';
import '/model/service_info.dart';
import '/service/service_providers.dart';
import 'filter_page.dart';

class ServicesPage extends HookConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(servicesFilterProvider);

    return [
      DataList(
        dataProvider: servicesProvider(filter),
        filterProvider: servicesFilterProvider,
        titleText: 'art services',
        descriptionText: context.l10n.servicePageIntro,
        countTextFunction: context.l10n.servicesCount,
        cardBuilder: (ServiceInfo data) => ServiceCard(info: data),
      ),
      FilterPanel(
        filter: filter,
        onFilter: (value) =>
            ref.read(servicesFilterProvider.notifier).state = value,
        options: const {FilterOption.country, FilterOption.serviceType},
      ).alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
