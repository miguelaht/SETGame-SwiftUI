import SwiftUI

struct SetGameView: View {
	@ObservedObject var viewModel: SetGameViewModel
	var body: some View {
		NavigationView{
			VStack{
				Grid(viewModel.cards){ card in
					cardView(card: card)
				}
				Button("Deal 3 Cards"){
					viewModel.dealThreeCards()
				}.padding()
			}
			.padding()
			.onAppear { withAnimation(.easeInOut(duration: 1)) { viewModel.newGame() }}
			.navigationBarTitle("Set Game", displayMode: .inline).font(Font.title)
			.navigationBarItems(trailing: Button(action: { withAnimation(.easeInOut(duration: 1)) { viewModel.newGame()}}, label: { Text("New Game") }))
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct cardView: View {
	var card: SetGame.Card
	
	var body: some View{
		GeometryReader{ geometry in
			self.body(for: geometry.size)
		}
	}
	
	private func body(for size: CGSize)-> some View{
		ZStack{
			Text("\(card.shape.hashValue)")
				.font(Font.system(size: fontSize(for: size)))
		}
	}
	
	// MARK: - Drawing constants
	private let fontScaleFactor: CGFloat = 0.7
	private func fontSize(for size: CGSize) -> CGFloat{
		min(size.width, size.height) * fontScaleFactor
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		let game = SetGameViewModel()
		return SetGameView(viewModel: game)
	}
}
