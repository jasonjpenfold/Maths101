import SwiftUI

struct selectGame: View{
    var game: Game
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Text("Welcome to Maths 101")
            .padding()
            .font(.largeTitle)
        Text("Pick a game to play.")
            .padding()
            .font(.title)
        Button("Addition"){
            game.setAddition()
            game.randomNumbers()
            game.answer = 0
            dismiss()
        }.buttonStyle(.bordered)
            .font(.largeTitle)
        Button("Subtraction"){
            game.setSubtraction()
            game.randomNumbers()
            game.answer = 0
            dismiss()
        }.buttonStyle(.bordered)
            .font(.largeTitle)
        Button("Multiplication"){
            game.setMultiplication()
            game.randomNumbers()
            game.answer = 0
            dismiss()
        }.buttonStyle(.bordered)
            .font(.largeTitle)
        Button("Division"){
            game.setDivision()
            game.randomNumbers()
            game.answer = 0
            dismiss()
        }.buttonStyle(.bordered)
            .font(.largeTitle)
    }
}
