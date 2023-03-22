import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_horeca/models/menu_item.dart';
import 'package:simple_horeca/screens/menu_viewer_screen.dart';
import 'package:simple_horeca/widgets/menu_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final menuItems = MenuItem.getMenuItems();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: menuItems
                .map(
                  (menuItem) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: MenuTile(
                        title: menuItem.title,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuViewerScreen(
                                title: menuItem.title,
                                files: menuItem.files,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
