import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_info.dart';
import '/model/works_request.dart';
import '/service/works_provider.dart';
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
    final request = WorksRequest(categoryId: categoryId, userId: userId);
    final dataProvider = worksProvider(request: request);
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
                  .padding(right: 8);
            },
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CupertinoActivityIndicator().center(),
      }
          .height(cardHeight),
    ].toColumnCrossStart();
  }
}
