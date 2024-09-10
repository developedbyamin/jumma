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
    context.read<MosqueCubit>().getMosques();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Expanded(
            child: BlocBuilder<MosqueCubit, MosqueState>(
              builder: (context, state) {
                if(state is MosqueLoading){
                  return CircularProgressIndicator();
                }
                else if(state is MosqueSuccess){
                  return ListView.builder(
                          itemCount: 10,
                          itemBuilder:(context, index) {
                            return  MosqueCard(
                              onTap: () {}, mosques: state.mosques[index] ,
                            );
                          },
                        );
                }else{
                  return SizedBox.shrink();
                }
              
              },
            ),
          ),
        ],
      ),
    );
  }
}
