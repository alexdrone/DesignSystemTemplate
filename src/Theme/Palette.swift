import UIKit

typealias Color = UIColor

struct Palette {
  /// The current application palette.
  static var current: PaletteProtocol = DefaultPalette() {
    didSet {
      // Trigger app-wide notification.
    }
  }
}

protocol PaletteProtocol {
  // Surfaces.
  var surface: Color { get }
  var light: Color { get }
  var dark: Color { get }
  var textOnSurfaceMedium: Color { get }
  var textOnSurfaceHigh: Color { get }
  var textOnSurfaceDisabled: Color { get }
  // Primary.
  var primary: Color { get }
  var primary900: Color { get }
  var primary800: Color { get }
  var primary700: Color { get }
  var primary600: Color { get }
  var primary500: Color { get }
  var primary400: Color { get }
  var primary300: Color { get }
  var primary200: Color { get }
  var primary50: Color { get }
  var textOnPrimaryMedium: Color { get }
  var textOnPrimaryHigh: Color { get }
  var textOnPrimaryDisabled: Color { get }
  var whiteTextOnPrimaryMedium: Color { get }
  var whiteTextOnPrimaryHigh: Color { get }
  var whiteTextOnPrimaryDisabled: Color { get }
  // Secondary.
  var secondary: Color { get }
  var secondary900: Color { get }
  var secondary800: Color { get }
  var secondary700: Color { get }
  var secondary600: Color { get }
  var secondary500: Color { get }
  var secondary400: Color { get }
  var secondary300: Color { get }
  var secondary200: Color { get }
  var secondary50: Color { get }
  var textOnSecondaryMedium: Color { get }
  var textOnSecondaryHigh: Color { get }
  var textOnSecondaryDisabled: Color { get }
  var whiteTextOnSecondaryMedium: Color { get }
  var whiteTextOnSecondaryHigh: Color { get }
  var whiteTextOnSecondaryDisabled: Color { get }
}

struct DefaultPalette: PaletteProtocol {
  // Surfaces.
  let surface = color("#fffbfa")
  let light = color("#ffffff")
  let dark = color("#f3efee")
  let textOnSurfaceMedium = color("#442b2d")
  let textOnSurfaceHigh = color("#442b2d")
  let textOnSurfaceDisabled = color("#000000").withAlphaComponent(0.38)
  // Primary.
  let primary = color("#f5f5f5")
  let primary900 = color("#212121")
  let primary800 = color("#424242")
  let primary700 = color("#616161")
  let primary600 = color("#757575")
  let primary500 = color("#9e9e9e")
  let primary400 = color("#bdbdbd")
  let primary300 = color("#e0e0e0")
  let primary200 = color("#eeeeee")
  let primary50 = color("#f5f5f5")
  let textOnPrimaryMedium = color("#442b2d")
  let textOnPrimaryHigh = color("#442b2d")
  let textOnPrimaryDisabled = color("#000000").withAlphaComponent(0.38)
  let whiteTextOnPrimaryMedium = color("#ffffff").withAlphaComponent(0.60)
  let whiteTextOnPrimaryHigh = color("#ffffff")
  let whiteTextOnPrimaryDisabled = color("#ffffff").withAlphaComponent(0.38)
  // Secondary.
  let secondary = color("#b2dfdb")
  let secondary900 = color("#004d40")
  let secondary800 = color("#00695c")
  let secondary700 = color("#00796b")
  let secondary600 = color("#00897b")
  let secondary500 = color("#009688")
  let secondary400 = color("#26a694")
  let secondary300 = color("#4d86ac")
  let secondary200 = color("#80cbc4")
  let secondary50 = color("#82dfdb")
  let textOnSecondaryMedium = color("#442b2d")
  let textOnSecondaryHigh = color("#442b2d")
  let textOnSecondaryDisabled = color("#000000").withAlphaComponent(0.38)
  let whiteTextOnSecondaryMedium = color("#ffffff").withAlphaComponent(0.60)
  let whiteTextOnSecondaryHigh = color("#ffffff")
  let whiteTextOnSecondaryDisabled = color("#ffffff").withAlphaComponent(0.38)
}

// Private utility function.
private func color(_ hex: String) -> Color {
  return UIColor(hexString: hex)
}
