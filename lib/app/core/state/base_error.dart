class BaseError<T> extends Error {
  final String message;
  T? errorModel;

  BaseError(this.message, {this.errorModel});

  @override
  String toString() {
    return message;
  }
}
