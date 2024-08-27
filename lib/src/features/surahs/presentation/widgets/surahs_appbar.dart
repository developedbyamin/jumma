import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets/assets/app_vectors.dart';

class SurahsAppbar extends StatelessWidget {

  const SurahsAppbar({ super.key });

   @override
   Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
       return  Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppVectors.notification,
              ),
            ),
          ],
        );
  }
}