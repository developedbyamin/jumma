import 'package:flutter/material.dart';
import 'package:jumma/src/core/ads/ad_banner.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/home_banner.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/pray_time/pray_time.dart';
import '../../../../core/common/widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: JummaAppBar(
        title: 'Home',
        actions: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeBanner(),
              SizedBox(height: 8),
              AdBanner(),
              SizedBox(height: 16),
              PrayTime(),
              SizedBox(height: 16),
              AdBanner(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
