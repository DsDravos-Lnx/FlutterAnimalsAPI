import 'dart:convert';

import 'package:animals_api/model/animals_model.dart';
import 'package:animals_api/repository/animals_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimalsListState();
  }
}

class AnimalsListState extends State<AnimalsList> {
  List<Animals> animalsList = <Animals>[];

  void getAnimalsFromApi() async {
    AnimalsApi.getAnimals().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        animalsList = list.map((model) => Animals.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getAnimalsFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Animals List'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: animalsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(animalsList[index].name),
              subtitle: Text(animalsList[index].animalType),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(animalsList[index].imageLink),
              ),
            );
          },
        ),
      ),
    );
  }
}
