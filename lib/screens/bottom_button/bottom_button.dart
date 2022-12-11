import 'package:flutter/material.dart';

class BottomButon extends StatelessWidget {
  const BottomButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
          ),
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                Container(
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Button 1'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Button 2'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
