import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/core/extensions/sizedbox_extension.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.fullHeight * 0.047,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.red,
            )),
        padding: const EdgeInsets.symmetric(horizontal: 20, ),
        child: Row(
          children: [
            SvgPicture.asset(AppVectors.delete),
            10.w,
            Text(
              'Delete Account',
              style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
