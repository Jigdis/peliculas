import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:peliculas/widgets/widgets.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tarjetasa principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            //Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies, //Populares
              title: 'Populares', // Opcional,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
