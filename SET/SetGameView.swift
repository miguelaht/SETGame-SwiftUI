import SwiftUI

struct SetGameView: View {
	@ObservedObject var viewModel: SetGameViewModel
	var body: some View {
		NavigationView{
			VStack{
				Grid(viewModel.cards){ card in
					CardView(card: card)
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



struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		let game = SetGameViewModel()
		return SetGameView(viewModel: game)
	}
}
