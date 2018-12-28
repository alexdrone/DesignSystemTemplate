import UIKit

// See *Icons.generated.swift*.

extension UIImageView {

  /// Configure this image view to work with the icon passed as argument.
  /// - parameter icon: The icon name, see *Icons.generated.swift*.
  /// - parameter size: The optional icon size (with the assumption that the icon is squared).
  /// - parameter color: Tint the image with the desired color.
  @discardableResult
  func withIcon(_ icon: String, size: CGFloat? = nil, color: UIColor? = nil) -> UIImageView {
    guard let icon = UIImage(named: icon)?.withRenderingMode(.alwaysTemplate) else { return self }
    image = icon
    if let size = size { frame.size = CGSize(width: size, height: size) }
    if let color = color { tintColor = color }
    return self
  }
}

extension UIButton {

  /// Configure this button to work with the icon passed as argument.
  /// - parameter icon: The icon name, see *Icons.generated.swift*.
  /// - parameter size: The optional icon size (with the assumption that the icon is squared).
  /// - parameter color: Tint the image with the desired color.
  @discardableResult
  func withIcon(_ icon: String, size: CGFloat? = nil, color: UIColor? = nil) -> UIButton {
    guard var icon = UIImage(named: icon)?.withRenderingMode(.alwaysTemplate) else { return self }
    if let size = size { icon = icon.image(byResizingToTargetHeight: size) }
    self.setImage(icon, for: .normal)
    if let color = color { tintColor = color }
    return self
  }
}
