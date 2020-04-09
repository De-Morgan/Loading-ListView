library loadinglistview;

import 'package:flutter/material.dart';

import 'typedef/content_widget.dart';

class LoadingListView<T> extends StatelessWidget {
  final Future<List<T>> futureData;
  final ContentWidget<T> contentWidget;
  final Widget loadingWidget;
  final int loadingWidgetCount;
  final Axis scrollDirection;
  final bool reverse;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final ScrollController controller;

  const LoadingListView({
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
          return ListView.builder(
            itemCount: loadingWidgetCount,
            itemBuilder: (BuildContext context, int index) => loadingWidget,
          );
        }
        final items = snapshot.data;
        return ListView.builder(
          padding: padding,
          shrinkWrap: shrinkWrap,
          reverse: reverse,
          scrollDirection: scrollDirection,
          itemCount: items.length,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            final T data = items[index];
            return contentWidget(data);
          },
        );
      },
    );
  }
}
