import 'package:flutter/material.dart';
import 'package:napoli_smart/widgets/cardInfo.dart';
import 'package:napoli_smart/models/infoModel.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required this.information}) : super(key: key);

  final Information information;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Stack(
              children: [
                CardInfo(
                  information: widget.information,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          '🏠',
          textScaleFactor: 2,
        ),
        backgroundColor: Color.fromRGBO(102, 153, 255, 1),
      ),
    );
  }
}
