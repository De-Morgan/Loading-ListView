import 'package:flutter/material.dart';

import 'profile_example.dart';
import 'restaurant_example.dart';
import 'youtube_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ColleagueExample(),
      home: RestaurantExample(),
      // home: YouTubeExample(),
      //home: FriendRequestExample(),
    );
  }
}
