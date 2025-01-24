import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/constants/constants_data.dart';
import 'package:flutter_template/features/point_of_sale/presentation/domain/entities/product_test.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TestScreen extends StatelessWidget {



  static const String path = "/point-of-sale/test";

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //Color surfaceBrand = const Color(0xffDD052B);

 final String markdownData = ''' Esto es texto normal,
  **esto es negrita**,
  *esto es cursiva*,
  y [este es un enlace](https://flutter.dev).
  
  ## Nueva línea con fondo rojo
  Este texto tiene un fondo rojo.
  ''';


    return Scaffold(
      body: 
        Container(
          color: Colors.black,
          child: Markdown(
            data: markdownData,
           styleSheet: MarkdownStyleSheet(
          strong: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          a: TextStyle(color: Colors.red, decoration: TextDecoration.underline),
          h2: TextStyle(
            backgroundColor: Colors.red, // Fondo rojo para el encabezado de nivel 2
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
          ),
        ),
      
    );

    // ignore: dead_code
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            spacing: 5,
            children: [
              SearchBar(),
              CurrentFilters(),
              CustomDivider(),
              LabelHistory(),
              History()
            ],
          ),
        ),
      ),
    );


  }
}

class History extends StatelessWidget {
  const History({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_,i){
    
          return Product();
    
        }, 
        separatorBuilder: (_,__) => Divider(
          color: Colors.grey.withValues(
            alpha: .2
          ),
        ), 
        itemCount: 3
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      BootstrapIcons.clock,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: Image(
                        image: AssetImage("assets/images/coke_image.jpeg")
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    "Nombre del producto",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  )
                )

              ],
            ),
          ),
           Icon(
              BootstrapIcons.x,
              color: Colors.grey,
              size: 20,
            ),
        ],
      ),
    );
  }
}

class LabelHistory extends StatelessWidget {

  const LabelHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Busquedas anteriores",
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 15
          ),
        ),
      ),
    );

  }

}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Divider(
        color: Colors.grey.withValues(
          alpha: .5
        ),
        height: 20,
        thickness: 1,
      ),
    );
  }
}

class CurrentFilters extends StatelessWidget {
  const CurrentFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.symmetric(
              horizontal: 5
            ),
            decoration: BoxDecoration(
              color: AppTheme.error,
              shape: BoxShape.circle 
            ),
            child: Center(
              child: Icon(
                BootstrapIcons.x,
                color: Colors.white,
                size: 17,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 20
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_,i){
            
                  return CustomChip();
            
                }, 
                separatorBuilder: (_,__) => Gap(10), 
                itemCount: 10
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {

  const CustomChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 1,
          color: Colors.grey.withValues(alpha: .9)
        )
      ),
      child: Row(
        spacing: 10,
        children: [
          Text(
            "100 ml",
            style: GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 13
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Icon(
                BootstrapIcons.x,
                color: Colors.black,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );

  }
  
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.withValues(alpha: .4)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 20,
                            child: Autocomplete<ProductTest>(
  optionsBuilder: (TextEditingValue textEditingValue) {
    if (textEditingValue.text.isEmpty) {
      return Iterable<ProductTest>.empty();
    }
    return ContantsData.productTestList.where((product) {
      return product.shortDescription
          .toLowerCase()
          .contains(textEditingValue.text.toLowerCase());
    });
  },
  displayStringForOption: (ProductTest product) => product.shortDescription,
  fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      style: TextStyle(
          color: Colors.black
        ),
      decoration: InputDecoration(
        prefixIcon:   Icon(
          BootstrapIcons.search,
          color: Colors.black,
          size: 17,
        ),
        contentPadding: EdgeInsets.all(0),
        fillColor: Colors.white,
        hintText: 'Buscar producto...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black,width: 1),
        ),
        hintStyle: TextStyle(
          color: Colors.black
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    );
  },
  optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<ProductTest> onSelected, Iterable<ProductTest> options) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductTest option = options.elementAt(index);
              return InkWell(
                onTap: () => onSelected(option),
                child: ListTile(
                  title: Text(option.shortDescription),
                  subtitle: Text(option.sku),
                  leading: Image.network(
                    option.imageThumbUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  },
)

                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  Icon(
                    BootstrapIcons.funnel_fill,
                    size: 17,
                  )
                ],
              ),
            ),
          ),
          Row(
            spacing: 1,
            children: [
              SvgPicture.asset(
                "assets/images/coin.svg",
                width:  27,
                height: 27,
              ),
              Gap(5),
              Text(
                "x 2000",
                style: GoogleFonts.quicksand(
                  color: Colors.black.withValues(
                    alpha: .9
                  ),
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),                        
              ),
            ],
          ),
        ],
      ),
    );
  }
}