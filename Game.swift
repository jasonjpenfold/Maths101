import SwiftUI

@Observable
class Game{
    
    var setGame: whichGame = .addition
    var hiScore = UserDefaults.standard.integer(forKey: "hiScore")
    var score = 0
     var num1: Int = Int.random(in: 0...10)
     var num2: Int = Int.random(in: 0...10)
     var answer: Int = 0
    var rightOrWrong: Bool = false
    var showAlert: Bool = false
    var endOfGame: Bool = true
    var mathsSymbol: Image = Image(systemName: "plus")
    var sliderMax: Double = 20.0
    
    func randomNumbers(){
        switch setGame{
        case .addition:
            randomNumbersAddition()
            return
        case .subtraction:
            randomNumbersSubtraction()
            return
        case .multiplication:
            randomNumbersMultiplication()
            return
        case .division:
            randomNumbersDivision()
            return
        
        }
    }
    
    func randomNumbersAddition(){
        num1 = Int.random(in: 0...10)
        num2 = Int.random(in: 0...10)
    }
    func randomNumbersSubtraction(){
        num1 = Int.random(in: 1...10)
        num2 = Int.random(in: 0...num1)
    }
    
    func randomNumbersMultiplication(){
        num1 = Int.random(in: 0...12)
        num2 = Int.random(in: 0...12)
    }
    
    func randomNumbersDivision(){
        let divisionAnswer = Int.random(in: 1...12)
        num2 = Int.random(in: 1...12)
        num1 = divisionAnswer * num2
    }
    
    func addition() -> Int{
        return num1 + num2
    }
    func subtraction() -> Int{
        return num1 - num2
    }
    func multiplication() -> Int{
        return num1 * num2
    }
    func division() -> Int{
        return num1 / num2
    }
    func checkAnswer() -> Bool{
        switch setGame{
        case .addition:
            if answer == addition(){
                return true
            }
        case .subtraction:
            if answer == subtraction(){
                return true
            }
        case .multiplication:
            if answer == multiplication(){
                return true
            }
        case .division:
            if answer == division(){
                return true
            }
        }
        
        return false
    }
    func addScore(){
        score += 1
        if score > hiScore{
            hiScore = score
            UserDefaults.standard.set(hiScore, forKey: "hiScore")
        }
    }
    func setAddition(){
        setGame = .addition
        mathsSymbol = Image(systemName: "plus")
        sliderMax = 20
    }
    func setSubtraction(){
        setGame = .subtraction
        mathsSymbol = Image(systemName: "minus")
        sliderMax = 20
    }
    func setMultiplication(){
        setGame = .multiplication
        mathsSymbol = Image(systemName: "multiply")
        sliderMax = 150
    }
    func setDivision(){
        setGame = .division
        mathsSymbol = Image(systemName: "divide")
        sliderMax = 20
    }
}
