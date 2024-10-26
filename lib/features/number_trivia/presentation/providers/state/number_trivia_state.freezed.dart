// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_trivia_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NumberTriviaState {
  int get number => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Create a copy of NumberTriviaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberTriviaStateCopyWith<NumberTriviaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaStateCopyWith<$Res> {
  factory $NumberTriviaStateCopyWith(
          NumberTriviaState value, $Res Function(NumberTriviaState) then) =
      _$NumberTriviaStateCopyWithImpl<$Res, NumberTriviaState>;
  @useResult
  $Res call({int number, String text});
}

/// @nodoc
class _$NumberTriviaStateCopyWithImpl<$Res, $Val extends NumberTriviaState>
    implements $NumberTriviaStateCopyWith<$Res> {
  _$NumberTriviaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberTriviaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberTriviaStateImplCopyWith<$Res>
    implements $NumberTriviaStateCopyWith<$Res> {
  factory _$$NumberTriviaStateImplCopyWith(_$NumberTriviaStateImpl value,
          $Res Function(_$NumberTriviaStateImpl) then) =
      __$$NumberTriviaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, String text});
}

/// @nodoc
class __$$NumberTriviaStateImplCopyWithImpl<$Res>
    extends _$NumberTriviaStateCopyWithImpl<$Res, _$NumberTriviaStateImpl>
    implements _$$NumberTriviaStateImplCopyWith<$Res> {
  __$$NumberTriviaStateImplCopyWithImpl(_$NumberTriviaStateImpl _value,
      $Res Function(_$NumberTriviaStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberTriviaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? text = null,
  }) {
    return _then(_$NumberTriviaStateImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NumberTriviaStateImpl implements _NumberTriviaState {
  const _$NumberTriviaStateImpl({required this.number, required this.text});

  @override
  final int number;
  @override
  final String text;

  @override
  String toString() {
    return 'NumberTriviaState(number: $number, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberTriviaStateImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number, text);

  /// Create a copy of NumberTriviaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberTriviaStateImplCopyWith<_$NumberTriviaStateImpl> get copyWith =>
      __$$NumberTriviaStateImplCopyWithImpl<_$NumberTriviaStateImpl>(
          this, _$identity);
}

abstract class _NumberTriviaState implements NumberTriviaState {
  const factory _NumberTriviaState(
      {required final int number,
      required final String text}) = _$NumberTriviaStateImpl;

  @override
  int get number;
  @override
  String get text;

  /// Create a copy of NumberTriviaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberTriviaStateImplCopyWith<_$NumberTriviaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
