import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            FadeIn(delay: Duration(milliseconds: 500), child: Text("Animate")),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.twitter), onPressed: () {}),
          SlideInLeft(
            from: 21.0,
            child: IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => FirstPage()));
                }),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
              delay: Duration(milliseconds: 1500),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40.0)),
          FadeInDown(
            delay: Duration(milliseconds: 200),
            child: Text("Título",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200)),
          ),
          FadeInDown(
            delay: Duration(milliseconds: 800),
            child: Text("Este es un texto pequeño",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 1100),
            child: Container(
              width: 240.0,
              height: 2.0,
              color: Colors.blue,
            ),
          )
        ],
      )),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {},
        ),
      ),
    );
  }
}
