import UIKit

struct Palette {
  /// The current application palette.
  /// Override this static property to use a custom palette.
  static var current: PaletteProtocol = BasePalette()
  // Private utility function.
  static func color(_ hex: String) -> UIColor {
    return UIColor(hexString: hex)
  }
}

protocol PaletteProtocol {
  // Surfaces.
  var surface: UIColor { get }
  var light: UIColor { get }
  var dark: UIColor { get }
  var textOnSurfaceMedium: UIColor { get }
  var textOnSurfaceHigh: UIColor { get }
  var textOnSurfaceDisabled: UIColor { get }
  // Primary.
  var primary: UIColor { get }
  var primary900: UIColor { get }
  var primary800: UIColor { get }
  var primary700: UIColor { get }
  var primary600: UIColor { get }
  var primary500: UIColor { get }
  var primary400: UIColor { get }
  var primary300: UIColor { get }
  var primary200: UIColor { get }
  var primary50: UIColor { get }
  var textOnPrimaryMedium: UIColor { get }
  var textOnPrimaryHigh: UIColor { get }
  var textOnPrimaryDisabled: UIColor { get }
  var whiteTextOnPrimaryMedium: UIColor { get }
  var whiteTextOnPrimaryHigh: UIColor { get }
  var whiteTextOnPrimaryDisabled: UIColor { get }
  // Secondary.
  var secondary: UIColor { get }
  var secondary900: UIColor { get }
  var secondary800: UIColor { get }
  var secondary700: UIColor { get }
  var secondary600: UIColor { get }
  var secondary500: UIColor { get }
  var secondary400: UIColor { get }
  var secondary300: UIColor { get }
  var secondary200: UIColor { get }
  var secondary50: UIColor { get }
  var textOnSecondaryMedium: UIColor { get }
  var textOnSecondaryHigh: UIColor { get }
  var textOnSecondaryDisabled: UIColor { get }
  var whiteTextOnSecondaryMedium: UIColor { get }
  var whiteTextOnSecondaryHigh: UIColor { get }
  var whiteTextOnSecondaryDisabled: UIColor { get }
}

class BasePalette: PaletteProtocol {
  // Surfaces.
  let surface = Palette.color("#fffbfa")
  let light = Palette.color("#ffffff")
  let dark = Palette.color("#f3efee")
  let textOnSurfaceMedium = Palette.color("#000000")
  let textOnSurfaceHigh = Palette.color("#442b2d")
  let textOnSurfaceDisabled = Palette.color("#000000").withAlphaComponent(0.38)
  // Primary.
  let primary = Palette.color("#f5f5f5")
  let primary900 = Palette.color("#212121")
  let primary800 = Palette.color("#424242")
  let primary700 = Palette.color("#616161")
  let primary600 = Palette.color("#757575")
  let primary500 = Palette.color("#9e9e9e")
  let primary400 = Palette.color("#bdbdbd")
  let primary300 = Palette.color("#e0e0e0")
  let primary200 = Palette.color("#eeeeee")
  let primary50 = Palette.color("#f5f5f5")
  let textOnPrimaryMedium = Palette.color("#442b2d")
  let textOnPrimaryHigh = Palette.color("#442b2d")
  let textOnPrimaryDisabled = Palette.color("#000000").withAlphaComponent(0.38)
  let whiteTextOnPrimaryMedium = Palette.color("#ffffff").withAlphaComponent(0.60)
  let whiteTextOnPrimaryHigh = Palette.color("#ffffff")
  let whiteTextOnPrimaryDisabled = Palette.color("#ffffff").withAlphaComponent(0.38)
  // Secondary.
  let secondary = Palette.color("#b2dfdb")
  let secondary900 = Palette.color("#004d40")
  let secondary800 = Palette.color("#00695c")
  let secondary700 = Palette.color("#00796b")
  let secondary600 = Palette.color("#00897b")
  let secondary500 = Palette.color("#009688")
  let secondary400 = Palette.color("#26a694")
  let secondary300 = Palette.color("#4d86ac")
  let secondary200 = Palette.color("#80cbc4")
  let secondary50 = Palette.color("#82dfdb")
  let textOnSecondaryMedium = Palette.color("#442b2d")
  let textOnSecondaryHigh = Palette.color("#442b2d")
  let textOnSecondaryDisabled = Palette.color("#000000").withAlphaComponent(0.38)
  let whiteTextOnSecondaryMedium = Palette.color("#ffffff").withAlphaComponent(0.60)
  let whiteTextOnSecondaryHigh = Palette.color("#ffffff")
  let whiteTextOnSecondaryDisabled = Palette.color("#ffffff").withAlphaComponent(0.38)
}

