import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            title: Text('CAP SAU PAJURA ?',
                style: TextStyle(fontSize: 20, color: Colors.yellow[300], fontFamily: 'Dosis', )),
            centerTitle: true,
            backgroundColor: Colors.amber[600],
          ),
          body: CoinPage(),
        ),
      ),
    );
  });
}

class CoinPage extends StatefulWidget {
  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  int vlaCoin = 1;
  String name = '';
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100.0,
        ),
        Image(
            width: 250.0,
            height: 250.0,
            image: AssetImage('images/img$vlaCoin.png')),
        Container(
          child: Text('$name',
              style: TextStyle(color: Colors.yellow, fontSize: 44.0, fontFamily: 'Bangers')),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.yellowAccent,
              onPressed: () {
                setState(() {
                  Random random = new Random();
                  vlaCoin = random.nextInt(2) + 2;
                  if (vlaCoin == 3) {
                    name = 'Cap';
                  } else {
                    name = 'Pajura';
                  }
                });
              },
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 15.0),
              child: const Text(
                'Cap sau pajura?',
                style: TextStyle(fontSize: 26, color: Colors.black, fontFamily: 'Bangers'),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
              color: Colors.yellowAccent,
              onPressed: () {
                setState(() {
                  vlaCoin = 1;
                  name = '';
                });
              },
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.refresh,
                    color: Colors.black,
                    size: 30.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
