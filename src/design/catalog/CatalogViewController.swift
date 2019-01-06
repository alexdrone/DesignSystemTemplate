import UIKit

class CatalogViewController: UIViewController {
  private var components: [UIView] = []
  // Buttons.
  private let primaryButton = Button(
    style: .primary,
    title: "Primary",
    icon: Icons.pin_drop)
  private let primaryButtonRaised = Button(
    style: .primary,
    title: "Primary Raised",
    icon: Icons.pin_drop,
    raised: true)
  private let secondaryButton = Button(
    style: .secondary,
    title: "Secondary",
    icon: Icons.pin_drop)
  private let secondaryButtonRaised = Button(
    style: .secondary,
    title: "Secondary Raised",
    icon: Icons.pin_drop,
    raised: true)
  private let primaryButtonNoText = Button(
    style: .primary,
    icon: Icons.search)
  private let secondaryButtonNoText = Button(
    style: .secondary,
    icon: Icons.search,
    raised: true)
  private let disabledButton = Button(
    style: .secondary,
    title: "Disabled",
    icon: Icons.pin_drop)
  // Labels.
  private let body1Label = Label(
    style: .body1,
    text: "Body1 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
  private let body2Label = Label(
    style: .body2,
    text: "Body2 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
  private let subtitle1Label = Label(
    style: .subtitle1,
    text: "Subtitle1 — Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua.")
  private let subtitle2Label = Label(
    style: .subtitle2,
    text: "Subtitle2 — Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua.")
  private let captionLabel = Label(
    style: .caption,
    text: "Caption — Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua.")
  private let overlineLabel = Label(
    style: .overline,
    text: "Overline — Lorem ipsum dolor sit amet.")
  // Textfield.
  private let textField = TextField(
    placeholder: "Textfield",
    icon: Icons.search,
    raised: false)
  private let textFieldRaised = TextField(
    placeholder: "Textfield Raised",
    icon: Icons.search,
    raised: true)
  // Cards.
  private let compactCard = makeCard(style: Card.Style.compact)
  private let midCard = makeCard(style: Card.Style.mid)
  private let postageCard = makeCard(style: Card.Style.postage)
  private let headlineCard = makeCard(style: Card.Style.headline)

  override func loadView() {
    view = UIScrollView()
    view.backgroundColor = Theme.palette.surface
    view.addSubview(primaryButton)
    view.addSubview(primaryButtonRaised)
    view.addSubview(secondaryButton)
    view.addSubview(secondaryButtonRaised)
    view.addSubview(primaryButtonNoText)
    view.addSubview(secondaryButtonNoText)
    disabledButton.isEnabled = false
    view.addSubview(body1Label)
    view.addSubview(body2Label)
    view.addSubview(subtitle1Label)
    view.addSubview(subtitle2Label)
    view.addSubview(captionLabel)
    view.addSubview(overlineLabel)
    view.addSubview(textField)
    view.addSubview(textFieldRaised)
    view.addSubview(compactCard)
    view.addSubview(midCard)
    view.addSubview(postageCard)
    view.addSubview(headlineCard)
  }

  override func viewDidLayoutSubviews() {
    let margin: CGFloat = 24
    var y: CGFloat = 64
    for subview in view.subviews {
      subview.frame.size = subview.sizeThatFits(CGSize(
        width: view.bounds.size.width - margin * 2,
        height: view.bounds.size.height))
      subview.center = view.center
      subview.frame.origin.y = y + margin
      y = subview.frame.maxY
      if let label = subview as? UILabel {
        label.textAlignment = .center
      }
    }
    guard let scrollView = view as? UIScrollView else { return }
    scrollView.contentSize = CGSize(width: view.bounds.size.width, height: y)
  }

  private static func makeCard(style: String) -> Card {
    let card = Card()
    card.style = style
    card.title = style.capitalized
    card.image = UIImage(named: "imagery_aerial")!
    card.subtitle =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod " +
      "tempor, incididunt ut labore et dolore magna aliqua."
    card.setNeedsUpdate()
    card.onTap { _ in
      UIView.animate(withDuration: 1) {
        card.isSelected = !card.isSelected
        card.layoutIfNeeded()
      }
    }
    return card
  }

}
