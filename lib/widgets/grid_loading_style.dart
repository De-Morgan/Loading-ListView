import 'package:flutter/material.dart';
import 'package:loadinglistview/widgets/listtile_loading_style.dart';

class GridLoadingStyle extends StatelessWidget {
  final bool hasLeading;
  final bool hasSubTitle;
  final bool hasTitle;

  final double titleHeight;
  final double titleWidth;
  final double subtitleHeight;
  final double subtitleWidth;
  final double headerAspectRatio;

  final double titleBorderRadius;
  final double subtitleBorderRadius;

  final double leadingSize;

  final CrossAxisAlignment headerCrossAxisAlignment;
  final MainAxisAlignment headerMainAxisAlignment;
  final MainAxisAlignment loadingMainAxisAlignment;
  final MainAxisAlignment titleMainAxisAlignment;

  final CrossAxisAlignment titleAlignment;
  final CrossAxisAlignment subtitleAlignment;

  final Color loadingColor;
  final BoxShape leadingShape;

  final BoxShape headerShape;
  const GridLoadingStyle(
      {Key key,
      this.hasLeading = true,
      this.hasSubTitle = true,
      this.titleAlignment = CrossAxisAlignment.center,
      this.leadingSize = 60.0,
      this.loadingColor = const Color(0xFFE0E0E0),
      this.leadingShape = BoxShape.circle,
      this.subtitleAlignment = CrossAxisAlignment.start,
      this.titleHeight = 16,
      this.titleWidth = 300,
      this.titleBorderRadius = 10,
      this.subtitleBorderRadius = 10,
      this.subtitleHeight = 14,
      this.subtitleWidth = 100,
      this.hasTitle = true,
      this.loadingMainAxisAlignment = MainAxisAlignment.start,
      this.headerAspectRatio = 2,
      this.headerShape = BoxShape.rectangle,
      this.titleMainAxisAlignment = MainAxisAlignment.center,
      this.headerCrossAxisAlignment = CrossAxisAlignment.center,
      this.headerMainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: headerCrossAxisAlignment,
          mainAxisAlignment: headerMainAxisAlignment,
          children: <Widget>[
            Flexible(
              child: AspectRatio(
                aspectRatio: headerAspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: loadingColor,
                    shape: headerShape,
                  ),
                ),
              ),
            ),
            ListTileLoadingStyle(
              loadingMainAxisAlignment: loadingMainAxisAlignment,
              leadingSize: leadingSize,
              leadingShape: leadingShape,
              loadingColor: loadingColor,
              hasLeading: hasLeading,
              hasTitle: hasTitle,
              hasSubTitle: hasSubTitle,
              titleWidth: titleWidth,
              titleAlignment: titleAlignment,
              titleHeight: titleHeight,
              titleBorderRadius: titleBorderRadius,
              subtitleAlignment: subtitleAlignment,
              subtitleBorderRadius: subtitleBorderRadius,
              subtitleHeight: subtitleHeight,
              subtitleWidth: subtitleWidth,
              titleMainAxisAlignment: titleMainAxisAlignment,
            )
          ],
        ),
      ),
    );
  }
}
