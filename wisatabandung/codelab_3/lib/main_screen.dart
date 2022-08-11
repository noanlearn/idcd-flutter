import 'package:codelab_3/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:codelab_3/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const TourismPlaceList();
          } else if (constraints.maxWidth <= 1200) {
            return const TourismPlaceGrid(gridCount: 4);
          } else {
            return const TourismPlaceGrid(gridCount: 6);
          }
        }
      )
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tourismPlaceList.length,
      itemBuilder: (context, index) {
        TourismPlace place = tourismPlaceList[index];
        return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(place: place);
          }));
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1, 
                child: Hero(
                  tag: place.name,
                  child: Image.asset(place.imageAsset)
                )
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Text(
                        place.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(place.location)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
      },
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  const TourismPlaceGrid({Key? key, required this.gridCount}) : super(key: key);
  
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        children: tourismPlaceList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              })
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.imageAsset,
                      fit: BoxFit.cover,
                      )
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      place.location,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      )
    );
  }
}