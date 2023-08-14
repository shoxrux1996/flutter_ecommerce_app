import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
    );
  }

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double get total => 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomBottomAppBar.checkoutBottomAppBar(
        total: total,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal information',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      title: 'Full Name',
                      hintText: 'Enter your full name',
                    ),
                    CustomTextFormField(
                      title: 'Business Name',
                      hintText: 'Enter your business name',
                    ),
                    CustomTextFormField(
                      title: 'Address',
                      hintText: '1234 Main St',
                    ),
                    CustomTextFormField(
                      title: 'Address 2',
                      hintText: 'Appartment or suite',
                    ),
                    CustomTextFormField(
                      title: 'City',
                    ),
                    CustomTextFormField(
                      title: 'State',
                    ),
                    CustomTextFormField(
                      title: 'Zip',
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
            ],
          ),
        ),
      ),
    );
  }
}
