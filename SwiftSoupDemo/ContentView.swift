//
//  ContentView.swift
//  SwiftSoupDemo
//
//  Created by 최은성 on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = RecipeClass()
    var body: some View {
        ScrollView {
            Text("불러온 제목")
                .bold()
            ForEach(data.recipeTitles, id: \.self) { title in
                Text(title)
            }
            
            Spacer()
            
            Text("불러온 내용")
                .bold()
            ForEach(data.recipeContents, id: \.self) { recipeContent in
                
                ForEach(recipeContent, id: \.self) { content in
                    Text(content)
                }
            }
        }
        .onAppear {
            data.fetchTitle()
            data.fetchContent()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
