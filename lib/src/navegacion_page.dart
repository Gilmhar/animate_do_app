import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificacionesProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Notifications Page')),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: const BotonPlay(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int notificacionNumero =
        Provider.of<_NotificacionesProvider>(context).getNotificaciones;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
            label: 'Bones',
            icon: FaIcon(FontAwesomeIcons.bone),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: BounceInDown(
                      from: 12,
                      animate: (notificacionNumero > 0) ? true : false,
                      child: Bounce(
                        from: 12,
                        controller: (controller)=>Provider.of<_NotificacionesProvider>(context).setBounceController = controller,
                        child: Container(
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.pink, shape: BoxShape.circle),
                          child: Text(
                            '$notificacionNumero',
                            style:
                                const TextStyle(color: Colors.white, fontSize: 8.5),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const BottomNavigationBarItem(
            label: 'My Dog',
            icon: FaIcon(FontAwesomeIcons.dog),
          )
        ]);
  }
}

class BotonPlay extends StatelessWidget {
  const BotonPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notiModel = Provider.of<_NotificacionesProvider>(context, listen: false);
        int numeroNotificaciones = notiModel.getNotificaciones;
        numeroNotificaciones++;
        notiModel.setNotificaciones = numeroNotificaciones;
        if (numeroNotificaciones >= 2) {
          final controller = notiModel.getBounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificacionesProvider extends ChangeNotifier {
  int _notificaciones = 0;
  late AnimationController _bounceController;

  int get getNotificaciones => _notificaciones;

  set setNotificaciones(int numeroNotificaciones) {
    _notificaciones = numeroNotificaciones;
    notifyListeners();
  }

  AnimationController get getBounceController => _bounceController;

  set setBounceController(AnimationController controller) {
    _bounceController = controller;
  }

}
