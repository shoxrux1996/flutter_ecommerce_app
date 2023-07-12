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
        title: 'Zero to Unicorn',
      ),
      bottomNavigationBar: const DefaultBottomAppBar(),
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
            const SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
              products: Product.products
                  .where(
                    (product) => product.isRecommended,
                  )
                  .toList(),
            ),
            const SectionTitle(title: 'MOST POPULAR'),
            ProductCarousel(
              products: Product.products
                  .where(
                    (product) => product.isPopular,
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
