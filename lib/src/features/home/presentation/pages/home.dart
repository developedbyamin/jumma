import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/home_banner.dart';
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
                PrayTimeView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrayTimeView extends StatelessWidget {
  const PrayTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayTimeCubit, PrayTimeState>(
      builder: (context, state) {
        if (state is PrayTimeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PrayTimeSuccess) {
          final prayTimes = state.prayTimes;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPrayTimeRow('Fajr', prayTimes.fajr),
              _buildPrayTimeRow('Dhuhr', prayTimes.dhuhr),
              _buildPrayTimeRow('Asr', prayTimes.asr),
              _buildPrayTimeRow('Maghrib', prayTimes.maghrib),
              _buildPrayTimeRow('Isha', prayTimes.isha),
            ],
          );
        } else if (state is PrayTimeFailure) {
          return const Center(child: Text('Failed to load prayer times'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildPrayTimeRow(String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(time),
        ],
      ),
    );
  }
}
