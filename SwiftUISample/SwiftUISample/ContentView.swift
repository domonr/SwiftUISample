//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Domon on 2022/03/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!\nHello, world!")
            .fontWeight(.heavy)
            .foregroundColor(.yellow)
            .frame(width: nil)
            .background(.red)
            .lineLimit(nil)
            .lineLimit(1)
            .border(.yellow, width: 10)
            .cornerRadius(200)
            .padding()
        Text("gghyyhgghyyhgghyyhgghyy")
            .hiraginoW6(30)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

extension Text {
    
    func hiraginoW6(_ size: CGFloat) -> some View {
        let ctFont = CTFontCreateWithName("HiraginoSans-W6" as CFString, size, nil)
        let descent = CTFontGetDescent(ctFont)
        return self.font(.init(ctFont))
        .baselineOffset(descent)
        .offset(y: descent / 2)
    }
}
