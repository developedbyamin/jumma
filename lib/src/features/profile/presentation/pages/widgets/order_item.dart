import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/assets/assets/app_images.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/core/extensions/sizedbox_extension.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key, required this.date, required this.id, required this.price})
      : super(key: key);

  final String date;
  final String id;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: context.fullHeight * .21,
        width: context.fullWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.dmSans(fontSize: 14),
                  ),
                  Text(
                    id,
                    style: GoogleFonts.dmSans(fontSize: 14),
                  )
                ],
              ),
              4.h,
              Text(
                'Price: $price',
                style: GoogleFonts.dmSans(fontSize: 14),
              ),
              4.h,
              const Divider(
                height: 1,
                color: AppColors.greyLight,
              ),
              4.h,
              SizedBox(
                height: context.fullHeight * .1244,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 4),
                      child: SizedBox(
                          height: context.fullHeight * .1244,
                          width: context.fullWidth * .1974,
                          child: Image.asset(AppImages.water)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
