import 'package:flutter/material.dart';
import 'package:napoli_smart/models/infoModel.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.information});

// required this.title,
//       required this.subTitle,
//       required this.subText,
//       required this.assets

  final Information information;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: SizedBox(
                  height: 100,
                  child: Text(
                    information.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(information.subTitle,
                    style: Theme.of(context).textTheme.headline2),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: information.assets.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.hardEdge,
                      elevation: 0,
                      color: Colors.blue,
                      child: Image(
                        image: NetworkImage(information.assets[index]),
                        fit: BoxFit.cover,
                        width: 300,
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  information.subText,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
