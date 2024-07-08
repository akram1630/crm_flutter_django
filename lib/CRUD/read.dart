import 'package:flutter/material.dart';

class read extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: Card(
              child: Column(
                children: [
                  Text('name')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
