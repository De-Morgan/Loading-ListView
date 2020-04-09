import 'package:flutter/material.dart';
import 'package:loadinglistview/loading_gridview.dart';
import 'package:loadinglistview/loadinglistview.dart';
import 'package:loadinglistview/widgets/value.dart';

class Person {
  final String name;
  final String occupation;
  final String imageAsset;
  Person(this.name, this.occupation, {this.imageAsset = "assets/person.png"});
}

final personToOccupation = <String, String>{
  "Bob Smith": "Doctor",
  "Mary Smith": "Accountant",
  "John Smith": "Lawyer",
  "Smith": "Bank Manager",
  "Michael Smith": "Police Officer",
  "Mary": "Fashion Designer",
  "Michael": "Mechanical Engineer",
  "John": "Electrical Engineer",
  "Bob": "Financial consultant"
};

class FriendRequestExample extends StatelessWidget {
  Future<List<Person>> loadPersons() async {
    // Simulate slow network call
    await Future.delayed(const Duration(seconds: 3));
    var persons = <Person>[];
    personToOccupation.forEach((key, value) => persons.add(Person(key, value)));
    return persons;
  }

  Widget singlePersonWidget(Person person) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(person.imageAsset),
        ),
        title: Text("${person.name} sent you a friend request"),
        subtitle: Text(person.occupation),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend Request Example"),
      ),
      body: LoadingListView(
        futureData: loadPersons(),
        contentWidget: singlePersonWidget,
        loadingWidget: ListTileLoadingStyle(
          leadingSize: 40,
        ),
      ),
    );
  }
}

class ColleagueExample extends StatelessWidget {
  Future<List<Person>> loadPersons() async {
    // Simulate slow network call
    await Future.delayed(const Duration(seconds: 3));
    var persons = <Person>[];
    personToOccupation.forEach((key, value) => persons.add(Person(key, value)));
    return persons;
  }

  Widget singlePersonWidget(Person person) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(person.imageAsset),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            person.name,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            person.occupation,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colleague Example"),
      ),
      body: LoadingGridView(
        futureData: loadPersons(),
        contentWidget: singlePersonWidget,
        loadingWidget: GridLoadingStyle(
          headerShape: BoxShape.circle,
          hasLeading: false,
          subtitleAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
