import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/blocs.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/menu/menu_screen.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        leading: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenuLoadingState) {
              return const SizedBox(
                width: 5.0,
                height: 5.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is MenuLoadedState) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(
                        menuItem: state.menuItem,
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
        title: 'E-shop',
      ),
      bottomNavigationBar: CustomBottomAppBar.defaultBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
            BlocBuilder<SectionBloc, SectionState>(
              builder: (context, state) {
                if (state is SectionLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SectionLoadedState) {
                  return Column(
                    children: state.sections.map((section) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: SectionTitle(title: section.name),
                          ),
                          ProductCarousel(products: section.products),
                        ],
                      );
                    }).toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
