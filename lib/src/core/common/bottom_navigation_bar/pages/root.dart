import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/widgets/custom_bottom_navigator_bar.dart';
import 'package:jumma/src/features/azan_time/presentation/pages/azan_time.dart';
import 'package:jumma/src/features/home/presentation/pages/home.dart';
import 'package:jumma/src/features/market/presentation/pages/market.dart';
import 'package:jumma/src/features/mosque/presentation/pages/mosque.dart';
import 'package:jumma/src/features/profile/presentation/pages/profile.dart';
import 'package:jumma/src/features/surahs/presentation/pages/surahs.dart';
import '../bloc/bottom_nav_bloc.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: context.read<BottomNavBloc>().state.selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: BlocListener<BottomNavBloc, BottomNavState>(
        listener: (context, state) {
          _pageController.jumpToPage(state.selectedIndex);
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            context.read<BottomNavBloc>().add(ChangeBottomNavEvent(index));
          },
          children: const [
            Home(),
            Mosque(),
            AzanTime(),
            Surahs(),
            Market(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(selectedIndex: state.selectedIndex);
        },
      ),
    );
  }
}

