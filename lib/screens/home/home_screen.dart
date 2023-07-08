import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero to Unicorn',
      ),
      bottomNavigationBar: const HomeNavBar(),
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
      drawer: Drawer(
        child: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
