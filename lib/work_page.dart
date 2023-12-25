import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_colors.dart';
import '/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/service/work_provider.dart';
import '/user_works_ribbon.dart';
import '/work_stats_row.dart';
import 'app_button.dart';
import 'app_const.dart';
import 'base_app_bar.dart';
import 'model/works_item.dart';
import 'simple_grid.dart';

class WorkPage extends HookConsumerWidget {
  const WorkPage({super.key, required this.info});
  final WorksItem info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workInfo = ref.watch(workProvider(info.work.slug)).valueOrNull;
    final imageUrl = '$worksThumbBase/${info.work.mainImage}';

    Widget paramItem(String caption, String? value) {
      return [
        '$caption:'.text2.textColor(AppColors.inactiveGrey),
        (value ?? '—').text2SemiBold,
      ].toColumnCrossStart();
    }

    void showWork() {
      showImageViewer(
        context,
        CachedNetworkImageProvider(imageUrl),
        doubleTapZoomable: true,
        swipeDismissible: true,
      );
    }

    return Scaffold(
      appBar: BaseAppBar(
        leading: const Icon(Icons.arrow_back).pressable(onPressed: context.pop),
      ),
      body: [
        [
          info.user.name.text2Bold.padding(bottom: 8),
          info.work.title.text2Bold.padding(bottom: 16),
          WorkStatsRow(info: info.work)
              .border(all: 1, color: AppColors.lightGrey),
          const Divider().padding(top: 20, bottom: 16),
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
          ).aspectRatio(aspectRatio: 1).gestures(onTap: showWork),
          [
            AppButton(onPressed: () {}, child: Text(context.l10n.askPrice))
                .expanded(),
            const SizedBox(width: 16),
            AppButton(
                    onPressed: () {},
                    filled: true,
                    child: Text(context.l10n.writeAuthor))
                .expanded(),
          ].toRow().padding(top: 12),
          const Divider().padding(top: 40, bottom: 36),
          context.l10n.workParams.h3.padding(bottom: 20),
          SimpleGrid(
            columns: 2,
            verticalSpacing: 16,
            horizontalSpacing: 16,
            children: [
              paramItem(context.l10n.status, null),
              paramItem(context.l10n.date, workInfo?.creationDate),
              paramItem(context.l10n.category, info.category.title),
              paramItem(context.l10n.genre, info.genre.title),
              paramItem(context.l10n.technique, workInfo?.technique),
              paramItem(context.l10n.place, info.user.place),
            ],
          ),
          const Divider().padding(top: 40, bottom: 36),
          context.l10n.workDescription.h3.padding(bottom: 20),
          if (workInfo != null) workInfo.description.text2SemiBold,
          const Divider().padding(top: 40, bottom: 36),
          UserNameHeader(name: info.user.name).padding(bottom: 16),
          if (info.user.shortDescription != null)
            info.user.shortDescription!.text1SemiBold,
          const Divider().padding(top: 40, bottom: 36),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20, top: 40),
        if (workInfo != null)
          UserWorksRibbon(
            userId: workInfo.user.id,
            excludeWorkSlug: info.work.slug,
          ),
      ].toColumn().padding(bottom: 40).scrollable(),
    );
  }
}

class UserNameHeader extends StatelessWidget {
  const UserNameHeader({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final parts = name.split(' ');
    final first = parts.first;
    parts.removeAt(0);
    final other = parts.join(' ');
    return [
      first.h1.padding(right: 20),
      if (other.isNotEmpty) other.h1Outlined,
    ].toColumnCrossStart();
  }
}
