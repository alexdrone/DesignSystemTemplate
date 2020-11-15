import UIKit
import SwiftUI

public struct StyledButton: UIViewRepresentable {

  /// The button style (`primary` or `secondary`).
  let style: Button.Style
  /// The button title displayed in this button.
  let title: String
  /// Optional accessory image.
  let icon: UIImage?
  /// The button change elevation on touch.
  let raised: Bool
  /// Touch-up inside action.
  let action: () -> Void
  
  public func makeCoordinator() -> Coordinator {
    let coordinator = Coordinator()
    coordinator.view = self
    return coordinator
  }
  
  public func makeUIView(context: UIViewRepresentableContext<StyledButton>) -> Button {
    let button = Button(style: style, title: title, icon: icon, raised: raised)
    button.addTarget(
      context.coordinator,
      action: #selector(Coordinator.onTap(sender:)),
      for: .touchUpInside)
    return button
  }
  
  public func updateUIView(_ uiView: Button, context: UIViewRepresentableContext<StyledButton>) {
    context.coordinator.view = self
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

struct StyledButton_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
