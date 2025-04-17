class Nullable<T> {
  final T? value;
  final bool isSet;

  const Nullable.unset() : value = null, isSet = false;
  const Nullable.set(this.value) : isSet = true;
}
