//
//  WelcomeView.swift
//  RecipesClient
//
//  Created by Tak Mazarura on 22/05/2025.
//

import SwiftUI

struct LaunchView: View {
    @StateObject var coordinator: LaunchCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            contentView
                .navigationDestination(
                    for: LaunchCoordinator.NavigationDestination.self
                ) { destination in
                    LaunchRouter.navigateToDestination(destination)
                }
        }
    }
}

// MARK: - Core Views
extension LaunchView {
    private var contentView: some View {
        ZStack {
            backgroundView
            mainView
        }
    }
    
    private var backgroundView: some View {
        Color(uiColor: .systemBackground)
            .ignoresSafeArea()
    }
    
    private var mainView: some View {
        VStack(spacing: 12) {
            Spacer()
            welcomeTextSection
            Spacer()
            getStartedButton
        }
        .padding()
    }
}

// MARK: - Supporting Views
extension LaunchView {
    private var welcomeTextSection: some View {
        VStack(spacing: 12) {
            Text("Welcome to!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(uiColor: .label))
            
            Text("Recipes")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(uiColor: .label))
            
            Text("Eating healthily\nmade easy")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(uiColor: .label))
                .padding(.top, 8)
        }
    }
    
    private var getStartedButton: some View {
        Button(action: {
            coordinator.navigateToRecipeFeed()
        }) {
            HStack {
                Text("Get Started")
                Image(systemName: "arrow.right")
            }
            .fontWeight(.bold)
            .foregroundColor(Color(uiColor: .systemBackground))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(uiColor: .label))
            .cornerRadius(30)
        }
        .padding(.horizontal, 32)
    }
}
