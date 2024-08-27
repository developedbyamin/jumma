import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../viewmodel/bloc/city_prayer_time_bloc.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityPrayerTimeBloc, CityPrayerTimeState>(
      builder: (context, state) {
        String cityText = 'Bakı';

        if (state is CityChanged) {
          cityText = state.city;
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Ayliq'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CitySelection(),
                      ),
                    );
                  },
                  child: Text(cityText),
                ),
              ],
            ),
            if (state is CityPrayerTimeLoading)
              const CircularProgressIndicator()
            else if (state is CityPrayerTimeSuccess)
              Expanded(
                child: ListView.builder(
                  itemCount: state.prayerTimes.length,
                  itemBuilder: (context, index) {
                    final prayTime = state.prayerTimes[index];
                    return ListTile(
                      title: Text('Prayer Time: ${prayTime.toString()}'), // Adjust based on your PrayTimeEntity structure
                    );
                  },
                ),
              )
            else if (state is CityPrayerTimeFailure)
                const Text('Failed to load prayer times'),
          ],
        );
      },
    );
  }
}


class CitySelection extends StatelessWidget {
  const CitySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select City')),
      body: BlocBuilder<CityPrayerTimeBloc, CityPrayerTimeState>(
        builder: (context, state) {
          final List<String> cities = [
            'Bakı',
            'Sumqayıt',
            'Lənkəran',
          ];
          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cities[index]),
                onTap: () {
                  context.read<CityPrayerTimeBloc>().add(
                    CitySelected(city: cities[index]),
                  );
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}
