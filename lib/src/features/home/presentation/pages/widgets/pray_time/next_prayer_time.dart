import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/assets/assets/app_vectors.dart';

class NextPrayerTimeWidget extends StatelessWidget {
  final DateTime nextPrayer;
  final String namePrayer;
  const NextPrayerTimeWidget({
    super.key,
    required this.nextPrayer,
    required this.namePrayer,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sonrakı namaz vaxtı',
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              nextPrayer.toString().split(' ')[1].split(':').take(2).join(':'),
              style: textTheme.headlineLarge,
            ),
            Text(
              '$namePrayer 00:01:45 qaldı',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        SvgPicture.asset(
          AppVectors.logo,
          width: 100,
        ),
      ],
    );
  }
}