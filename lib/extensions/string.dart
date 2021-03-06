/// A set  of utilities to use on [String]
extension StringUtil on String {
  /// Returns the first letter uppercased
  ///
  /// If [String] is null or empty it will
  /// return [null]
  String get firstLetterCapitalized {
    if (this == null || isEmpty) {
      return null;
    }

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Return if a email is valid or not
  ///
  /// If null or empty the value returned will be always [false]
  /// otherwise, will return a [bool] for indicate if the string
  /// received is a email or not
  bool get isEmail {
    if (this == null || isEmpty) {
      return false;
    }

    final regex =
        r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regexp = RegExp(regex, caseSensitive: false, multiLine: true);

    return regexp.hasMatch(this);
  }

  /// Limit a string based on [limit]
  String limit(int limit) {
    if (length <= limit) {
      return this;
    }

    return substring(0, limit);
  }

  /// Limit a string based on [maxLength]
  ///
  /// Use the [withTrailingDots] property to display ( ... )
  /// after the shortened string (defaults to true)
  String maxLength(
    int maxLength, {
    bool withTrailingDots = true,
  }) {
    if (length <= maxLength) return this;
    String result = substring(
      0,
      withTrailingDots ? maxLength - 3 : maxLength,
    );
    if (withTrailingDots) {
      result += "...";
    }
    return result;
  }

  /// Return [true] if a [String] has a ['true'] value
  bool toBool() {
    if (this == null) {
      return false;
    }

    return this == 'true';
  }
}
