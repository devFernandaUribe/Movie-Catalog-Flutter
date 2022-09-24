class CategorieModel {
  final int categorieId;
  final String categorieName;

  const CategorieModel({
    required this.categorieName,
    required this.categorieId,
  });

  CategorieModel.fromJson(Map<String, dynamic> json)
      : categorieId = json['categorieId'] ?? '',
        categorieName = json['categorieName'] ?? '';

  Map<String, dynamic> toJson() => {
        'categorieId': categorieId,
        'categorieName': categorieName,
      };
}
