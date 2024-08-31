import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/home/presentation/pages/widgets/pray_time/prayer_times.dart';
import '../../../../data/sources/local/city_mapping.dart';
import '../../../../domain/entities/pray_time.dart';
import '../../../viewmodel/fetch_prayer_times_bloc.dart';
import 'city_selection.dart';
import 'next_prayer_time.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<FetchPrayerTimesBloc>().add(CityPrayerTimesEvent(city: 'baku'));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize:
                    WidgetStateProperty.all(Size(width * 0.4, height * 0.05)),
              ),
              child: const Text('Aylıq'),
            ),
            BlocListener<FetchPrayerTimesBloc, FetchPrayerTimesState>(
              listener: (context, state) {
                if (state is FetchPrayerTimesSuccess) {
                  print(MediaQuery.of(context).size.height);
                  print('State updated: ${state.city}');
                }
                if (state is FetchPrayerTimesFailure) {
                  print('Failed the page couldnt rebuilded');
                }
              },
              child: BlocSelector<FetchPrayerTimesBloc, FetchPrayerTimesState,
                  String>(
                selector: (state) {
                  if (state is FetchPrayerTimesSuccess) {
                    print(state.city);
                    return CityMap.fetchToCityDisplay[state.city]!;
                  }
                  return 'Bakı'; // Default city name
                },
                builder: (context, displayCity) {
                  print('Display city: $displayCity');
                  return OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CitySelection()),
                      );
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          WidgetStateProperty.all(const Color(0xFF05AC58)),
                      side: WidgetStateProperty.all(
                          const BorderSide(color: Color(0xFF05AC58))),
                      backgroundColor: WidgetStateProperty.all(
                          const Color(0xFF05AC58).withOpacity(0.1)),
                      minimumSize: WidgetStateProperty.all(
                          Size(width * 0.4, height * 0.05)),
                    ),
                    child: Text(displayCity),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<FetchPrayerTimesBloc, FetchPrayerTimesState, DateTime>(
          selector: (state) {
            if (state is FetchPrayerTimesSuccess) {
              return DateTime.now();
            }
            return DateTime.now();
          },
          builder: (context, nextPrayerTime) {
            return NextPrayerTimeWidget(
              nextPrayer: nextPrayerTime,
              namePrayer: 'Zohr',
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<FetchPrayerTimesBloc, FetchPrayerTimesState,
            List<PrayerTimeEntity>?>(
          selector: (state) {
            if (state is FetchPrayerTimesSuccess &&
                state.prayerTimes.isNotEmpty) {
              return state.prayerTimes;
            }
            return null;
          },
          builder: (context, prayerTimes) {
            if (prayerTimes == null) {
              return const Center(
                child: Text(
                  'No prayer times available.',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return PrayerTimesWidget(prayerTimes: prayerTimes);
          },
        ),
      ],
    );
  }
}
