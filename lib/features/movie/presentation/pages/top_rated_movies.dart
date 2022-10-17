import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/app_constants.dart';
import 'package:movie/core/utils/componant.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/pages/movie_detail_screen.dart';
import 'package:movie/features/movie/presentation/widgets/movie_card.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            sl<MovieBloc>()..add(GetTopRatedMoviesEvent()),
        child: BlocBuilder<MovieBloc, MovieState>(
            buildWhen: (previous, current) =>
                previous.topRatedState != current.topRatedState,
            builder: (context, state) {
              switch (state.topRatedState) {
                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());
                case RequestState.loaded:
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text(
                        'Top Rated Movies',
                      ),
                    ),
                    body: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.topRatedMovies.length,
                        itemBuilder: (context, index) {
                          final movie = state.topRatedMovies[index];

                          return Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context, MovieDetailScreen(id: movie.id));
                                },
                                child: MovieCard(
                                  date: movie.releaseDate,
                                  disc: movie.overview,
                                  imageURL:
                                      AppConstants.imageUrl(movie.backdropPath),
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
                    child: Text(state.topRatedMessage),
                  );
              }
            }));
  }
}
