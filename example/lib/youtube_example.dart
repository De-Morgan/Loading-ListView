import 'package:flutter/material.dart';
import 'package:loadinglistview/loading_gridview.dart';
import 'package:loadinglistview/loadinglistview.dart';
import 'package:loadinglistview/widgets/grid_loading_style.dart';

class YouTubeVideo {
  final String thumbnailImage;
  final String videoTitle;
  final String ownerImage;
  final String chanelName;
  YouTubeVideo(
      {this.thumbnailImage, this.videoTitle, this.ownerImage, this.chanelName});
}

class YouTubeExample extends StatelessWidget {
  Future<List<YouTubeVideo>> loadYouTubeVideos() async {
    // Simulate slow network call
    await Future.delayed(const Duration(seconds: 3));
    var youTubeVideos = <YouTubeVideo>[];
    for (int i = 1; i < 11; i++) {
      youTubeVideos.add(YouTubeVideo(
          videoTitle: "How to Make Delicious Pizza $i ",
          thumbnailImage: "assets/pizza.jpg",
          ownerImage: "assets/person.png",
          chanelName: "Foodie"));
    }
    return youTubeVideos;
  }

  Widget singleYouTubeVideo(YouTubeVideo youTube) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2,
            child: Container(
              child: Image.asset(
                youTube.thumbnailImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(youTube.ownerImage),
            ),
            title: Text(youTube.videoTitle),
            subtitle: Text(youTube.chanelName),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Example"),
      ),
      body: LoadingListView(
        futureData: loadYouTubeVideos(),
        contentWidget: singleYouTubeVideo,
        loadingWidget: GridLoadingStyle(),
      ),
    );
  }
}
