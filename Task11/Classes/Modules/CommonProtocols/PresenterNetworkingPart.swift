//
//  Presentor-NetworkingPart.swift
//  Task11
//
//  Created by Tom on 01.11.2021.
//

import Foundation

protocol PresenterNetworkingProtocol {
    var tableLimit: Int {get set}
    func showError(withError error: Error)
    func saveAndReloadModels(withModels models: [TableModel])
    func getCertainIDModel(withID id: String) 
}


