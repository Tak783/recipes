//
//  ContentView.swift
//  Recipes
//
//  Created by Tak Mazarura on 21/05/2025.
//

import RecipesFeature
import SwiftUI

struct RecipeItemView: View {
    let model: RecipePresentationModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            imageView
            headlineView
            titleView
        }
    }
}

// MARK: - SubViews
private extension RecipeItemView {
    @ViewBuilder
    var imageView: some View {
        if let imageURL = model.imageURL {
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.2)
                        .frame(height: 180)
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                case .failure:
                    Color.gray
                        .frame(height: 180)
                        .overlay(Image(systemName: "photo"))
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    var headlineView: some View {
        if let headline = model.headline {
            Text(headline)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }

    var titleView: some View {
        Text(model.title ?? String.empty)
            .font(.headline)
            .foregroundColor(.primary)
    }
}
