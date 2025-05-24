//
//  ContentView.swift
//  Recipes
//
//  Created by Tak Mazarura on 21/05/2025.
//

import RecipesFeature
import SwiftUI

struct RecipeFeedView: View {
    @StateObject var recipeFeedViewModel: RecipeFeedViewModel
    
    var body: some View {
        contentView
            .navigationTitle(recipeFeedViewModel.title)
            .task {
                loadFeed()
            }
    }
}

// MARK: - Core Views
extension RecipeFeedView {
    @ViewBuilder
    private var contentView: some View {
        VStack {
            if recipeFeedViewModel.isLoading {
                progressView
            } else if let errorMessage = recipeFeedViewModel.errorMessage {
                errorView(withMessage: errorMessage)
            } else {
                listView
            }
        }
    }
}

// MARK: - Supporting Views
extension RecipeFeedView {
    private var progressView: some View {
        LoadingView(message: "Loading Recipes...")
    }
    
    private func errorView(withMessage errorMessage: String) -> some View {
        ErrorView(message: errorMessage) {
            loadFeed()
        }
        .padding()
    }
    
    private var listView: some View {
        List(recipeFeedViewModel.recipePresentationModels) { presentationModel in
            RecipeItemView(model: presentationModel)
                .listRowSeparator(.hidden)
                .padding(.vertical, 8)
        }
        .listStyle(.plain)
    }
}


// MARK: - Load Feed
extension RecipeFeedView {
    private func loadFeed() {
        Task {
            await recipeFeedViewModel.loadFeed()
        }
    }
}
