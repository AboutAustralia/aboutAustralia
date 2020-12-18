import 'package:about_australia/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({this.currentIndex = 0, this.setCurrentIndex});
  final int currentIndex;
  final Function setCurrentIndex;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
          ),
        ],
      ),
      child: SizedBox(
        height:  MediaQuery.of(context).size.height*0.11,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,

          selectedLabelStyle:
              TextStyle(fontFamily: "Gotham", fontWeight: FontWeight.w300),
          showUnselectedLabels: false,
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.darkBlue,
          selectedItemColor: AppColors.aquaBlue,
          iconSize: 25,
          selectedIconTheme: IconThemeData(size: 27),
          items: [
            BottomNavigationBarItem(
              label: 'تاريخ استراليا',
              icon: Icon(
                Icons.menu_book_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'عن استراليا',
              icon: Icon(Icons.bus_alert),
            ),
            BottomNavigationBarItem(
              label: "اماكن",
              icon: Icon(Icons.place),
            ),
            BottomNavigationBarItem(
              label: "السفر",
              icon: Icon(Icons.airplanemode_active_rounded),
            ),
            BottomNavigationBarItem(
              label: "الاسئلة",
              icon: Icon(Icons.help),
            ),
          ],
          onTap: (index) {
            widget.setCurrentIndex(index);
            print(index);
          },
        ),
      ),
    );
  }
}
