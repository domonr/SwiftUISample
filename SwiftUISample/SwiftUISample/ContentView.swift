//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Domon on 2022/03/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
    
    var body: some View {
        ZStack {
            Color.yellow
            ScrollView {
                HStack(alignment: .top, spacing: 10) {
                    LazyVStack {
                        ForEach(data, id: \.self) { d in
                            Text(d).onAppear {
                                print(d + ": onAppear")
                            }.onDisappear {
                                print(d + ": onDisappear")
                            }
                        }.padding()
                    }
                    VStack {
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
                        Button("Hello") {
                            self.data.append("Hello")
                        }.padding()
                        Button(action: {
                            self.data.append("★")
                        }, label: {
                            Image(systemName: "star.fill")
                        }).padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ContentView()
            ContentView2()
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

struct HeaderView: View {
    @State var viewData: DemoViewData
    
    var body: some View {
        VStack {
            Spacer()
            Text("ID: \(viewData.id)")
        }
    }
}

struct DemoViewData {
    var id: Int
}

struct ContentView2: View {
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                }
            }.font(.largeTitle)
        }
    }
}
