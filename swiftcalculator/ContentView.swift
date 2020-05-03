//
//  ContentView.swift
//  swiftcalculator
//
//  Created by Carlos Petit on 02-05-20.
//  Copyright © 2020 Carlos Petit. All rights reserved.
//

import SwiftUI
enum CalculatorBUtton:String {
    case zero, one,two,three, four, five, six, seven, eigth, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent, dot
    var title:String{
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eigth: return "8"
        case .nine: return "9"
        case .ac: return "AC"
        case .multiply: return "X"
        case .divide: return "÷"
        case .plus: return "+"
        case .minus: return "-"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .equals: return "="
        case .dot: return "."
        }
    }
    var backgroundColor: Color{
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eigth, .nine, .dot:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.orange)
        }
    }
}

class GlobalEnvironment: ObservableObject {
    @Published var display = ""
    func reciveInput(calculatorButton: CalculatorBUtton){
        self.display = calculatorButton.title
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons:[[CalculatorBUtton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eigth, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing:16){
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white).font(.system(size:64))
                }.padding()
                ForEach(buttons, id:\.self){row in
                    HStack(spacing:16) {
                        ForEach(row, id: \.self){ button in
                            Button(action: {
                                self.env.reciveInput(calculatorButton: button)
                            }){
                                Text(button.title)
                                .font(.system(size:32))
                                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 16) / 4)
                                .foregroundColor(.white)
                                .background(button.backgroundColor).cornerRadius(self.buttonWidth(button: button))
                            }
                            
                        }
                    }
                }
                
            }.padding(.bottom)
        }
    }
    func buttonWidth(button: CalculatorBUtton)->CGFloat{
        if button == .zero {
             return (UIScreen.main.bounds.width - 4 * 16) / 4 * 2
        }else{
            return (UIScreen.main.bounds.width - 5 * 16) / 4
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
