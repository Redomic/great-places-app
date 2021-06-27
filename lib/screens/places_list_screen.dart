import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPlaceScreen.routeName,
              );
            },
          ),
        ],
      ),
      body: Consumer<Places>(
        builder: (ctx, places, ch) => places.items.length <= 0
            ? ch as Widget
            : ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      places.items[index].image,
                    ),
                  ),
                  title: Text(places.items[index].title),
                  onTap: () {},
                ),
                itemCount: places.items.length,
              ),
        child: Center(
          child: Text('Got no places yet'),
        ),
      ),
    );
  }
}
