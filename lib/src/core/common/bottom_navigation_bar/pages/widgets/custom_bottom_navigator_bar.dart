import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../assets/assets/app_vectors.dart';
import '../../bloc/bottom_nav_bloc.dart';
import 'bottom_app_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.of(context).size.height * 0.12,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomAppBarItem(
            vectorPath: AppVectors.home,
            selectedIndex: selectedIndex,
            currentIndex: 0,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(0),
              );
            },
            labelText: 'Home',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.mosque,
            selectedIndex: selectedIndex,
            currentIndex: 1,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(1),
              );
            },
            labelText: 'Mosque',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.time,
            selectedIndex: selectedIndex,
            currentIndex: 2,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(2),
              );
            },
            labelText: 'Azan time',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.surahs,
            selectedIndex: selectedIndex,
            currentIndex: 3,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(3),
              );
            },
            labelText: 'Surahs',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.market,
            selectedIndex: selectedIndex,
            currentIndex: 4,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(4),
              );
            }, labelText: 'Market',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.profile,
            selectedIndex: selectedIndex,
            currentIndex: 5,
            onTap: () {
              context.read<BottomNavBloc>().add(
                ChangeBottomNavEvent(5),
              );
            }, labelText: 'Profile',
          ),
        ],
      ),
    );
  }
}