import UIKit

class RootViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = Palette.current.surface
    let label = UIButton()
    label.setAttributedTitle(
      Typography.current.style(.button).asAttributedString("Edit"),
      for: .normal)
    let image = UIImage(named: Icons.edit)?
      .byResizingToTargetHeight(20)
      .withTintColor(Typography.current.style(.button).color)
    label.setImage(image, for: .normal)
    label.setBackgroundImage(Palette.current.secondary50.image(), for: .normal)
    label.sizeToFit()
    let padding: CGFloat = 16
    label.frame.size.height += padding
    label.frame.size.width += padding * 2
    label.layer.cornerRadius = 18
    label.layer.masksToBounds = true


    label.center = view.center
    view.addSubview(label)
  }
}
