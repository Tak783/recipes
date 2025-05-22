//
//  ViewModelLoading.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 22/05/2025.
//

// TODO: - Move to a new pre presentation layer package so it can be re-used by other features

@MainActor
protocol ViewModelLoading: AnyObject {
    var isLoading: Bool { get set }
}

extension ViewModelLoading {
    func setIsLoadingStatus(_ isLoading: Bool = true) {
        self.isLoading = isLoading
    }
}
