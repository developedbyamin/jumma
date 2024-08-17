import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/ads/ad_banner.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/home/presentation/pages/notification.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/home_banner.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/pray_time.dart';
import 'package:jumma/src/features/home/presentation/viewmodel/pray_time_cubit.dart';
import '../../../../../service_locator.dart';
import '../../domain/usecases/clear_cache_use_case.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => PrayTimeCubit()..getPrayTimes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Jumma',
            style: textTheme.headlineMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NotificationPage(),
                  ),
                );
              },
              icon: SvgPicture.asset(AppVectors.notification),
            ),
          ],
        ),
        body: BlocBuilder<PrayTimeCubit, PrayTimeState>(
          builder: (context, state) {
            final prayTimeCubit = context.read<PrayTimeCubit>();
            return RefreshIndicator(
              onRefresh: () async {
                await sl<ClearCacheUseCase>().call();
                await prayTimeCubit.getPrayTimes();
              },
              color: AppColors.primary,
              child: const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeBanner(),
                      SizedBox(height: 16),
                      AdBanner(),
                      SizedBox(height: 16),
                      PrayTimeView(),
                      SizedBox(height: 16),
                      AdBanner(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
