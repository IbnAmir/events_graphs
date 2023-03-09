//
//  ContentView.swift
//  Events Graphs Watch App
//
//  Created by Omar Amir on 09/03/2023.
//

import SwiftUI
import Charts


struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        VStack {
            Chart {
                BarMark(
                    x: .value("Shape Type", "Cube"),
                    y: .value("Total Count", 5)
                )
                BarMark(
                    x: .value("Shape Type", "Sphere"),
                    y: .value("Total Count", 6)
                )
                BarMark(
                    x: .value("Shape Type", "Pyramid"),
                    y: .value("Total Count", 4)
                )
                BarMark(
                    x: .value("Shape Type", "1"),
                    y: .value("Total Count", 10)
                )
                BarMark(
                    x: .value("Shape Type", "2"),
                    y: .value("Total Count", 4)
                )
                BarMark(
                    x: .value("Shape Type", "3"),
                    y: .value("Total Count", 20)
                )
                BarMark(
                    x: .value("Shape Type", "4"),
                    y: .value("Total Count", 4)
                )
            }.environment(\.locale, Locale(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)
            Text("الاجمالي: ٣٠٠")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
