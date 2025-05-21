//
//  RemoteRecipesFeedServiceTestSpec.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

protocol RemoteRecipesFeedServiceTestSpec: RecipieFeedTestAuthenticationTestable  {
    func load_onSuccessWithNon200Code_returnsError() async throws
    func load_onSuccessWithInvalidData_returnsInvalidDataError() async throws
    func load_onValidResponse_returnsRecipes() async throws
}
