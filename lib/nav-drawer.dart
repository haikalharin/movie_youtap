import 'package:netplix/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 30),
        children: <Widget>[
          _drawerHeader(context),
          _drawerItem(
              icon: Icons.folder,
              text: 'My Files',
              onTap: () => print('Tap My Files')),
          _drawerItem(
              icon: Icons.group,
              text: 'Shared with me',
              onTap: () => print('Tap Shared menu')),
          _drawerItem(
              icon: Icons.access_time,
              text: 'Recent',
              onTap: () => print('Tap Recent menu')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.bookmark,
              text: 'Family',
              onTap: () => print('Tap Family menu')),
        ],
      ),
    );
  }
}
Widget _drawerHeader(BuildContext context) {
  return Container(
    color: AppColor.green,
    height: MediaQuery.of(context).size.height/10,
    width: MediaQuery.of(context).size.width/1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Container(
          width: MediaQuery.of(context).size.width/1,
          child: Text('Kategori')),
      ],
    ),
  );
}
Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text??'',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}