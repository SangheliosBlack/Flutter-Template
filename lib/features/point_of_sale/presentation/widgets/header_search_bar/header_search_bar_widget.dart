import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/header_search_bar/header_search_bar.dart';

class HeaderSearchBar extends StatelessWidget {

  const HeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Row(
        spacing: 15,
        children: [
          SearchBar(),
          ProfileCard()
        ],
      ),
    );

  }

}