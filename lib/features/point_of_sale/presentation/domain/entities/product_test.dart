import 'dart:convert';

ProductTest productTestFromJson(String str) => ProductTest.fromJson(json.decode(str));

String productTestToJson(ProductTest data) => json.encode(data.toJson());

class ProductTest {
    int id;
    int fkCountryBusinessUnitId;
    String sku;
    String shortDescription;
    String categoryDesc;
    String categoryImageUrl;
    String loyaltyCategoryImageUrl;
    int unit;
    String unitOfMeasure;
    String imageUrl;
    String imageThumbUrl;
    int fkProductLegacyAcdId;
    int loyaltyPoints;
    bool isLoyalty;
    bool isActive;

    ProductTest({
        required this.id,
        required this.fkCountryBusinessUnitId,
        required this.sku,
        required this.shortDescription,
        required this.categoryDesc,
        required this.categoryImageUrl,
        required this.loyaltyCategoryImageUrl,
        required this.unit,
        required this.unitOfMeasure,
        required this.imageUrl,
        required this.imageThumbUrl,
        required this.fkProductLegacyAcdId,
        required this.loyaltyPoints,
        required this.isLoyalty,
        required this.isActive,
    });

    factory ProductTest.fromJson(Map<String, dynamic> json) => ProductTest(
        id: json["id"],
        fkCountryBusinessUnitId: json["fkCountryBusinessUnitId"],
        sku: json["sku"],
        shortDescription: json["shortDescription"],
        categoryDesc: json["categoryDesc"],
        categoryImageUrl: json["categoryImageUrl"],
        loyaltyCategoryImageUrl: json["loyaltyCategoryImageUrl"],
        unit: json["unit"],
        unitOfMeasure: json["unitOfMeasure"],
        imageUrl: json["imageUrl"],
        imageThumbUrl: json["imageThumbUrl"],
        fkProductLegacyAcdId: json["fkProductLegacyACDId"],
        loyaltyPoints: json["loyaltyPoints"],
        isLoyalty: json["isLoyalty"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fkCountryBusinessUnitId": fkCountryBusinessUnitId,
        "sku": sku,
        "shortDescription": shortDescription,
        "categoryDesc": categoryDesc,
        "categoryImageUrl": categoryImageUrl,
        "loyaltyCategoryImageUrl": loyaltyCategoryImageUrl,
        "unit": unit,
        "unitOfMeasure": unitOfMeasure,
        "imageUrl": imageUrl,
        "imageThumbUrl": imageThumbUrl,
        "fkProductLegacyACDId": fkProductLegacyAcdId,
        "loyaltyPoints": loyaltyPoints,
        "isLoyalty": isLoyalty,
        "isActive": isActive,
    };
}
