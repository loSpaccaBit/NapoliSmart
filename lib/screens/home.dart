import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:napoli_smart/widgets/cardHome.dart';
import 'package:napoli_smart/models/infoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Information> explore = [];
  List<Information> place = [];
  @override
  void initState() {
    legge(); // Chiamare legge() nell'initState
    super.initState();
    print('ok');
  }

  Future<void> legge() async {
    try {
      final List<Information> exploreData =
          await readJsonFile('assets/data/explore.json');
      final List<Information> placeData =
          await readJsonFile('assets/data/place.json');
      setState(() {
        explore = exploreData;
        place = placeData;
      });
    } catch (e) {
      print('Errore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromRGBO(0, 0, 128, 1)),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 325,
                      width: 500,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 140, bottom: 12),
                              child: Text(
                                'Welcome!👋🏻',
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Welcome to Naples, a city that encapsulates centuries of history, culture, and beauty in every corner. From ancient Roman ruins to majestic Baroque palaces, Naples is a treasure trove of stories waiting to be uncovered.',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 150, top: 5),
                              child: Text(
                                'Explore....🏃',
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: explore.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 300,
                            width: 380,
                            child: CardHome(
                              infoCard: explore[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      'Best place of Naples🔥',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 50),
                      child: SizedBox(
                        height: 300,
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: place.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 300,
                                width: 380,
                                child: CardHome(
                                  infoCard: place[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(102, 153, 255, 1),
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: Text(
          '🔍',
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
