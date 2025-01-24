import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_template/features/admin/domain/entities/entities.dart';
import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:flutter_template/features/point_of_sale/presentation/domain/domain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ContantsData{

  static List<MenuOptionEntity> adminListMenuOptions = [
    MenuOptionEntity(titulo: "Home", icono: BootstrapIcons.house, subMenu: []),
    MenuOptionEntity(titulo: "Tramites", icono: BootstrapIcons.archive, subMenu: [
      "VISA Primera vez",
      "VISA Renovacion",
      "Global Entry",
      "Pasaporte Mexicano"
    ]),
    MenuOptionEntity(
      titulo: "Usuarios",
      icono: BootstrapIcons.person,
      subMenu: ["Administracion", "Plataforma"],
    ),
    MenuOptionEntity(
      titulo: "Tiempos de espera",
      icono: BootstrapIcons.calendar_event,
      subMenu: []),
    MenuOptionEntity(
      titulo: "Referidos",
      icono: BootstrapIcons.globe_americas,
      subMenu: [],
    ),
  ];

  static List deliveryTypes = [
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.motorcycle,
      label: "A domicilio"
    ),
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.personWalkingArrowRight,
      label: "Para llevar"
    ),
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.utensils,
      label: "Mesa"
    ),
  ];

  static final List<Sale> ventas = [
  Sale(
    id: 1,
    cliente: 'Juan Pérez',
    total: 100.5,
    fecha: DateTime.now(),
  ),
  Sale(
    id: 2,
    cliente: 'Ana López',
    total: 250.75,
    fecha: DateTime.now(),
  ),
  Sale(
    id: 3,
    cliente: 'Carlos Méndez',
    total: 300.0,
    fecha: DateTime.now(),
  ),
];


  static final List<ProductTest> productTestList = [
        ProductTest(
            id: 207,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000002344",
            shortDescription: "Ciel Exprim Limón, Botella Pet 1.00 L, 6 Piezas",
            categoryDesc: "Agua",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Agua.png",
            unit: 6,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(2344) Ciel Exprim Limón, Botella Pet 1.00 L, 6 Piezas.jpg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(2344) Ciel Exprim Limón, Botella Pet 1.00 L, 6 Piezas.jpg",
            fkProductLegacyAcdId: 206,
            loyaltyPoints: 845,
            isLoyalty: true,
            isActive: true
        ),
        ProductTest(
          id: 427,
          fkCountryBusinessUnitId: 1,
          sku: "000000000000001018",
          shortDescription: "Fuze Tea Frutos Rojos, Botella Pet 600 ml, 6 Piezas",
          categoryDesc: "Té",
          categoryImageUrl: "",
          loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Te.png",
          unit: 6,
          unitOfMeasure: "0",
          imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(1018) Fuze Tea Frutos Rojos, Botella Pet 600 ml, 6 Piezas.jpg",
          imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(1018) Fuze Tea Frutos Rojos, Botella Pet 600 ml, 6 Piezas.jpg",
          fkProductLegacyAcdId: 426,
          loyaltyPoints: 970,
          isLoyalty: true,
          isActive: true
        ),
        ProductTest(
          id: 553,
          fkCountryBusinessUnitId: 1,
          sku: "000000000000000648",
          shortDescription: "Fuze Tea Limón, Botella Pet 600 ml, 6 Piezas",
          categoryDesc: "Té",
          categoryImageUrl: "",
          loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Te.png",
          unit: 6,
          unitOfMeasure: "0",
          imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(648) Fuze Tea Limón, Botella Pet 600 ml, 6 Piezas.jpg",
          imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(648) Fuze Tea Limón, Botella Pet 600 ml, 6 Piezas.jpg",
          fkProductLegacyAcdId: 552,
          loyaltyPoints: 970,
          isLoyalty: true,
          isActive: true
        ),
        ProductTest(
            id: 1405,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000000375",
            shortDescription: "Del Valle Mango, Botella Vidrio 413 ml, 6 Piezas",
            categoryDesc: "Jugos y Nectares",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Jugos y néctares.png",
            unit: 6,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(375) Del Valle Mango, Botella Vidrio 413 ml, 6 Piezas.jpg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(375) Del Valle Mango, Botella Vidrio 413 ml, 6 Piezas.jpg",
            fkProductLegacyAcdId: 1404,
            loyaltyPoints: 805,
            isLoyalty: true,
            isActive: true
        ),
        ProductTest(
          id: 1406,
          fkCountryBusinessUnitId: 1,
          sku: "000000000000000376",
          shortDescription: "Del Valle Durazno, Botella Vidrio 413 ml, 6 Piezas",
          categoryDesc: "Jugos y Nectares",
          categoryImageUrl: "",
          loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Jugos y néctares.png",
          unit: 6,
          unitOfMeasure: "0",
          imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(376) Del Valle Durazno, Botella Vidrio 413 ml, 6 Piezas.jpg",
          imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(376) Del Valle Durazno, Botella Vidrio 413 ml, 6 Piezas.jpg",
          fkProductLegacyAcdId: 1405,
          loyaltyPoints: 805,
          isLoyalty: true,
          isActive: true
        ),
        ProductTest(
            id: 1637,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000002874",
            shortDescription: "Del Valle Mango, Botella Pet 1.00 L, 6 Piezas",
            categoryDesc: "Jugos y Nectares",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Jugos y néctares.png",
            unit: 6,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(2874) Del Valle Mango, Botella Pet 1.00 L, 6 Piezas.jpg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/000000000000002874.thumbnail.jpeg",
            fkProductLegacyAcdId: 1636,
            loyaltyPoints: 1330,
            isLoyalty: true,
            isActive: true
        ),
        ProductTest(
            id: 1952,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000000811",
            shortDescription: "Fanta Naranja, Botella Pet 600 ml, 12 Piezas",
            categoryDesc: "Refrescos",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Refrescos.png",
            unit: 12,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/000000000000000811.jpeg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/000000000000000811.thumbnail.jpeg",
            fkProductLegacyAcdId: 1951,
            loyaltyPoints: 2120,
            isLoyalty: true,
            isActive: true
        ),
        ProductTest(
            id: 2599,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000000996",
            shortDescription: "Santa Clara Leche Deslactosada Semi, Tetra Pack 1.00 L, 6 Piezas",
            categoryDesc: "Lácteos",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Lácteos.png",
            unit: 6,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/(996) Santa Clara Leche Deslactosada Semi, Tetra Pack 1.00 L, 6 Piezas.jpg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/imagesth/(996) Santa Clara Leche Deslactosada Semi, Tetra Pack 1.00 L, 6 Piezas.jpg",
            fkProductLegacyAcdId: 2598,
            loyaltyPoints: 1645,
            isLoyalty: true,
            isActive: true
      ),
        ProductTest(
            id: 2962,
            fkCountryBusinessUnitId: 1,
            sku: "000000000000003161",
            shortDescription: "Monster Energy Original, Lata 473 ml, 4 Piezas",
            categoryDesc: "Energéticos",
            categoryImageUrl: "",
            loyaltyCategoryImageUrl: "https://stdndeveus2.blob.core.windows.net/acd/loyalty/MX_Energéticos.png",
            unit: 4,
            unitOfMeasure: "0",
            imageUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/000000000000003161.jpeg",
            imageThumbUrl: "https://b2bstorageprd.blob.core.windows.net/b2b/1/images/000000000000003161.thumbnail.jpeg",
            fkProductLegacyAcdId: 2961,
            loyaltyPoints: 1340,
            isLoyalty: true,
            isActive: true
        )
    ];

 static final List<ProductEntity> productList = [
  ProductEntity(
    sku: 'TACO001',
    id: 1,
    name: 'Taco de Pastor',
    hasParciality: false,
    pricePf: 25.00,
    imgUrl: 'https://example.com/taco_pastor.jpg',
    quantity: 1, 
    description: '',
  ),
  ProductEntity(
    sku: 'TACO002',
    id: 2,
    name: 'Taco de Asada',
    hasParciality: false,
    pricePf: 30.00,
    imgUrl: 'https://example.com/taco_asada.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO003',
    id: 3,
    name: 'Taco de Carnitas',
    hasParciality: false,
    pricePf: 28.00,
    imgUrl: 'https://example.com/taco_carnitas.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO004',
    id: 4,
    name: 'Taco de Barbacoa',
    hasParciality: false,
    pricePf: 32.00,
    imgUrl: 'https://example.com/taco_barbacoa.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO005',
    id: 5,
    name: 'Taco de Suadero',
    hasParciality: false,
    pricePf: 27.00,
    imgUrl: 'https://example.com/taco_suadero.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO006',
    id: 6,
    name: 'Taco de Chorizo',
    hasParciality: false,
    pricePf: 25.00,
    imgUrl: 'https://example.com/taco_chorizo.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO007',
    id: 7,
    name: 'Taco de Pescado',
    hasParciality: false,
    pricePf: 35.00,
    imgUrl: 'https://example.com/taco_pescado.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO008',
    id: 8,
    name: 'Taco Gobernador',
    hasParciality: false,
    pricePf: 40.00,
    imgUrl: 'https://example.com/taco_gobernador.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO009',
    id: 9,
    name: 'Taco de Birria',
    hasParciality: false,
    pricePf: 33.00,
    imgUrl: 'https://example.com/taco_birria.jpg',
    quantity: 1,
    description: '',
  ),
  ProductEntity(
    sku: 'TACO010',
    id: 10,
    name: 'Taco Vegano',
    hasParciality: false,
    pricePf: 29.00,
    imgUrl: 'https://example.com/taco_vegano.jpg',
    quantity: 1,
    description: '',
  ),
];


}