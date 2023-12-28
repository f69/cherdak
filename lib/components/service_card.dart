import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/service_info.dart';
import '/service/service_providers.dart';

class ServiceCard extends HookConsumerWidget {
  const ServiceCard({super.key, required this.info});
  final ServiceInfo info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(servicesFilterProvider);
    final service =
        info.services.firstWhereOrNull((e) => e.slug == filter.serviceType) ??
            info.services.first;

    void showServicePage() {}

    return [
      CachedNetworkImage(
        imageUrl: '$avatarsBase/${info.image}',
        errorWidget: (context, _, __) => avatarImageErrorWidget,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ).aspectRatio(aspectRatio: 443 / 320),
      [
        service.title.text2Bold,
        info.place.text3.textColor(AppColors.textLightGrey),
        info.name.text2Bold.padding(top: 10),
        if (service.description != null)
          Text(
            service.description!,
            style: AppStyles.text2,
            maxLines: 4,
          ).padding(top: 10),
      ]
          .toColumnCrossStart()
          .padding(top: 12, bottom: 16, horizontal: 8)
          .textStyle(maxLines: 1, overflow: TextOverflow.ellipsis),
    ]
        .toColumnCrossStart()
        .decorated(
            position: DecorationPosition.foreground,
            border: Border.all(color: AppColors.lightGrey))
        .pressable(onPressed: showServicePage);
  }
}
