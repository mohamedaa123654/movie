import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/app_constants.dart';
import 'package:movie/core/utils/componant.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/pages/movie_detail_screen.dart';
import 'package:movie/features/movie/presentation/widgets/movie_card.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            sl<MovieBloc>()..add(GetPopulerMoviesEvent()),
        child: BlocBuilder<MovieBloc, MovieState>(
            buildWhen: (previous, current) =>
                previous.popularState != current.popularState,
            builder: (context, state) {
             
             switch (state.popularState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Popular Movies',
                  ),
                ),
                body: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: state.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.popularMovies[index];

                      return Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap:(){
                            navigateTo(context, MovieDetailScreen(id: movie.id));

                            } ,
                            child: MovieCard(
                              date: movie.releaseDate,
                              disc: movie.overview,
                              imageURL: AppConstants.imageUrl(movie.backdropPath),
                              movieName: movie.title,
                              rate: movie.voteAverage,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }),
              );
           
            case RequestState.error:
              return Center(
                child: Text(state.popularMessage),
              );
          }
             
             
              
           
           
            }));
  }
}
