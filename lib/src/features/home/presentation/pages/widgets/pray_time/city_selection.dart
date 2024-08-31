import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/home/data/sources/local/city_mapping.dart';
import '../../../../../../core/common/widgets/app_bar.dart';
import '../../../viewmodel/fetch_prayer_times_bloc.dart';

class CitySelection extends StatelessWidget {
  const CitySelection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const JummaAppBar(title: 'Şəhər seçin'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: CityMap.cityDisplayToFetch.keys.length,
          itemBuilder: (context, index) {
            final displayCity = CityMap.cityDisplayToFetch.keys.elementAt(index);
            final fetchCity = CityMap.cityDisplayToFetch[displayCity]!;

            return GestureDetector(
              onTap: () {
                print(fetchCity);
                context.read<FetchPrayerTimesBloc>().add(CityPrayerTimesEvent(city: fetchCity));
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(displayCity, style: textTheme.headlineMedium),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
