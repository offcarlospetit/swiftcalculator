//
//  ContentView.swift
//  swiftcalculator
//
//  Created by Carlos Petit on 02-05-20.
//  Copyright © 2020 Carlos Petit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".",".","="]
    ]
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing:16){
                HStack {
                    Spacer()
                    Text("42").foregroundColor(.white).font(.system(size:64))
                }.padding()
                ForEach(buttons, id:\.self){row in
                    HStack(spacing:16) {
                        ForEach(row, id: \.self){ button in
                            Text(button)
                                .font(.system(size:32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(Color.yellow).cornerRadius(self.buttonWidth())
                        }
                    }
                }
                
            }.padding(.bottom)
        }
    }
    func buttonWidth()->CGFloat{
        return (UIScreen.main.bounds.width - 5 * 16) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
