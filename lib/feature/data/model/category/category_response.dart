import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends Equatable {
  @JsonKey(name: 'categories')
  final List<ItemCategoryResponse>? categories;

  const CategoryResponse({required this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  @override
  List<Object?> get props => [
        categories,
      ];

  @override
  String toString() {
    return 'CategoryResponse{categories: $categories}';
  }
}

@JsonSerializable()
class ItemCategoryResponse extends Equatable {
  @JsonKey(name: 'idCategory')
  final String? idCategory;
  @JsonKey(name: 'strCategory')
  final String? strCategory;
  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;
  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  const ItemCategoryResponse({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory ItemCategoryResponse.fromJson(Map<String, dynamic> json) => _$ItemCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCategoryResponseToJson(this);

  @override
  List<Object?> get props => [
        idCategory,
        strCategory,
        strCategoryThumb,
        strCategoryDescription,
      ];

  @override
  String toString() {
    return 'ItemCategoryResponse{idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, '
        'strCategoryDescription: $strCategoryDescription}';
  }
}
