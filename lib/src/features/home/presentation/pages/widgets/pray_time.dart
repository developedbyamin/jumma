import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/time_remaining.dart';
import '../../../domain/entities/pray_time.dart';
import '../../viewmodel/pray_time_cubit.dart';

class PrayTimeView extends StatelessWidget {
  const PrayTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayTimeCubit, PrayTimeState>(
      builder: (context, state) {
        if (state is PrayTimeLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is PrayTimeSuccess) {

          List<Map<String, dynamic>> prayTimesList = [
            {'title': 'Fajr', 'time': state.prayTimes.fajr},
            {'title': 'Dhuhr', 'time': state.prayTimes.dhuhr},
            {'title': 'Asr', 'time': state.prayTimes.asr},
            {'title': 'Maghrib', 'time': state.prayTimes.maghrib},
            {'title': 'Isha', 'time': state.prayTimes.isha},
          ];

          String nextPrayerName = '';

          for(var pray in prayTimesList){
            final isNext = PrayerTimeCalculator.isNextPrayerTime(
              pray['time'],
              state.nextPrayerTime,
            );
            if(isNext){
              nextPrayerName = pray['title'];
              break;
            }
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Next prayer',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            PrayerTimeCalculator.dataTimeToString(
                                state.nextPrayerTime!),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w700),
                          ),
                          // Pass the nextPrayerName to the TimeRemainingWidget
                          TimeRemainingWidget(
                            nextPrayerTime: state.nextPrayerTime!,
                            nextPrayerName: nextPrayerName,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppVectors.logo,
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: prayTimesList.length,
                    itemBuilder: (context, index) {
                      final item = prayTimesList[index];
                      final isNext = PrayerTimeCalculator.isNextPrayerTime(
                        item['time'],
                        state.nextPrayerTime,
                      );
                      return Column(
                        children: [
                          _buildPrayTimeRow(
                            item['title'],
                            item['time'],
                            isNext,
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        } else if (state is PrayTimeFailure) {
          return const Center(child: Text('Failed to load prayer times'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildPrayTimeRow(String title, String time, bool isNext) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: isNext ? Colors.green : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              time,
              style: TextStyle(
                  color: isNext ? Colors.green : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
