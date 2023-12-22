import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_const.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_item.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key, required this.info});
  final WorksItem info;

  Widget _statItem(IconData icon, int value) {
    return [Icon(icon).padding(right: 4), '$value'.text2Bold]
        .toRowMin()
        .center()
        .expanded();
  }

  @override
  Widget build(BuildContext context) {
    final work = info.work;
    final user = info.user;
    return [
      CachedNetworkImage(
        imageUrl: '$worksThumbBase/${work.mainImage}',
        fit: BoxFit.cover,
      ).aspectRatio(aspectRatio: 1),
      [
        work.title.text2Bold,
        '${info.category.title}, ${info.genre.title}'
            .text3
            .textColor(AppColors.textLightGrey),
        const SizedBox(height: 10),
        user.name.text2Bold,
        (user.place ?? '').text3.textColor(AppColors.textLightGrey),
      ]
          .toColumnCrossStart()
          .padding(top: 12, bottom: 16, horizontal: 8)
          .textStyle(maxLines: 1, overflow: TextOverflow.ellipsis),
      Container().flexible(),
      const Divider(),
      [
        _statItem(CupertinoIcons.heart_fill, work.likesCount),
        _statItem(CupertinoIcons.eye_solid, work.likesCount),
        _statItem(CupertinoIcons.bubble_left_fill, work.likesCount),
      ].toRow(separator: const VerticalDivider()).height(44),
    ].toColumnCrossStart().decorated(
        position: DecorationPosition.foreground,
        border: Border.all(color: AppColors.lightGrey));
  }
}
