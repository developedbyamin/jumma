import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../viewmodel/select_mosque/select_mosque_cubit.dart';
import '../../../mosque/presentation/viewmodel/cubit/mosque_cubit.dart';
import 'widgets/mosque_item.dart';

class SelectMosque extends StatefulWidget {
  const SelectMosque({Key? key}) : super(key: key);

  @override
  State<SelectMosque> createState() => _SelectMosqueState();
}

class _SelectMosqueState extends State<SelectMosque> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadSelectedMosque();
  }

  _loadSelectedMosque() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedIndex = prefs.getInt('selected_mosque_id') ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select mosque',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<MosqueCubit, MosqueState>(
              builder: (context, state) {
                if (state is MosqueLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MosqueSuccess) {
                  if (state.mosques.isEmpty) {
                    return const Text("No mosques found");
                  }
                  return ListView.builder(
                    itemCount: state.mosques.length,
                    itemBuilder: (context, i) {
                      final mosque = state.mosques[i];
                      return MosqueItem(
                        mosques: state.mosques[i],
                        onTap: () {
                          setState(() {
                            selectedIndex = mosque.id;
                          });
                          context
                              .read<SelectMosqueCubit>()
                              .selectMosque(mosque.id);
                        },
                        color: selectedIndex == mosque.id
                            ? AppColors.greyLight
                            : Colors.transparent,
                      );
                    },
                  );
                } else if (state is MosqueError) {
                  return const Text("An error occurred while fetching mosques. Please try again.");
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
