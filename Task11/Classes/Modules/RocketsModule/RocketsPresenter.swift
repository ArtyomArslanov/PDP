//
//  Presenter.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit



protocol RocketsInteractorToPresenter: InteractorNetworkingProtocol{
    var presenter: RocketsPresenterToInteractor! {get set}
    func getTableModels(limit: Int, offset: Int)
    func downloadImage(withUrl url: URL?, completion: @escaping (Result<Data, Error>) -> ())
    func getScreenModelWithID(id: String)
}
protocol RocketsRouterToPresenter{
    var presenter: RocketsPresenterToRout? {get set}
    
}
protocol RocketsViewToPresenter {
    var presenter: RocketsPresenterToView! {get set}
    func showErrorView(alertVC: UIAlertController)
    func reloadTable()
}

class RocketsPresenter:NSObject, RocketsPresenterToRout, RocketsPresenterToView, RocketsPresenterToInteractor, PresenterNetworkingProtocol{
  
    var view: RocketsViewToPresenter!
    var interactor: RocketsInteractorToPresenter!
    var rout: RocketsRouterToPresenter?
    
    var tableModels: [TableModel] = []
    
    var tableLimit: Int = 5
    
    
    init(rout: RocketsRouterToPresenter, view: RocketsViewToPresenter, interactor: RocketsInteractorToPresenter) {
        self.view = view
        self.rout = rout
        self.interactor = interactor
    }
    
    
    //MARK: - Public funcs
    func viewDidLoad() {
         interactor.getTableModels(limit: tableLimit, offset: tableModels.count)
    }
    
    func saveAndReloadModels(withModels models: [TableModel]){
        self.tableModels.append(contentsOf:models)
        self.view.reloadTable()
    }
    
    func showError(withError error: Error){
        let errorVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        errorVC.addAction(cancelAction)
        view?.showErrorView(alertVC: errorVC)
    }
    func getCertainIDModel(withID id: String) {
        interactor.getScreenModelWithID(id: id)
    }
    
    //use here decorator pattern
    func pushScreenWithModel(screenModelToShow: ScreenModel) {
        guard let model = screenModelToShow as? RocketScreenEntity else {return}
        //toDO: check if model has certain field and add views of that fields in View by RocketDetailViewDecorators
    }
    
    func downloadImage(withUrl url: URL, completion: @escaping (Result<Data,Error>) ->() ){
        self.interactor.downloadImage(withUrl: url, completion: completion)
    }
    
}

