import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget{

  double wid;
  double hei;
  String title;
  String text;
  var time = DateTime.now();

  MyCard({required this.hei,required this.wid, required this.text , required this.title});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: hei,
        width: wid,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade900
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: SizedBox(
                    height: 25,
                    width: 120,
                    child: Text(title, style: TextStyle(fontSize:22,color: Colors.white, fontWeight: FontWeight.w700),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: SizedBox(
                    height: 45,
                    width: 130,
                    child: Text(text,
                      style: TextStyle(fontSize: 12, color:  Colors.white, fontWeight: FontWeight.w500, overflow: TextOverflow.fade),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 8),
                child: SizedBox(
                  height: 20,
                  child: Text('${DateFormat('dd MMMM h:mm a').format(time)}', style: TextStyle(fontSize: 12, color: Colors.white54),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}