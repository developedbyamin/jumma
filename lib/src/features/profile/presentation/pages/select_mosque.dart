import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../viewmodel/select_mosque/select_mosque_cubit.dart';
import '../../../mosque/presentation/viewmodel/cubit/mosque_cubit.dart';
import 'widgets/mosque_item.dart';

class SelectMosque extends StatelessWidget {
  const SelectMosque({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<MosqueCubit>();
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
                      return StreamBuilder(
                          stream: cubit.selectedMosque.stream,
                          builder: (context, snapshot) {
                            return MosqueItem(
                              mosques: state.mosques[i],
                              onTap: () {
                                cubit.selectedMosque.value = i;
                                context.read<SelectMosqueCubit>().selectMosque(
                                    state.mosques[cubit.selectedMosque.value].id);
                              },
                              color: snapshot.data == i
                                  ? AppColors.greyLight
                                  : Colors.transparent,
                            );
                          });
                    },
                  );
                } else if (state is MosqueError) {
                  return Text("ERROR");
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
