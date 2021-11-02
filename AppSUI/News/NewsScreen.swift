////  NewsScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 14.07.2021.
//  
//

import SwiftUI

struct NewsScreen: View {
    @ObservedObject var viewModel: NewsViewModel = .init()
    
    init() {
        self.viewModel.load()
    }
                    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Weather News", selection: self.$viewModel.city) {
                    ForEach(NewsViewModel.City.allCases) { (city) in
                        Text(city.title).tag(city)
                    }
                }
                .onChange(of: self.viewModel.city, perform: { (city) in
                    self.viewModel.load()
                })
                .pickerStyle(SegmentedPickerStyle())
                
                List(self.viewModel.articles) { item in
                    self.listCell(article: item)
                }
            }
            .navigationTitle("Weather News")
        }
    }
}

extension NewsScreen {
    func listCell(article: Article) -> some View {
        VStack(alignment: .leading) {
            Text(article.title)
            
            if self.viewModel.isLoading && self.viewModel.articles.isLast(article) {
                Divider()
                Text("Loading...")
                    .padding(.vertical)
            }
        }.onAppear() {
            if self.viewModel.articles.isLast(article) {
                self.viewModel.load()
            }
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
