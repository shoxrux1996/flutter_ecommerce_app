import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class MenuScreen extends StatefulWidget {
  final MenuItem menuItem;

  const MenuScreen({
    super.key,
    required this.menuItem,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: widget.menuItem.name,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: widget.menuItem.children.length,
                itemBuilder: (context, index) {
                  return MenuListItem(
                    item: widget.menuItem.children[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomAppBar(),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final MenuItem item;

  const MenuListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name),
              if (item.children.isNotEmpty)
                ...([
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(Icons.arrow_right_alt),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(menuItem: item),
                        ),
                      );
                    },
                  ),
                ]),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
