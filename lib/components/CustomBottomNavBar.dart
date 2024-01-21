import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantix/modules/control/control.dart';
import 'package:plantix/modules/dashboard/dashboard.dart';
import 'package:plantix/modules/report/report.dart';
import 'package:plantix/size_config.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    // GlobalKey bottomNavigationKey = GlobalKey();
    return Container(
      height: getProportionateScreenHeight(73),
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/dashboard.svg",
                    color: MenuState.dashboard == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    width: getProportionateScreenWidth(30),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, Dashboard.routeName),
                ),
                Text(
                  'Dashboard',
                  style: TextStyle(
                      color: MenuState.dashboard == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/control.svg",
                    color: MenuState.control == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    width: getProportionateScreenWidth(30),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, Control.routeName),
                ),
                Text(
                  'Control',
                  style: TextStyle(
                      color: MenuState.control == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/report.svg",
                    color: MenuState.report == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    width: getProportionateScreenWidth(30),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, Report.routeName),
                ),
                Text(
                  'Report',
                  style: TextStyle(
                      color: MenuState.report == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    color: MenuState.settings == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    width: getProportionateScreenWidth(30),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, Dashboard.routeName),
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      color: MenuState.settings == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );

    // return FancyBottomNavigation(
    //   tabs: [
    //     TabData(
    //         iconData: Icons.home,
    //         title: "Home",
    //         onclick: () => Navigator.pushNamed(context, Dashboard.routeName)),
    //     TabData(
    //         iconData: Icons.search,
    //         title: "Search",
    //         onclick: () => Navigator.pushNamed(context, Dashboard.routeName)),
    //     TabData(iconData: Icons.shopping_cart, title: "Basket")
    //   ],
    //   initialSelection: 1,
    //   key: bottomNavigationKey,
    //   onTabChangedListener: (position) {},
    // );
  }
}
