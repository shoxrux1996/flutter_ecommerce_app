import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product/product_option_model.dart';

class ProductOptionSelectButton extends StatelessWidget {
  final ProductOption option;
  final Function(String, String) updateOptions;

  const ProductOptionSelectButton({
    super.key,
    required this.option,
    required this.updateOptions,
  });

  void _onTap() {
    updateOptions(option.type, option.name);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !option.disabled ? _onTap : null,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: option.disabled ? Colors.black.withOpacity(0.1) : null,
              border: Border.all(
                color: option.selected ? Colors.cyan : Colors.grey,
                width: option.selected ? 2 : 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  option.name,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
