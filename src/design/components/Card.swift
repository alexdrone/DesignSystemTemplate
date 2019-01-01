import UIKit

class Card: UIView {
  struct Constants {
    static let defaultCornerRadius: CGFloat = Theme.Geometry.defaultCornerRadius
    static let defaultNormalDepth = DepthPreset.depth1
  }

  // Not defined as an enum so that new styles can be introduced by subclasses.
  struct Style {
    static let compact: String = "compact"
    static let mid: String = "mid"
    static let postage: String = "postage"
    static let postageDoubleWidth: String = "postageDoubleWidth"
    static let headline: String = "headline"
  }
  /// The current style.
  var style: String = Style.compact 
  /// The card image (if available).
  var image = Theme.palette.dark.image()
  /// The card title.
  var title = ""
  /// The card subtitle;
  var subtitle = ""

  var selected: Bool = false {
    didSet { setNeedsLayout() }
  }

  // Subviews.
  var contentView = UIView()
  var imageView = UIImageView()
  var titleLabel = UILabel()
  var subtitleLabel = UILabel()
  var backgroundProtection = UIView()

  required override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
    contentView.addSubview(imageView)
    contentView.addSubview(backgroundProtection)
    contentView.addSubview(titleLabel)
    contentView.addSubview(subtitleLabel)
    setNeedsUpdate()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) not supported.")
  }

  /// Override this method to implement new styles or override the existing ones.
  /// - note: Requires super invokation.
  func configureCard(for style: String) {
    backgroundProtection.backgroundColor = Theme.palette.text.withAlphaComponent(0.30)
    backgroundColor = Theme.palette.light
    depthPreset = Constants.defaultNormalDepth
    cornerRadius = Constants.defaultCornerRadius
    clipsToBounds = false
    contentView.backgroundColor = backgroundColor
    contentView.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.image = image
    imageView.clipsToBounds = true
    titleLabel.backgroundColor = backgroundColor
    subtitleLabel.backgroundColor = backgroundColor
    if style == Style.compact || style == Style.postage || style == Style.postageDoubleWidth {
      titleLabel.attributedText = Theme.typography.style(.subtitle2).asAttributedString(title)
      subtitleLabel.attributedText = Theme.typography.style(.caption).asAttributedString(subtitle)
    }
    if style == Style.mid {
      titleLabel.attributedText = Theme.typography.style(.subtitle2).asAttributedString(title)
      subtitleLabel.attributedText = Theme.typography.style(.body2).asAttributedString(subtitle)
    }
    if style == Style.headline {
      titleLabel.attributedText = Theme.typography
        .style(.overline)
        .withColor(Theme.palette.light)
        .asAttributedString(title)
      subtitleLabel.attributedText = Theme.typography
        .style(.h6)
        .withColor(Theme.palette.light)
        .asAttributedString(subtitle)
        titleLabel.backgroundColor = .clear
        subtitleLabel.backgroundColor = .clear
    }
  }

  /// Invoke this method when the view has to be recofigured.
  func setNeedsUpdate() {
    configureCard(for: style)
    setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = bounds
    let geometry = Style.geometry(for: style)
    titleLabel.numberOfLines = geometry.titleNumberOfLines
    subtitleLabel.numberOfLines = geometry.subtitleNumberOfLines
    titleLabel.sizeToFit()
    subtitleLabel.sizeToFit()
    let margin = geometry.margin
    let imageSize = geometry.imageSize
    let labelImageOffset = style == Style.compact || style == Style.mid ? imageSize : 0
    let labelWidth = bounds.size.width - margin * 2 - labelImageOffset
    titleLabel.frame.size.width = labelWidth
    subtitleLabel.frame.size.width = labelWidth
    if style == Style.compact {
      titleLabel.frame.origin = CGPoint(x: margin, y: margin)
      subtitleLabel.frame.origin = CGPoint(x: margin, y: titleLabel.frame.maxY + margin / 2)
      imageView.frame = CGRect(
        origin: CGPoint(x: bounds.size.width - imageSize, y: 0),
        size: CGSize(width: imageSize, height: bounds.size.height))
    }
    if style == Style.mid {
      titleLabel.frame.origin = CGPoint(x: imageSize + margin, y: margin)
      subtitleLabel.frame.origin = CGPoint(
        x: imageSize + margin,
        y: titleLabel.frame.maxY + margin / 2)
      imageView.frame = CGRect(
        origin: CGPoint.zero,
        size: CGSize(width: imageSize, height: bounds.size.height))
    }
    if style == Style.postage || style == Style.postageDoubleWidth{
      titleLabel.frame.origin = CGPoint(x: margin, y: imageSize + margin)
      subtitleLabel.frame.origin = CGPoint(x: margin, y: titleLabel.frame.maxY + margin)
      imageView.frame = CGRect(
        origin: CGPoint.zero,
        size: CGSize(width: bounds.size.width, height: imageSize))
    }
    if style == Style.headline {
      subtitleLabel.frame.origin = CGPoint(
        x: margin,
        y: bounds.size.height - margin - subtitleLabel.bounds.size.height)
      titleLabel.frame.origin = CGPoint(
        x: margin,
        y: subtitleLabel.frame.origin.y - margin - titleLabel.bounds.size.height)
      imageView.frame = CGRect(
        origin: CGPoint.zero,
        size: bounds.size)
    }
    backgroundProtection.frame = imageView.frame
  }

  /// Override this method to implement new styles or override the existing ones.
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    var result = CGSize(
      width: style == Style.postage ? size.width / 2 : size.width,
      height: 0)
    result.height = Style.geometry(for: style).height
    return result
  }
}

extension Card.Style {
  // Associated intrinsic constants.
  struct Geometry {
    let height: CGFloat
    let margin: CGFloat
    let imageSize: CGFloat
    let titleNumberOfLines: Int
    let subtitleNumberOfLines: Int
  }
  /// Returns the layout constants for a given style.
  static func geometry(for style: String) -> Geometry {
    if style == compact {
      return Geometry(
        height: 72,
        margin: 16,
        imageSize: 98,
        titleNumberOfLines: 1,
        subtitleNumberOfLines: 1)
    }
    if style == mid {
      return Geometry(
        height: 120,
        margin: 16,
        imageSize: 120,
        titleNumberOfLines: 1,
        subtitleNumberOfLines: 3)
    }
    if style == postage || style == postageDoubleWidth {
      return Geometry(
        height: 240,
        margin: 8,
        imageSize: 140,
        titleNumberOfLines: 1,
        subtitleNumberOfLines: 3)
    }
    if style == headline {
      return Geometry(
        height: 344,
        margin: 16,
        imageSize: 0,
        titleNumberOfLines: 1,
        subtitleNumberOfLines: 4)
    }
    return Geometry(
      height: 0,
      margin: 0,
      imageSize: 0,
      titleNumberOfLines: 0,
      subtitleNumberOfLines: 0)
  }
}
