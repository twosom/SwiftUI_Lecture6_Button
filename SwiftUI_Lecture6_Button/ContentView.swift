//
//  ContentView.swift
//  SwiftUI_Lecture6_Button
//
//  Created by Desire L on 2021/09/20.
//
//

import SwiftUI

// Button
// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값
struct ContentView: View {

    @State
    private var didSelected: Bool = false

    var toggleButtonImage: some View {
        if didSelected {
            return Image(systemName: "sun.haze.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.orange)
                    .shadow(color: .gray, radius: 4, x: 10, y: 15)
        } else {
            return Image(systemName: "cloud.sun.rain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .shadow(color: .gray, radius: 4, x: 10, y: 15)
        }
    }


    var body: some View {
        VStack {
            Button(action: {
                didSelected.toggle()
            }, label: {
                HStack {
                    toggleButtonImage
                    VStack {
                        Text("Button")
                                .foregroundColor(.black)
                        if (didSelected) {
                            Text(" \(didSelected.description)")
                                    .foregroundColor(.blue)
                        } else {
                            Text(" \(didSelected.description)")
                                    .foregroundColor(.gray)
                        }
                    }
                }
            })
                    .frame(width: 200, height: 200)


            Text("current Status : \(didSelected.description)")
        }
                .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }


    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}
