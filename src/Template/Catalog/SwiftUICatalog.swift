import UIKit
import SwiftUI

struct CatalogView: View {
  private let icon = SFSymbol.cube.toImage

  var body: some View {
    ScrollView {
      VStack {
        buttons()
        Divider()
        labels()
        Divider()
        titles()
        Divider()
        cards()
      }
    }
    .background(Theme.palette.surface.color)
    .padding(0)
  }
  
  @ViewBuilder private func buttons() -> some View {
    Group {
      Spacer()
      StyledButton(title: "Primary", icon: icon)
      StyledButton(title: "Primary Raise", icon: icon, isRaised: true)
      StyledButton(style: .secondary, title: "Secondary", icon: icon)
      StyledButton(style: .secondary, title: "Secondary Raised", icon: icon, isRaised: true)
      StyledButton(title: "Tap To Disable", icon: icon, isEnabled: false)
      Spacer()
    }
  }
  
  @ViewBuilder private func labels() -> some View {
    VStack(alignment: .leading) {
      Text("Body1 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.body1)
        .padding()
      Text("Body2 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.body2)
        .padding()
      Text("Subtitle1 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.subtitle1)
        .padding()
      Text("subtitle2 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.subtitle2)
        .padding()
      Text("Caption — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.caption)
        .padding()
      Text("Overline — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.".uppercased())
        .style(.overline)
        .padding()
    }
  }
  
  @ViewBuilder private func titles() -> some View {
    VStack(alignment: .leading) {
      Text("H1 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h1)
        .padding()
      Text("H2 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h2)
        .padding()
      Text("H3 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h3)
        .padding()
      Text("H4 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h4)
        .padding()
      Text("H5 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h5)
        .padding()
      Text("H6 — Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor.")
        .style(.h6)
        .padding()
    }
  }
  
  @ViewBuilder private func cards() -> some View {
    VStack {
      makeCard(style: Card.Style.compact)
      makeCard(style: Card.Style.mid)
      makeCard(style: Card.Style.postage)
      makeCard(style: Card.Style.headline)
    }
  }
  
  private func makeCard(style: String) -> StyledCard {
    StyledCard(
      style: style,
      image: UIImage(named: "imagery_aerial")!,
      title: style.capitalized,
      subtitle:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod " +
        "tempor, incididunt ut labore et dolore magna aliqua.") { true }
  }
  
}
