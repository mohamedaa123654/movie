import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_constants.dart';
import 'package:movie/core/utils/componant.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/core/utils/values_manager.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/pages/movie_detail_screen.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingState != current.nowPlayingState,
        builder: (context, state) {
          switch (state.nowPlayingState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 400.0,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return SizedBox(
                // width: SizeConfig.tw,
                child: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {},
                    ),
                    items: state.nowPlayingMovies.map(
                      (item) {
                        return GestureDetector(
                          key: const Key('openMovieMinimalDetail'),
                          onTap: () {
                            navigateTo(context, MovieDetailScreen(id: item.id));
                          },
                          child: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // fromLTRB
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0.3, 0.5, 1],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  height: 560.0,
                                  imageUrl:
                                      AppConstants.imageUrl(item.backdropPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.redAccent,
                                            size: 16.0,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            'Now Playing'.toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        item.title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              );

            case RequestState.error:
              return Center(
                child: Text(state.nowPlayingMessage),
              );
          }
        });
  }
}
