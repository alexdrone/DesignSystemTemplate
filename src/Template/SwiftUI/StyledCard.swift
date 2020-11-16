import UIKit
import SwiftUI

public struct StyledCard: UIViewRepresentable {
  
  /// The current style.
  /// - note: Styles can be extended and their behaviours redefined by overriding the
  /// `configureCard(for:)` method in your `Card` subclass.
  public let style: String
  /// The card image (if available).
  /// - note: See `Constants.defaultPlaceHolderImage`.
  public let image: UIImage
  /// The card title, will be set as `titleLabel` text.
  public let title: String
  /// The card subtitle, will be set as `subtitleLabel` text.
  public let subtitle: String
  public let onSelect: () -> Bool
  
  public init(
    style: String = Card.Style.compact,
    image: UIImage = Card.Constants.defaultPlaceHolderImage,
    title: String = "",
    subtitle: String = "",
    onSelect: @escaping () -> Bool = { false }
  ) {
    self.style = style
    self.image = image
    self.title = title
    self.subtitle = subtitle
    self.onSelect = onSelect
  }
  
  public func makeCoordinator() -> Coordinator {
    let coordinator = Coordinator()
    coordinator.view = self
    return coordinator
  }
  
  public func makeUIView(context: UIViewRepresentableContext<StyledCard>) -> Card {
    let uiView = Card()
    uiView.style = style
    uiView.image = image
    uiView.title = title
    uiView.subtitle = subtitle
    uiView.setContentHuggingPriority(.required, for: .horizontal)
    uiView.setContentHuggingPriority(.required, for: .vertical)
    uiView.setNeedsUpdate()
    uiView.onTap { _ in
      let isSelected = onSelect()
      guard isSelected != uiView.isSelected else { return }
      Haptic.selection.generate()
      UIView.animate(withDuration: 1) {
        uiView.isSelected = isSelected
        uiView.layoutIfNeeded()
      }
    }
    return uiView
  }
  
  public func updateUIView(_ uiView: Card, context: UIViewRepresentableContext<StyledCard>) {
    context.coordinator.view = self
    uiView.style = style
    uiView.image = image
    uiView.title = title
    uiView.subtitle = subtitle
    uiView.setNeedsUpdate()
  }
  
  // MARK: - Internal coordinator

  public final class Coordinator: NSObject {
    var view: StyledCard?
  }
}
