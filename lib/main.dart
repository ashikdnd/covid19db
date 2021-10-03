import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';
import 'package:covid19/header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19 Dashboard',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MyHeader(
          textTop: 'All you need',
          textBottom: 'is stay at home',
          offset: offset,
          image: 'assets/icons/Drcorona.svg',
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/map.svg"),
              Container(
                child: Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    items: <String>[
                      'Andhra Pradesh',
                      'Telengana',
                      'Karnataka',
                      'Tamil Nadu'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Case Update\n',
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black)),
                        TextSpan(
                            text: 'Newest update 28 March',
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black))
                      ]),
                    ),
                    Spacer(),
                    Text('See Details',
                        style: TextStyle(fontSize: 12.0, color: Colors.blue))
                  ]),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Counter(
                      color: Colors.orange, number: 1046, title: 'Infected'),
                  Counter(color: Colors.red, number: 87, title: 'Deaths'),
                  Counter(color: Colors.green, number: 46, title: 'Recovered')
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spread of Virus",
                    style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                  ),
                  Text(
                    "See details",
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.zero,
                height: 180.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 15.0,
                          color: Colors.grey)
                    ]),
                child: Image.asset('assets/images/map.png'),
              )
            ],
          ),
        )
      ]),
    );
  }
}
