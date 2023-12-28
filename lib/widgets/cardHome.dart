import 'package:flutter/material.dart';
import 'package:napoli_smart/models/infoModel.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key, required this.infoCard});
  final Information infoCard;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 1),
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/info', arguments: infoCard);
        },
        child: Column(
          children: [
            ListTile(
              title: Text(
                infoCard.title,
                style: Theme.of(context).textTheme.headline2,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoCard.subTitle,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Image.network(
              infoCard.assets[0],
              fit: BoxFit.cover,
              height: 213,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
