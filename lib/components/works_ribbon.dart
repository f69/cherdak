import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/app_error_widget.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/request_params.dart';
import '/model/works_info.dart';
import '/service/work_providers.dart';
import 'work_card.dart';

class WorksRibbon extends HookConsumerWidget {
  const WorksRibbon({
    super.key,
    this.categoryId,
    this.userId,
    this.headerBuilder,
  });

  final int? categoryId;
  final int? userId;
  final ValueWidgetBuilder<WorksInfo?>? headerBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final request = RequestParams(categoryId: categoryId, userId: userId);
    final dataProvider = worksProvider(request);
    final worksInfoAsync = ref.watch(dataProvider);

    final cardWidth = context.screenSize.width - 20 * 2;
    final cardHeight = cardWidth + 147;

    return [
      if (headerBuilder != null)
        headerBuilder!.call(context, worksInfoAsync.valueOrNull, null),
      switch (worksInfoAsync) {
        AsyncData(:final value) => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
            scrollDirection: Axis.horizontal,
            itemCount: value.data.length + (value.allPagesFetched ? 0 : 1),
            itemBuilder: (context, index) {
              if (index == value.data.length) {
                Future(() => ref.read(dataProvider.notifier).getNextPage());
                return const CupertinoActivityIndicator()
                    .center()
                    .width(cardWidth / 2);
              }

              return WorkCard(info: value.data[index])
                  .width(cardWidth)
                  .padding(right: index == value.data.length - 1 ? 0 : 8);
            },
          ),
        AsyncError(:final error) => AppErrorWidget(error: error),
        _ => const CupertinoActivityIndicator().center(),
      }
          .height(cardHeight),
    ].toColumnCrossStart();
  }
}
