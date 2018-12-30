import UIKit

struct Theme {
  struct Geometry {
    static var defaultCornerRadius: CGFloat = 8
  }
  /// The theme palette.
  static var palette: PaletteProtocol = BasePalette()
  /// The theme typography.
  static var typography: TypographyProtocol = BaseTypography()
}
