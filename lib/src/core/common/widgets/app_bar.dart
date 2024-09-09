import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/home/presentation/pages/notification.dart';
import '../../assets/assets/app_vectors.dart';

class JummaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool actions;
  const JummaAppBar({super.key, required this.title, this.actions = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: textTheme.headlineMedium,
      ),
      centerTitle: true,
      actions: [
        actions ? IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const NotificationPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          icon: SvgPicture.asset(AppVectors.notification),
        ) : const SizedBox(),
      ],
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
