import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          TasksRoute(),
          MyAnimalsRoute(),
          CalendarRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  label: 'Tasks', icon: Icon(Icons.assignment)),
              BottomNavigationBarItem(label: 'Animals', icon: Icon(Icons.pets)),
              BottomNavigationBarItem(
                  label: 'Calendar', icon: Icon(Icons.pets)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person)),
            ],
          );
        });
  }
}
