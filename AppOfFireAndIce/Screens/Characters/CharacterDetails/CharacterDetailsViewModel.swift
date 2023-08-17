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
        var apiService: FireAndServiceService
        
        init(title: String = "Character Details", character: GoTCharacterDto) {
            self.title = title
            self.model = character
            self.url = ""
            self.isLoading = false
            apiService = FireAndServiceService()
        }
        
        init(title: String = "Character Details", url: String) {
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndServiceService()
            if (!self.url.isEmpty) {
                getCharacterDetails()
            }
        }
        
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
                // TODO: Handle error
            }
        }
    }
}
