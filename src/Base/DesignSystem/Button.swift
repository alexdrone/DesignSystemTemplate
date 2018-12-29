import UIKit

class Button: UIButton {
  // Internal constants.
  private struct Constants {
    static let defaultIconSize: CGFloat = 20
    static let defaultCornerRadius: CGFloat = 8
    static let defaultBorderWidth: CGFloat = 1
    static let defaultVerticalPadding: CGFloat = 12
    static let defaultHorizontalPadding: CGFloat = 24
  }

  enum Style: Int {
    /// Used for primary action buttons.
    case primary
    /// Used for secondary action buttons.
    case secondary
  }
  /// Whether this button has a title laberl or not.
  private var hasTitle: Bool = false
  /// The style assigned at construction time for this button.
  private var buttonStyle: Style = .primary
  /// The button change elevation on touch.
  private var isRaised: Bool = false

  convenience init(
    style: Button.Style,
    title: String = "",
    icon: String? = nil,
    raised: Bool = false
  ) {
    self.init()
    hasTitle = !title.isEmpty
    buttonStyle = style
    isRaised = raised
    let displayTitle = title.isEmpty ? title : "  \(title)"
    let titleFont = Typography.current.style(.button)
    let primaryTextColor = Palette.current.secondary(.invertedTextHigh)
    let secondaryTextColor = Palette.current.secondary(.textHigh)
    let textColor = buttonStyle == .primary ? primaryTextColor : secondaryTextColor
    let selectedTextColor = buttonStyle == .primary ? primaryTextColor : primaryTextColor
    setAttributedTitle(
      titleFont.withColor(textColor).asAttributedString(displayTitle),
      for: .normal)
    setAttributedTitle(
      titleFont.withColor(selectedTextColor).asAttributedString(displayTitle),
      for: .selected)
    let commonControlStates = [
      UIControl.State.normal,
      UIControl.State.highlighted,
      UIControl.State.focused,
      UIControl.State.selected
    ]
    if let icon = icon, var image = UIImage(named: icon) {
      image = image.byResizingToTargetHeight(Constants.defaultIconSize)
      for state in commonControlStates {
        setImage(image.withTintColor(textColor), for: state)
      }
      setImage(image.withTintColor(selectedTextColor), for: .selected)
    }
    layer.cornerRadius = Constants.defaultCornerRadius
    layer.borderWidth = Constants.defaultBorderWidth
    layer.borderColor = Palette.current.hairline.cgColor
    if (!hasTitle) {
      let width = Constants.defaultIconSize + Constants.defaultHorizontalPadding
      layer.cornerRadius = width / 2
    }
    updateBackground()
    sizeToFit()
  }

  private func updateBackground() {
    let backgroundColor = buttonStyle == .primary
      ? Palette.current.secondary(.tint600)
      : Palette.current.light
    let backgroundColorFocused = buttonStyle == .primary
      ? backgroundColor.withAlphaComponent(0.7)
      : Palette.current.secondary(.tint100)
    let backgroundColorSelected =  buttonStyle == .primary
      ? Palette.current.secondary(.tint900)
      : Palette.current.secondary(.tint600)

    if isHighlighted || isFocused {
      self.backgroundColor = backgroundColorFocused
    } else if isSelected {
      self.backgroundColor = backgroundColorSelected
    } else if !isEnabled {
      // TODO
    } else {
      self.backgroundColor = backgroundColor
    }
    updateElevation()
  }

  private func updateElevation() {
    guard isRaised else {
      return
    }
    if isHighlighted || isFocused || isSelected {
      depthPreset = .depth3
    } else {
      depthPreset = .depth1
    }
  }

  // MARK: Overrides

  override open var isHighlighted: Bool {
    didSet { updateBackground() }
  }

  override var isSelected: Bool {
    didSet { updateBackground() }
  }

  override var isEnabled: Bool {
    didSet { updateBackground() }
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    var result = super.sizeThatFits(size)
    result.width += Constants.defaultHorizontalPadding
    result.height += hasTitle
      ? Constants.defaultVerticalPadding
      : Constants.defaultHorizontalPadding
    return result
  }

}
