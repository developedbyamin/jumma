import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../assets/assets/app_vectors.dart';
import '../../bloc/bottom_nav_cubit.dart';
import 'bottom_app_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: Colors.black,
      elevation: 30,
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
              context.read<BottomNavCubit>().changeIndex(0);
            },
            labelText: 'Home',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.mosque,
            selectedIndex: selectedIndex,
            currentIndex: 1,
            onTap: () {
              context.read<BottomNavCubit>().changeIndex(1);
            },
            labelText: 'Mosque',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.surahs,
            selectedIndex: selectedIndex,
            currentIndex: 2,
            onTap: () {
              context.read<BottomNavCubit>().changeIndex(2);
            },
            labelText: 'Surahs',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.market,
            selectedIndex: selectedIndex,
            currentIndex: 3,
            onTap: () {
              context.read<BottomNavCubit>().changeIndex(3);
            },
            labelText: 'Market',
          ),
          BottomAppBarItem(
            vectorPath: AppVectors.profile,
            selectedIndex: selectedIndex,
            currentIndex: 4,
            onTap: () {
              context.read<BottomNavCubit>().changeIndex(4);
            },
            labelText: 'Profile',
          ),
        ],
      ),
    );
  }
}
