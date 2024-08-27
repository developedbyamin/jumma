import 'package:flutter/material.dart';
import 'package:jumma/src/features/surahs/presentation/widgets/surahs_appbar.dart';
import 'package:jumma/src/features/surahs/presentation/widgets/surahs_view.dart';


class SurahsName extends StatelessWidget {
  const SurahsName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SurahsAppbar(),
      ),
      body: const SurahsView(),
    );
  }
}
