import SwiftUI

struct ContentView: View {
    @State var game = Game()
   @State var answer: Int = 0
    @State var sliderValue = 0.0
    @State var setGame: whichGame = .addition
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Score : \(game.score)")
                        .font(.largeTitle)
                    Text("HiScore : \(game.hiScore)")
                        .font(.title)
                        
                }
                Section{
                    Text("What is \(game.num1) \(game.mathsSymbol) \(game.num2) ?")
                        .padding()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        
                }
                
                Section{
                    Text("Answer = \(Int(sliderValue))")
                        .padding()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Section{
                        
                        
                    Slider(value: $sliderValue, in: 0...game.sliderMax, step: 1)
                }.padding()
            
                                    
            }.navigationTitle("Maths 101")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    Button("End Game"){
                        game.endOfGame = true
                    }.buttonStyle(.bordered)
                        
                }.sheet(isPresented: $game.endOfGame){selectGame(game: game)}
                
            
            Button("Submit Answer"){
                game.answer = Int(sliderValue)
                game.rightOrWrong = game.checkAnswer()
                game.showAlert = true
                sliderValue = 0
                
            }
                .buttonStyle(.borderedProminent)
                .font(.title)
                .controlSize(.extraLarge)
                .buttonBorderShape(.capsule)
                .padding()
                .alert(game.rightOrWrong ? "Correct" : "No, no, no", isPresented: $game.showAlert){
                    Button("Ok", role: .cancel){
                        if game.rightOrWrong{
                            game.randomNumbers()
                            game.answer = 0
                            game.addScore()
                            
                        }
                    }
                }
            
            
            
        }
    }
}
