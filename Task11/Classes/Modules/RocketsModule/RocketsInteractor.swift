//
//  Interactor.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol RocketsPresenterToInteractor: AnyObject, PresenterNetworkingProtocol{
    var interactor: RocketsInteractorToPresenter! {get set}
    func showError(withError: Error)
    func saveAndReloadModels(withModels models: [TableModel])
    func pushScreenWithModel(screenModelToShow: ScreenModel)
}


class RocketsInteractor: RocketsInteractorToPresenter, InteractorNetworkingProtocol{

    var presenter: RocketsPresenterToInteractor!

    var networkManager: NetworkManagerProtocol!
    var tableDataManager: TableModelsForDecodedDataManagerProtocol!
    var screenDataManager: ScreenModelsForDecodedDataManagerProtocol!
        
    var tableDataPath = "/v4/rockets/query"
    var allRocketsPath = "/v4/rockets"
    
    
    //func getCertainModel
    func getTableModels(limit: Int, offset: Int){
        var modelsToReturn: [RocketTableEntity] = []
        
            self.networkManager.getTableJSONModel(path: self.tableDataPath, limit: limit, offset: offset) { [weak self] (result) in
                guard let self = self else {return}
                switch result{
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.presenter.showError(withError: error)
                    }
                case .success(let jsonModelData):
                    do {
                        let rocketJSONModel = try JSONDecoder().decode(RocketsJSON.self, from: jsonModelData)
                        let models = try self.tableDataManager.getTableModelsForDecodedModel(decodedModel: rocketJSONModel, typeOfTable: .Rockets) as! [RocketTableEntity]
                        modelsToReturn = models
                        
                    }catch(let error){
                        DispatchQueue.main.async {
                            print(error)
                            self.presenter.showError(withError: error)
                        }
                    }
                
                DispatchQueue.main.async {
                    self.presenter.saveAndReloadModels(withModels: modelsToReturn)
                }
            }
        }
        
    }
    func downloadImage(withUrl url: URL?, completion: @escaping (Result<Data, Error>) -> ()) {
        
        networkManager.donwloadImage(withUrl: url!, completion: completion)
    
    }
    func getScreenModelWithID(id: String){
        var screenModelToShow: ScreenModel!
        networkManager.getCertainJSONModelWithID(withPath: allRocketsPath, id: id) { (result) in
            switch result{
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                    self.presenter.showError(withError: error)
                }
            case .success(let data):
                do{
                    //print(String(data: jsonModelData, encoding: .utf8)!)
                    let oneRocketJSON = try JSONDecoder().decode(OneRocketJSON.self, from: data)
                    let screenModel = try self.screenDataManager.getScreenModelFrom(decodedModel: oneRocketJSON, typeofScreen: .Rocket)
                    screenModelToShow = screenModel
                }catch(let error){
                    DispatchQueue.main.async {
                        print(error)
                        self.presenter.showError(withError: error)
                    }
                }
            }
        }
        if let screenModelToShow = screenModelToShow{
            DispatchQueue.main.async {
                self.presenter.pushScreenWithModel(screenModelToShow: screenModelToShow)
            }
        }
        
    }
}

