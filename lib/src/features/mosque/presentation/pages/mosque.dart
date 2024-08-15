import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/assets/app_images.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import 'filter_page.dart';
import 'widgets/filter_button.dart';
import 'widgets/mosque_card.dart';

class Mosque extends StatelessWidget {
  const Mosque({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterButton(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const FilterPage()))
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder:(context, index) {
                  return  MosqueCard(
                    image: AppImages.mosque, 
                    mosque: 'Bibi-Heybat Mosque', 
                    location: 'Sabayil District, Baku', 
                    onTap: () {  },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
