//
//  RecipeClass.swift
//  SwiftSoupDemo
//
//  Created by 최은성 on 2022/08/19.
//

import Foundation
import SwiftSoup

class RecipeClass: ObservableObject {
    let url = URL(string: "https://www.serveq.co.kr/recipe/BAK/recipe_view?R_IDX=1417&PAGESIZE=12&SORTCOL=&SORTDIR=&SEL_R_CATE_CODE=BAK001&SEARCH_COL=&SEARCH_KEYWORD=")
    @Published var recipeTitles: [String] = []
    @Published var recipeContents: [[String]] = []
    
    // MARK: - 제목 가져오기
    func fetchTitle() {
        if let url = url {
            do {
                let webString = try String(contentsOf: url)
                let document = try SwiftSoup.parse(webString)
                
                var titles = try document.getElementById("make")?.select("h4").array()
                for title in titles! {
                    let t = try title.select("h4").first()?.text()
                    recipeTitles.append(t!)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    // MARK: - 내용 가져오기
    func fetchContent() {
        if let url = url {
            do {
                let webString = try String(contentsOf: url)
                let document = try SwiftSoup.parse(webString)
                
                var contents = try document.getElementById("make")?.select("div").select("ol").array()
                for content in contents! {
                    let c = try content.select("li").array()
                    var arr: [String] = []
                    for j in c {
                        arr.append(try j.text())
//                        recipeContents.append(try j.text())
                        print(j)
                    }
                    recipeContents.append(arr)
                }
            } catch let error {
                print(error)
            }
        }
    }
}
