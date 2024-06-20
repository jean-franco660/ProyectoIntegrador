import 'package:flutter/material.dart';
import 'package:gestion_asistencia/theme/AppTheme.dart';
import 'package:gestion_asistencia/drawer/drawer_user_controller.dart';
import 'package:gestion_asistencia/drawer/home_drawer.dart';
import 'package:gestion_asistencia/ui/actividad/actividad_main.dart';
import 'package:gestion_asistencia/ui/help_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HelpScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppTheme.themeData.primaryColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.themeData.primaryColor,
          body: DrawerUserController(
            screenIndex: drawerIndex!,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView!,
            drawerIsOpen: (bool) {},
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      setState(() {
        drawerIndex = drawerIndexdata;
        switch (drawerIndex) {
          case DrawerIndex.HOME:
            screenView = HelpScreen();
            break;
          case DrawerIndex.Testing:
            screenView = MainActividad();
            break;
          case DrawerIndex.About:
            screenView = MainActividad();
            break;
          default:
            // Añade una pantalla predeterminada o maneja otros casos aquí.
            screenView = HelpScreen();
        }
      });
    }
  }
}
