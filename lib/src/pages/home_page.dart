import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_app/src/models/notification_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationModel(),
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notificationModel =
            Provider.of<NotificationModel>(context, listen: false);
        int numero = notificationModel.getNumero;
        numero++;
        notificationModel.setNumero = numero;

        if (numero >= 2) {
          final controller = notificationModel.getBounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<NotificationModel>(context).getNumero;

    final notificacion = BounceInDown(
        from: 10.0,
        animate: (numero > 0) ? true : false,
        child: Bounce(
          from: 10.0,
          controller: (controller) => Provider.of<NotificationModel>(context)
              .setBounceController = controller,
          child: Container(
            alignment: Alignment.center,
            width: 12.0,
            height: 12.0,
            decoration:
                BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
            child: Text(
              '$numero',
              style: TextStyle(fontSize: 7.0, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.amber,
      items: [
        BottomNavigationBarItem(
            label: 'Bone', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: notificacion,
                )
              ],
            )),
        BottomNavigationBarItem(
            label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}
