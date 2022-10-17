import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/componant.dart';
import 'package:movie/core/utils/strings_manager.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/features/movie/presentation/pages/popular_movies.dart';
import 'package:movie/features/movie/presentation/pages/top_rated_movies.dart';
import 'package:movie/features/movie/presentation/widgets/nowPlaying.dart';
import 'package:movie/features/movie/presentation/widgets/popular.dart';
import 'package:movie/features/movie/presentation/widgets/top_rated.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopulerMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlaying(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const PopularMovies());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(AppStrings.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const Popular(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const TopRatedMovies());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(AppStrings.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRated(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
