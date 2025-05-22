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

// MARK: - Helpers
extension RecipeFeedView {
    private func loadFeed() {
        recipeFeedViewModel.loadFeed()
    }
}

// MARK: - SubViews
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
    
    private var listView: some View {
        List(recipeFeedViewModel.recipePresentationModels) { presentationModel in
            RecipeItemView(model: presentationModel)
                .listRowSeparator(.hidden)
                .padding(.vertical, 8)
        }
        .listStyle(.plain)
    }
    
    private var progressView: some View {
        ProgressView("Loading Recipes...")
            .padding()
    }
    
    private func errorView(withMessage errorMessage: String) -> some View {
        VStack(spacing: 12) {
            Text(errorMessage)
                .foregroundColor(.red)
            Button("Retry") {
                loadFeed()
            }
        }
        .padding()
    }
}
