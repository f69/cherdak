import 'package:cached_network_image/cached_network_image.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_const.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.imageUrl,
    this.baseUrl,
    this.errorWidget = const SizedBox.shrink(),
    this.fit,
    this.alignment,
  });

  factory AppImage.user({
    Key? key,
    String? imageUrl,
    BoxFit? fit,
    Alignment? alignment,
  }) =>
      AppImage(
        key: key,
        imageUrl: imageUrl,
        baseUrl: avatarsBase,
        errorWidget: avatarImageErrorWidget,
        fit: fit,
        alignment: alignment,
      );

  factory AppImage.work({
    Key? key,
    String? imageUrl,
    BoxFit? fit,
    Alignment? alignment,
  }) =>
      AppImage(
        key: key,
        imageUrl: imageUrl,
        baseUrl: worksThumbBase,
        errorWidget: workImageErrorWidget,
        fit: fit,
        alignment: alignment,
      );

  final String? imageUrl;
  final String? baseUrl;
  final Widget errorWidget;
  final BoxFit? fit;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isBlank) {
      return errorWidget.center();
    } else {
      return CachedNetworkImage(
        imageUrl: baseUrl.isBlank ? imageUrl! : '$baseUrl/$imageUrl',
        errorWidget: (context, _, __) => errorWidget,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
      );
    }
  }
}
