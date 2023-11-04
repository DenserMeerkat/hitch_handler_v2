import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@Freezed()
class PostModel with _$PostModel {
  const factory PostModel({
    required String title,
    required String desc,
    required String roll,
    required String domain,
    @Default("") String location,
    @Default("public") String type,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);
}
