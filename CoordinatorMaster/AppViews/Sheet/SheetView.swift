import SwiftUI

struct SheetView: View {

    @StateObject var viewModel: SheetViewModel

    var body: some View {
        content()
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
           // Color.yellow.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
