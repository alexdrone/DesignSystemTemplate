import UIKit
#if canImport(SwiftUI)
  import SwiftUI
#endif

extension UIColor {
  /// Returns this color as a `SwiftUI.Color`.
  @available(iOS 13.0, *)
  public var color: SwiftUI.Color {
    let c = cgColor.components ?? [0, 0, 0]
    let (r, g, b) = (Double(c[0]), Double(c[1]), Double(c[2]))
    let alpha = Double(cgColor.alpha)
    return SwiftUI.Color(.displayP3, red: r, green: g, blue: b, opacity: alpha)
  }
}

extension UIFont {
  // Returns this font as a `SwiftUI.Font`.
  @available(iOS 13.0, *)
  public var font: SwiftUI.Font {
    return SwiftUI.Font.custom(fontName, size: pointSize)
  }
}

extension SIMD4 where Scalar == Double {
  /// Builds a SIMD4 from a RGB color.
  init(_ hexString: String, _ alpha: Double) {
    func norm(_ value: UInt32) -> Double {
      return Double(value) / 255
    }
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    var a: UInt32
    var r: UInt32
    var g: UInt32
    var b: UInt32
    switch hex.count {
    case 3:  // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:  // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:  // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    a = 255
    if alpha >= 0 && alpha <= 1 {
      a = UInt32(alpha * 255)
    }
    let (dr, dg, db, da) = (norm(r), norm(g), norm(b), norm(a))
    self.init(dr, dg, db, da)
  }

  /// Returns the color associated to the inverted RGB color.
  func inverRGB() -> SIMD4<Double> {
    return SIMD4(1 - self[0], 1 - self[1], 1 - self[2], self[3])
  }
}
