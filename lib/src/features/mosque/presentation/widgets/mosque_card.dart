import 'package:flutter/material.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/features/mosque/domain/entities/mosque_entity.dart';
import '../../../../core/config/theme/app_colors.dart';

class MosqueCard extends StatelessWidget {
  const MosqueCard(
      {super.key,
      required this.onTap, required this.mosques,});


  final VoidCallback onTap;
  final MosqueEntity mosques;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.fullHeight * 0.08,
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.borderColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              mosques.name,
              style: textTheme.headlineMedium,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 25,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  mosques.address,
                  style: textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
