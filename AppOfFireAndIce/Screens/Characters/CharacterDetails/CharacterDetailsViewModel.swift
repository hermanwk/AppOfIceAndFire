//
//  CharacterDetailsViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation

extension CharacterDetailsView {
    class ViewModel {
        var title: String
        var model: GoTCharacterDto?
        var url: String
        var isLoading: Bool
        var apiService: FireAndIceService
        
        /// CharacterDetailsView.ViewModel initializer when a `GoTCharacterDto` object is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - book: The data model which contains the details of the currently displayed character
        init(isMocked: Bool = false, title: String = "Character Details", character: GoTCharacterDto) {
            self.title = title
            self.model = character
            self.url = ""
            self.isLoading = false
            apiService = FireAndIceService(isMocked: isMocked)
        }
        
        /// CharacterDetailsView.ViewModel initializer when a url pointing to the specific character is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - url: A url that can be used to get detailed information of a specific character
        init(isMocked: Bool = false, title: String = "Character Details", url: String) {
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndIceService(isMocked: isMocked)
            if (!self.url.isEmpty) {
                getCharacterDetails()
            }
        }
        
        /// Makes a GET call to get detailed information of a specific character
        func getCharacterDetails() {
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            self.isLoading = true
            do {
                let request = try apiService.urlRequest(url: URL(string: url)!)
                apiService.call(urlRequest: request) { (character: GoTCharacterDto, _: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = character
                        self.isLoading = false
                        dispatchGroup.leave()
                    }
                }
            } catch {
                self.isLoading = false
                dispatchGroup.leave()
            }
        }
    }
}
