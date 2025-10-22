import 'package:freezed_annotation/freezed_annotation.dart';

part 'majalah_model.freezed.dart';

@freezed
abstract class MajalahModel with _$MajalahModel {
  factory MajalahModel({
    required int id,
    required String judul,
    required String description,
    required String image,
  }) = _MajalahModel;
}
