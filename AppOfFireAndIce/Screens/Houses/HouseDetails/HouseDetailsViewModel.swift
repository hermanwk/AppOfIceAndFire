//
//  HouseDetailsViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import Foundation

extension HouseDetailsView {
    class ViewModel {
        var theme: AppTheme
        var title: String
        var model: GoTHouseDto?
        var url: String
        var isLoading: Bool
        var apiService: FireAndServiceService
        
        init(title: String = "Book Details", house: GoTHouseDto) {
            theme = AppTheme.preview
            self.title = title
            self.model = house
            self.url = ""
            self.isLoading = false
            apiService = FireAndServiceService()
        }
        
        init(title: String = "Book Details", url: String) {
            theme = AppTheme.preview
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndServiceService()
            getHouseDetails()
        }
        
        func getHouseDetails() {
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            self.isLoading = true
            do {
                let request = try apiService.urlRequest(url: URL(string: url)!)
                apiService.call(urlRequest: request) { (house: GoTHouseDto, _: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = house
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
