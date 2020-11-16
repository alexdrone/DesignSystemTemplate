import UIKit
import SwiftUI

public struct StyledButton: UIViewRepresentable {

  /// The button style (`primary` or `secondary`).
  public let style: Button.Style
  /// The button title displayed in this button.
  public let title: String
  /// Optional accessory image.
  public let icon: UIImage?
  /// The button change elevation on touch.
  public let isRaised: Bool
  /// Whether the button should be should enabled or not.
  public let isEnabled: Bool
  /// Touch-up inside action.
  public let action: () -> Void
  
  public init(
    style: Button.Style = .primary,
    title: String,
    icon: UIImage? = nil,
    isRaised: Bool = false,
    isEnabled: Bool = true,
    action: @escaping () -> Void = {}
  ) {
    self.style = style
    self.title = title
    self.icon = icon
    self.isRaised = isRaised
    self.isEnabled = isEnabled
    self.action = action
  }
  
  public func makeCoordinator() -> Coordinator {
    let coordinator = Coordinator()
    coordinator.view = self
    return coordinator
  }
  
  public func makeUIView(context: UIViewRepresentableContext<StyledButton>) -> Button {
    let view = Button(style: style, title: title, icon: icon, raised: isRaised)
    view.isEnabled = isEnabled
    view.addTarget(
      context.coordinator,
      action: #selector(Coordinator.onTap(sender:)),
      for: .touchUpInside)
    ()
    view.setContentHuggingPriority(.required, for: .horizontal)
    view.setContentHuggingPriority(.required, for: .vertical)
    return view
  }
  
  public func updateUIView(_ uiView: Button, context: UIViewRepresentableContext<StyledButton>) {
    context.coordinator.view = self
    uiView.isEnabled = isEnabled
    uiView.update(title: title, icon: icon)
  }
  
  // MARK: - Internal coordinator

  public final class Coordinator: NSObject {
    var view: StyledButton?
    
    @objc dynamic func onTap(sender: Button) {
      view?.action()
    }
  }
}
