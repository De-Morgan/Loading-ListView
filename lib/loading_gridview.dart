import 'package:flutter/material.dart';

import 'typedef/content_widget.dart';

class LoadingGridView<T> extends StatelessWidget {
  final Future<List<T>> futureData;
  final ContentWidget<T> contentWidget;
  final Widget loadingWidget;
  final int loadingWidgetCount;
  final Axis scrollDirection;
  final bool reverse;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final SliverGridDelegate gridDelegate;
  final ScrollController controller;

  const LoadingGridView({
    Key key,
    @required this.futureData,
    @required this.contentWidget,
    this.loadingWidget,
    this.loadingWidgetCount = 12,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.shrinkWrap = false,
    this.padding,
    this.controller,
    this.gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  })  : assert(futureData != null),
        assert(contentWidget != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        if (!snapshot.hasData) {
          if (loadingWidget == null) {
            return Container(
              child: CircularProgressIndicator(),
              alignment: FractionalOffset.center,
            );
          }
          return GridView.builder(
            itemCount: loadingWidgetCount,
            itemBuilder: (BuildContext context, int index) => loadingWidget,
            gridDelegate: gridDelegate,
          );
        }
        final items = snapshot.data;
        return GridView.builder(
          controller: controller,
          padding: padding,
          shrinkWrap: shrinkWrap,
          reverse: reverse,
          scrollDirection: scrollDirection,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final T data = items[index];
            return contentWidget(data);
          },
          gridDelegate: gridDelegate,
        );
      },
    );
  }
}
