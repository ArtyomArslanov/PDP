//
//  Interactor-NetworkingProtocol.swift
//  Task11
//
//  Created by Tom on 01.11.2021.
//

import Foundation

protocol InteractorNetworkingProtocol{

    var tableDataManager:TableModelsForDecodedDataManagerProtocol! {get set}
    var tableDataPath: String {get set}
    var networkManager:NetworkManagerProtocol! {get set}
    
    func getTableModels(limit: Int, offset: Int)
    func downloadImage(withUrl url: URL?, completion: @escaping (Result<Data, Error>) -> ())
}




