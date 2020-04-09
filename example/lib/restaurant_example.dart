import 'package:flutter/material.dart';
import 'package:loadinglistview/loadinglistview.dart';
import 'package:loadinglistview/widgets/listtile_loading_style.dart';

class Food {
  final String name;
  final String assetImage;
  Food(this.name, this.assetImage);
}

class RestaurantExample extends StatelessWidget {
  Future<List<Food>> loadFood() async {
    // Simulate slow network call
    await Future.delayed(const Duration(seconds: 3));
    var foods = <Food>[];
    for (int i = 1; i < 11; i++) {
      foods.add(Food(" Delicious Pizza $i ", "assets/pizza.jpg"));
    }
    return foods;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Restuarant App"),
        ),
        body: LoadingListView(
          contentWidget: singleFoodWidget,
          futureData: loadFood(),
          loadingWidget: loadingWidget(),
        ));
  }

  Widget singleFoodWidget(Food food) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
            height: 60, width: 70, child: Image.asset(food.assetImage)),
        title: Text(food.name),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTileLoadingStyle(
        leadingShape: BoxShape.rectangle,
        leadingSize: 70,
        titleWidth: 150,
        subtitleWidth: 120,
        titleBorderRadius: 0,
        subtitleBorderRadius: 0,
      ),
    );
  }
}
