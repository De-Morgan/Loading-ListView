import 'package:flutter/material.dart';

class ListTileLoadingStyle extends StatelessWidget {
  final bool hasLeading;
  final bool hasSubTitle;
  final bool hasTitle;

  final double titleHeight;
  final double titleWidth;
  final double subtitleHeight;
  final double subtitleWidth;

  final double titleBorderRadius;
  final double subtitleBorderRadius;

  final double leadingSize;
  final MainAxisAlignment loadingMainAxisAlignment;
  final MainAxisAlignment titleMainAxisAlignment;
  final CrossAxisAlignment titleAlignment;
  final CrossAxisAlignment subtitleAlignment;
  final Color loadingColor;
  final BoxShape leadingShape;
  const ListTileLoadingStyle({
    Key key,
    this.hasLeading = true,
    this.hasSubTitle = true,
    this.titleAlignment = CrossAxisAlignment.center,
    this.leadingSize = 50.0,
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
    this.titleMainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          crossAxisAlignment: titleAlignment,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: loadingMainAxisAlignment,
          children: <Widget>[
            if (hasLeading)
              Container(
                width: leadingSize,
                height: leadingSize,
                decoration: BoxDecoration(
                  color: loadingColor,
                  shape: leadingShape,
                ),
              ),
            Flexible(
              child: Column(
                mainAxisAlignment: titleMainAxisAlignment,
                crossAxisAlignment: subtitleAlignment,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (hasTitle)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                      child: Container(
                        height: titleHeight,
                        width: titleWidth,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(titleBorderRadius),
                            color: loadingColor),
                      ),
                    ),
                  if (hasSubTitle)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          width: subtitleWidth,
                          height: subtitleHeight,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(subtitleBorderRadius),
                              color: loadingColor),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
