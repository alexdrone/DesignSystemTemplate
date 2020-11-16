import UIKit

public class Label: UILabel {
  /// The typographic style for this label.
  public var style: Typography.Style? = nil {
    didSet { updateView() }
  }
  
  private var insets: UIEdgeInsets = .zero

  public convenience init(
    style: Typography.Style,
    text: String? = nil,
    color: UIColor = Theme.palette.text,
    lines: Int = 0,
    insets: UIEdgeInsets = UIEdgeInsets.zero
  ) {
    self.init()
    self.style = style
    self.textColor = color
    self.numberOfLines = lines
    self.text = text
    self.insets = insets
    updateView()
  }

  public override var text: String? {
    didSet { updateView() }
  }

  public override var textColor: UIColor! {
    didSet { updateView() }
  }

  private func updateView() {
    if let style = style, let text = text {
      attributedText = Theme.typography.style(style).withColor(textColor).asAttributedString(text)
    }
  }
  
  public override func drawText(in rect: CGRect) {
    super.drawText(in: rect.inset(by: insets))
  }
  
  public override var intrinsicContentSize: CGSize {
    sizeThatFits(UIScreen.main.bounds.size)
  }
  
  public override func sizeThatFits(_ size: CGSize) -> CGSize {
    let size = super.sizeThatFits(size)
    return size
  }
}
