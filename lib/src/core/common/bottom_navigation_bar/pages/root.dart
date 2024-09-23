import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/widgets/custom_bottom_navigator_bar.dart';
import 'package:jumma/src/core/extensions/pager.dart';
import 'package:jumma/src/features/home/presentation/pages/home.dart';
import 'package:jumma/src/features/market/presentation/pages/market.dart';
import 'package:jumma/src/features/mosque/presentation/pages/mosque.dart';
import 'package:jumma/src/features/surahs/presentation/pages/surahs_name.dart';
import '../bloc/bottom_nav_cubit.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.transparent,
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.selectedIndex,
            children: [
              Home(),
              Mosque(),
              SurahsName(),
              Market(),
              Pager.profile
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(
            selectedIndex: state.selectedIndex,
            onTap: (index) {
              context.read<BottomNavCubit>().changeIndex(index);
            },
          );
        },
      ),
    );
  }
}
