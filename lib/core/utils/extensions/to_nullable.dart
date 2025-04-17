import 'package:flutter_template/core/utils/states/nullable.dart';

extension ToNullable<T> on T? {
  Nullable<T> toNullable() => Nullable.set(this);
}