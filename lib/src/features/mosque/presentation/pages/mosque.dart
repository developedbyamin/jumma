import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumma/src/features/mosque/presentation/viewmodel/cubit/mosque_cubit.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../widgets/mosque_card.dart';

class Mosque extends StatelessWidget {
  const Mosque({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => MosqueCubit()..getMosques(),
      child: Scaffold(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Expanded(
              child: BlocBuilder<MosqueCubit, MosqueState>(
                builder: (context, state) {
                  if (state is MosqueLoading) {
                    return const CircularProgressIndicator();
                  }
                  else if (state is MosqueSuccess) {
                    if (state.mosques.isEmpty) {
                      return const Text("No mosques found");
                    }
                    return ListView.builder(
                      itemCount: state.mosques.length,
                      // Use the actual length of the mosques list
                      itemBuilder: (context, index) {
                        return MosqueCard(
                          onTap: () {},
                          mosques: state.mosques[index],
                        );
                      },
                    );
                  }
                  else if (state is MosqueError) {
                    return Text("ERROR");
                  }
                  return Text("AY BLYA");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
