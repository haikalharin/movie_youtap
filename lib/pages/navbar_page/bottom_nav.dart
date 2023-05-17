
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page.dart';
import '../home_page/home_page_tv.dart';
import '../home_page/profile_page.dart';



int indexBottomNavSelected = 0;
bool isChangeIndex = false;
int index = 0;

class NavbarPage extends StatefulWidget {
  final int? initalIndex;
  final String? userId;
  final bool? isFromNotif;

  NavbarPage(
      {Key? key,
      this.initalIndex,
      this.userId,
      this.isFromNotif = false})
      : super(key: key);

  // final UserModel bottomUserModelData;

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> with TickerProviderStateMixin {

  BuildContext? myContext;
  TabController? controller;
  int indexSelected = 0;

  bool isFirst = true;
  int count = 1;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (indexSelected != indexBottomNavSelected && isChangeIndex) {
      setState(() {
        indexSelected = indexBottomNavSelected;
        isChangeIndex = false;
      });
    }
      return Scaffold(
              resizeToAvoidBottomInset: false,
              body: _buildWidgetBody(),
              bottomNavigationBar:
                  _bottomNavigatorBar(indexSelected: indexSelected),
            );
    }


  Widget _bottomNavigatorBar({int? indexSelected}) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      currentIndex: indexSelected ?? 0,
      onTap: (indexSelected) {
        setState(() {
          this.indexSelected = indexSelected;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: "Movie",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_home_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_home_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: " TV ",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child:SvgPicture.asset(
                'assets/ic_favorit_bar_selected.svg',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          icon:ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child:SvgPicture.asset(
                'assets/ic_favorit_bar.svg',
                width: 30,
                color: Colors.grey,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),

        ),
        BottomNavigationBarItem(
          label: "Akun",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_profile_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon:ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: SvgPicture.asset(
                'assets/ic_profile_bar.svg',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

        // BottomNavigationBarItem(
        //   label: "Pengaturan",
        //   icon: Icon(Icons.settings),
        // ),
//          BottomNavigationBarItem(
//            label: "Collection",
//            icon: Icon(Icons.list_alt),
//          ),
//          BottomNavigationBarItem(
//            label: "Akun",
//            icon: Icon(Icons.settings),
//          ),
      ],
    );
  }

  Widget _buildWidgetBody() {
    switch (indexSelected) {
      case 0:
        return HomePage();
      case 1:
        return HomePageTv();
      case 2:
        return ProfilePage();
      default:
        return Container();
    }
  }



  Future<bool?> _showMyDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda Yakin Ingin Keluar?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

}
