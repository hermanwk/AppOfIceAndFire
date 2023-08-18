//
//  HouseDetailsViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import Foundation

extension HouseDetailsView {
    class ViewModel {
        var title: String
        var model: GoTHouseDto?
        var url: String
        var isLoading: Bool
        var apiService: FireAndServiceService
        
        /// HouseDetailsView.ViewModel initializer when a `GoTHouseDto` object is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - book: The data model which contains the details of the currently displayed house
        init(title: String = "Book Details", house: GoTHouseDto) {
            self.title = title
            self.model = house
            self.url = ""
            self.isLoading = false
            apiService = FireAndServiceService()
        }
        
        /// HouseDetailsView.ViewModel initializer when a url pointing to the specific house is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - url: A url that can be used to get detailed information of a specific house
        init(title: String = "Book Details", url: String) {
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndServiceService()
            getHouseDetails()
        }
        
        /// Makes a GET call to get detailed information of a specific character
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
            }
        }
    }
}
