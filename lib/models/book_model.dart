import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';

@freezed
abstract class BookModel with _$BookModel {
  factory BookModel({
    required int id,
    required String judul,
    required String description,
    required String image,
  }) = _BookModel;
}
