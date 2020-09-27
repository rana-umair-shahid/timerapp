import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThankYou extends StatelessWidget {

  ThankYou();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text('Session 1',style: TextStyle(
              fontSize: 18, color: Colors.black,fontWeight: FontWeight.w600),),
                SizedBox(
                  height: 60,
                ),
                Text('Countdown', style: TextStyle(fontSize: 25,color: Colors.black54,fontWeight: FontWeight.w700),),
                SizedBox(
                  height: MediaQuery.of(context).size.height/4,
                ),
                Image.asset('assets/ic_tooth.png',height: 150,width: 150,),
                SizedBox(height: 20,),
                Text('Thank You',style: TextStyle(fontSize: 32,color: Colors.green),),
              ]),
        ),
      ),);
  }

}