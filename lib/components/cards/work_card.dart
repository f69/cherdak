import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../misc/app_image.dart';
import '../misc/work_stats_row.dart';
import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_item.dart';
import '/pages/work_page.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key, required this.info});
  final WorksItem info;

  @override
  Widget build(BuildContext context) {
    final work = info.work;
    final user = info.user;

    void showWorkPage() {
      context.pushMaterial((_) => WorkPage(info: info));
    }

    return [
      AppImage.work(imageUrl: work.mainImage).aspectRatio(aspectRatio: 1),
      [
        work.title.text2Bold,
        '${info.category.getTitle(context)}, ${info.genre.getTitle(context)}'
            .text3
            .textColor(AppColors.textLightGrey),
        10.gap,
        user.name.text2Bold,
        (user.getPlace(context) ?? '').text3.textColor(AppColors.textLightGrey),
      ]
          .toColumnCrossStart()
          .padding(top: 12, bottom: 16, horizontal: 8)
          .textStyle(maxLines: 1, overflow: TextOverflow.ellipsis),
      Container().flexible(),
      const Divider(),
      WorkStatsRow(info: work),
    ]
        .toColumnCrossStart()
        .decorated(
            position: DecorationPosition.foreground,
            border: Border.all(color: AppColors.lightGrey))
        .pressable(onPressed: showWorkPage);
  }
}
