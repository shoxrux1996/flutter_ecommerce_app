import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductOptionSelect extends StatelessWidget {
  final String title;
  final List<ProductOption> options;
  final Function(String, String) updateOptions;

  const ProductOptionSelect({
    super.key,
    required this.title,
    required this.options,
    required this.updateOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SectionTitle(
                  title: title,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ProductOptionSelectButton(
                        option: options[index],
                        updateOptions: updateOptions,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
