import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(MyApp());

List<String> ppInterests = [
  'Art',
  'Sport',
  'Animals',
  'Swimming',
  'Coffee',
  'Art',
  'Sport',
  'Animals',
  'Swimming',
  'Coffee',
  'Art',
  'Sport',
];

class MyApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  int currentStep = 4;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Wayd",
        theme: ThemeData(
          primaryColor: Color.fromRGBO(94, 93, 219, 1),
          accentColor: Color.fromRGBO(94, 93, 219, 1),
        ),
        home: Scaffold(
            body: new Builder(
                builder: (context) => new Container(
                    padding: const EdgeInsets.all(20),
                    child: Flex(direction: Axis.vertical, children: [
                      Container(
                        margin: const EdgeInsets.only(top: 35),
                        child: Center(
                            child: Text(
                          'Choose your interests',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: LinearPercentIndicator(
                            padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                            percent: currentStep.toDouble() / 5,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Theme.of(context).primaryColor,
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: TextFormField(
                            controller: new TextEditingController(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3)),
                            decoration: InputDecoration(
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.05),
                                filled: true,
                                hintText: "Search",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(6.0))),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 22,
                                  color: Theme.of(context).primaryColor,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 15.0)),
                          )),
                      Expanded(
                          child: Flex(
                        direction: Axis.vertical,
                        children: [
                          popularInterests(),
                          yourInterests(),
                        ],
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 24, bottom: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                  child: ButtonTheme(
                                      minWidth: 90,
                                      height: 40,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            if (currentStep == 5)
                                              currentStep = 4;
                                            else
                                              currentStep = 5;
                                          });
                                        },
                                        textColor:
                                            Theme.of(context).primaryColor,
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Theme.of(context).primaryColor,
                                            style: BorderStyle.solid),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text('PREVIOUS'),
                                        padding:
                                            EdgeInsets.only(left: 0, right: 0),
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                  child: MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          if (currentStep == 5)
                                            currentStep = 4;
                                          else
                                            currentStep = currentStep + 1;
                                        });
                                      },
                                      color: Theme.of(context).primaryColor,
                                      textColor: Colors.white,
                                      height: 40,
                                      minWidth: 90,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text('NEXT')))
                            ],
                          ))
                    ])))));
  }
}

Widget popularInterests() => Container(
      margin: EdgeInsets.only(
        top: 24,
      ),
      child: Column(children: [
        Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              'Popular Interests',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(16, 16, 16, 0.6),
                  fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.topLeft,
            height: 180,
            child: SingleChildScrollView(
                child: Wrap(
              children: List<Widget>.generate(ppInterests.length, (int index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Color(0xFF9DC9E9),
                    label: Text(ppInterests[index],
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              }),
            )))
      ]),
    );

Widget yourInterests() => Container(
      padding: EdgeInsets.only(top: 24),
      child: Column(children: [
        Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              'Your Interests',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(16, 16, 16, 0.6),
                  fontWeight: FontWeight.bold),
            )),
        Container(
            child: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      children: List<Widget>.generate(ppInterests.length,
                          (int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Chip(
                            deleteIcon: Icon(Icons.close),
                            deleteIconColor: Colors.red,
                            backgroundColor: Color(0xFF4F9CD3),
                            label: Text(ppInterests[index],
                                style: TextStyle(color: Colors.white)),
                          ),
                        );
                      }),
                    ))))
      ]),
    );
