import SwiftUI

struct SetGameView: View {
	@ObservedObject var viewModel: SetGameViewModel
	var body: some View {
		NavigationView{
			VStack{
				Grid(viewModel.cards){ card in
					CardView(card: card).onTapGesture{
						viewModel.selectCard(card: card)
					}
				}
				Text("Sets found: \(viewModel.setsFound)").font(.caption).animation(.spring())
				Button("Deal 3 Cards"){
					viewModel.dealThreeCards()
				}.font(.title2)
			}
			.padding()
			.onAppear { withAnimation(.easeInOut(duration: 1)) { viewModel.newGame() }}
			.navigationBarTitle("Set Game", displayMode: .inline).font(Font.title)
			.navigationBarItems(trailing: Button(action: { withAnimation(.easeInOut(duration: 1)) { viewModel.newGame()}}, label: { Text("New Game") }))
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}



struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		let game = SetGameViewModel()
		return SetGameView(viewModel: game)
	}
}
