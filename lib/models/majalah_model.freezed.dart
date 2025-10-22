// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'majalah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MajalahModel {

 int get id; String get judul; String get description; String get image;
/// Create a copy of MajalahModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MajalahModelCopyWith<MajalahModel> get copyWith => _$MajalahModelCopyWithImpl<MajalahModel>(this as MajalahModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MajalahModel&&(identical(other.id, id) || other.id == id)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,judul,description,image);

@override
String toString() {
  return 'MajalahModel(id: $id, judul: $judul, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class $MajalahModelCopyWith<$Res>  {
  factory $MajalahModelCopyWith(MajalahModel value, $Res Function(MajalahModel) _then) = _$MajalahModelCopyWithImpl;
@useResult
$Res call({
 int id, String judul, String description, String image
});




}
/// @nodoc
class _$MajalahModelCopyWithImpl<$Res>
    implements $MajalahModelCopyWith<$Res> {
  _$MajalahModelCopyWithImpl(this._self, this._then);

  final MajalahModel _self;
  final $Res Function(MajalahModel) _then;

/// Create a copy of MajalahModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? judul = null,Object? description = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MajalahModel].
extension MajalahModelPatterns on MajalahModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MajalahModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MajalahModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MajalahModel value)  $default,){
final _that = this;
switch (_that) {
case _MajalahModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MajalahModel value)?  $default,){
final _that = this;
switch (_that) {
case _MajalahModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String judul,  String description,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MajalahModel() when $default != null:
return $default(_that.id,_that.judul,_that.description,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String judul,  String description,  String image)  $default,) {final _that = this;
switch (_that) {
case _MajalahModel():
return $default(_that.id,_that.judul,_that.description,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String judul,  String description,  String image)?  $default,) {final _that = this;
switch (_that) {
case _MajalahModel() when $default != null:
return $default(_that.id,_that.judul,_that.description,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _MajalahModel implements MajalahModel {
   _MajalahModel({required this.id, required this.judul, required this.description, required this.image});
  

@override final  int id;
@override final  String judul;
@override final  String description;
@override final  String image;

/// Create a copy of MajalahModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MajalahModelCopyWith<_MajalahModel> get copyWith => __$MajalahModelCopyWithImpl<_MajalahModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MajalahModel&&(identical(other.id, id) || other.id == id)&&(identical(other.judul, judul) || other.judul == judul)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,judul,description,image);

@override
String toString() {
  return 'MajalahModel(id: $id, judul: $judul, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class _$MajalahModelCopyWith<$Res> implements $MajalahModelCopyWith<$Res> {
  factory _$MajalahModelCopyWith(_MajalahModel value, $Res Function(_MajalahModel) _then) = __$MajalahModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String judul, String description, String image
});




}
/// @nodoc
class __$MajalahModelCopyWithImpl<$Res>
    implements _$MajalahModelCopyWith<$Res> {
  __$MajalahModelCopyWithImpl(this._self, this._then);

  final _MajalahModel _self;
  final $Res Function(_MajalahModel) _then;

/// Create a copy of MajalahModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? judul = null,Object? description = null,Object? image = null,}) {
  return _then(_MajalahModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,judul: null == judul ? _self.judul : judul // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
