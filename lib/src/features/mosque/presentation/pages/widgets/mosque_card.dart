import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_colors.dart';

class MosqueCard extends StatelessWidget {
  const MosqueCard(
      {Key? key,
      required this.image,
      required this.mosque,
      required this.location, required this.onTap})
      : super(key: key);

  final String image;
  final String mosque;
  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(children: [
          Image.asset(
            image,
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mosque,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 25,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
