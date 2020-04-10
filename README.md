# loadinglistview

This package provide an easy way to show loading indicator(Widget) in a listview or a gridview while the app is still fetching the real data. Once the real data is fetched, the loading indicators are replaced with the actual data.

![](https://raw.githubusercontent.com/De-Morgan/Loading-ListView/master/showcase/example.gif)



## How it works

1. ```Provide a Future<List<T>>```
2. ```Provide a function that takes T and returns a widget``` 
3. ```Provide a loading widget``` 


_As regards the loading widget, there are two predefined highly customizable widgets that should work for most use cases. In case non of this two works for your use case, feel free to supply your custom widget_

1. ListTileLoadingStyle
2. GridLoadingStyle

 check the [example folder](https://github.com/De-Morgan/Loading-ListView/tree/master/example/lib) to see how all these are connected together.
 
 ### Basic Usage

Given that loadPersons() return ```Future<List<Person>> ``` and singlePersonWidget is of type 
```Widget ContentWidget<T>(T data)```

```dart
 LoadingListView(
        futureData: loadPersons(),
        contentWidget: singlePersonWidget,
        loadingWidget: ListTileLoadingStyle(),
      )
```
    
```dart
  LoadingGridView(
        futureData: loadPersons(),
        contentWidget: singlePersonWidget,
        loadingWidget: GridLoadingStyle(),
      )
```

 #### More customized loading widget
```dart
  ListTileLoadingStyle(
        leadingShape: BoxShape.rectangle,
        leadingSize: 70,
        titleWidth: 150,
        subtitleWidth: 120,
        titleBorderRadius: 0,
        subtitleBorderRadius: 0,
      )
```

      
 #### With shimmering effect
 If you want a shimmering effect on the loading widget consider wrapping [SkeletonAnimation](https://pub.dev/packages/skeleton_text#-readme-tab-) around it.
   
 ## License
 This package is licensed under the MIT license. See [LICENSE](https://github.com/De-Morgan/Loading-ListView/blob/master/LICENSE) for details.


      
      
  
      
