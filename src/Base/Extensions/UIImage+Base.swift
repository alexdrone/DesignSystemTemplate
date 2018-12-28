import UIKit

extension UIImage {

  /// Tint the image with the desired color.
  func withTintColor(_ color: UIColor) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
    let context: CGContext = UIGraphicsGetCurrentContext()!
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1.0, y: -1.0)
    context.setBlendMode(CGBlendMode.normal)
    let rect: CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    context.clip(to: rect, mask: self.cgImage!)
    color.setFill()
    context.fill(rect)
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
  }

  /// Resize an image.
  func byResizingToTargetHeight(_ targetHeight: CGFloat) -> UIImage {
    let size = self.size
    let heightRatio = targetHeight / size.height
    let newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
  }
}
