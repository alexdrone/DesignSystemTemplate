import UIKit

/// `UIFontMetrics` wrapper.
struct FontMetrics {
  /// A scale value based on the current device text size setting. With the device using the
  /// default Large setting, `scaler` will be `1.0`. Only used when `UIFontMetrics` is not
  /// available.
  static var scaler: CGFloat {
    return UIFont.preferredFont(forTextStyle: .body).pointSize / 17.0
  }

  /// Returns a version of the specified font that adopts the current font metrics.
  /// - parameter font: A font at its default point size.
  /// - returns: The font at its scaled point size.
  static func scaledFont(for font: UIFont) -> UIFont {
    if #available(iOS 11.0, *) {
      return UIFontMetrics.default.scaledFont(for: font)
    } else {
      return font.withSize(scaler * font.pointSize)
    }
  }

  /// Returns a version of the specified font that adopts the current font metrics and is
  /// constrained to the specified maximum size.
  /// - parameter font: A font at its default point size.
  /// - parameter maximumPointSize: The maximum point size to scale up to.
  /// - returns: The font at its constrained scaled point size.
  static func scaledFont(for font: UIFont, maximumPointSize: CGFloat) -> UIFont {
    if #available(iOS 11.0, *) {
      return UIFontMetrics.default.scaledFont(for: font,
                                              maximumPointSize: maximumPointSize,
                                              compatibleWith: nil)
    } else {
      return font.withSize(min(scaler * font.pointSize, maximumPointSize))
    }
  }

  /// Scales an arbitrary layout value based on the current Dynamic Type settings.
  /// - parameter value: A default size value.
  /// - returns: The value scaled based on current Dynamic Type settings.
  static func scaledValue(for value: CGFloat) -> CGFloat {
    if #available(iOS 11.0, *) {
      return UIFontMetrics.default.scaledValue(for: value)
    } else {
      return scaler * value
    }
  }
}
