import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/ads/ad_banner.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/home_banner.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/pray_time.dart';
import 'package:jumma/src/features/home/presentation/viewmodel/pray_time_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jumma',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppVectors.notification),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => PrayTimeCubit()..getPrayTimes(),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeBanner(),
                SizedBox(
                  height: 16,
                ),
                AdBanner(),
                SizedBox(
                  height: 16,
                ),
                PrayTimeView(),
                SizedBox(
                  height: 16,
                ),
                AdBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
