//
//  NewsTabView.swift
//  Apple News
//
//  Created by Milan Dutta on 11/12/22.
//
import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(articleNewsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadTask() async {
        await articleNewsVM.loadArticles()
    }
    
   
    private func refreshTask() {
        DispatchQueue.main.async {
            articleNewsVM.fetchTaskToken = FetchTaskToken(category: articleNewsVM.fetchTaskToken.category, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "fiberchannel")
                .imageScale(.large)
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
            
    }
}
