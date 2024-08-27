import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/widgets/custom_bottom_navigator_bar.dart';
import 'package:jumma/src/features/home/presentation/pages/home.dart';
import 'package:jumma/src/features/market/presentation/pages/market.dart';
import 'package:jumma/src/features/mosque/presentation/pages/mosque.dart';
import 'package:jumma/src/features/profile/presentation/pages/profile.dart';
import 'package:jumma/src/features/surahs/presentation/pages/surahs_name.dart';

import '../bloc/bottom_nav_cubit.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BottomNavCubit>();
    final pageController = PageController(initialPage: cubit.state.selectedIndex);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: BlocListener<BottomNavCubit, BottomNavState>(
        listener: (context, state) {
          pageController.jumpToPage(state.selectedIndex);
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            context.read<BottomNavCubit>().changeIndex(index);
          },
          children: const [
            Home(),
            Mosque(),
            SurahsName(),
            Market(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(selectedIndex: state.selectedIndex);
        },
      ),
    );
  }
}
