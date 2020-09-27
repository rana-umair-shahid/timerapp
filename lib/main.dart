import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_task/thank_you.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:swipedetector/swipedetector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwiped = false;

  var duration = 60;
  double percentage = 1.0;
  Timer timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      percentage = 1.0 - t.tick / duration;
      print(t.tick.toString());
      setState(() {});
      if (t.tick == duration) {
        handleTimeout();
        t.cancel();
      }
    });
  }

  void handleTimeout() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ThankYou()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwipeDetector(
          onSwipeUp: () {
            print('swiped up');
            startTimer();
            setState(() {
              isSwiped = true;
            });
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.yellow,
              child: SafeArea(
                top: true,
                bottom: true,
                child: isSwiped
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Session 1',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Countdown',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset(
                            'assets/ic_tooth.png',
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width / 2,
                            lineWidth: 20.0,
                            percent: percentage,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[ Text(
                                  "${timer != null ? duration - timer.tick : 1}",style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(
                                "Seconds",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))]
                            ),
                            progressColor: Colors.blue,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Total Time : 1 minutes',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Session 1',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Swipe up to start Timer',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                            Image.asset(
                              'assets/ic_tooth.png',
                              height: 150,
                              width: 150,
                            ),
                          ]),
              )),
        ),
      ),
    );
  }
}
