import UIKit
import SwiftUI

public struct StyledLabel: UIViewRepresentable {
  
  /// The label typographic style.
  public let style: Typography.Style
  /// The label content
  public let text: String
  /// The label foreground color.
  public let color: UIColor
  /// The maximum number of lines to use for rendering text.
  public let lines: Int
  /// The label insets.
  public let insets: UIEdgeInsets
  
  public init(
    style: Typography.Style,
    text: String,
    color: UIColor =  Theme.palette.text,
    lines: Int = 0,
    insets: UIEdgeInsets = .zero
  ) {
    self.style = style
    self.text = text
    self.color = color
    self.lines = lines
    self.insets = insets
  }
  
  public func makeCoordinator() -> Coordinator {
    let coordinator = Coordinator()
    coordinator.view = self
    return coordinator
  }
  
  public func makeUIView(context: UIViewRepresentableContext<StyledLabel>) -> Label {
    let view = Label(style: style, text: text, color: color, lines: lines, insets: insets)
    view.setContentHuggingPriority(.required, for: .horizontal)
    view.setContentHuggingPriority(.required, for: .vertical)
    return view
  }
  
  public func updateUIView(_ uiView: Label, context: UIViewRepresentableContext<StyledLabel>) {
    context.coordinator.view = self
    uiView.text = text
    uiView.textColor = color
  }
  
  // MARK: - Internal coordinator

  public final class Coordinator: NSObject {
    var view: StyledLabel?
    
  }
}
