import UIKit

class RootViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = Palette.current.surface

    let margin: CGFloat = 8
    let button1 = Button(style: .secondary, title: "Lorem ipsum", icon: Icons.pin_drop)
    let button2 = Button(style: .secondary,  icon: Icons.edit, raised: true)
    let textField = TextField(placeholder: "Quaerere...", icon: Icons.search)
    let label = UILabel()
    label.attributedText = Typography.current.style(.body2).asAttributedString("""
      Lorem ipsum dolor sit amet, consectetur adipiscing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    """)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.frame.size = label.sizeThatFits(CGSize(width: 300, height: 300))
    textField.frame.size = textField.sizeThatFits(CGSize(width: 300, height: 300))

    button1.center = view.center
    button2.center = view.center
    label.center = view.center
    textField.center = view.center
    label.frame.origin.y = button1.frame.maxY + margin
    button2.frame.origin.y = label.frame.maxY + margin
    textField.frame.origin.y = button2.frame.maxY + margin

    view.addSubview(button1)
    view.addSubview(label)
    view.addSubview(button2)
    view.addSubview(textField)
  }
}
