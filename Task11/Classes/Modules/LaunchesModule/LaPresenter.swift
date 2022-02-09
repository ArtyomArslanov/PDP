//
//  Presenter.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit

protocol LaInteractorToPresenter: InteractorNetworkingProtocol{
    var presenter: LaPresenterToInteractor! {get set}
    func getTableModels(limit: Int, offset: Int)
    func downloadImage(withUrl url: URL?, completion: @escaping (Result<Data, Error>) -> ())
    func getScreenModelWithID(id: String)
}
protocol LaRouterToPresenter{
    var presenter: LaPresenterToRout? {get set}
}
protocol LaViewToPresenter {
    var presenter: LaPresenterToView! {get set}
    func showErrorView(alertVC: UIAlertController)
    func reloadTable()
}


class LaPresenter: NSObject, LaPresenterToRout, LaPresenterToView, LaPresenterToInteractor, PresenterNetworkingProtocol {
    
    var interactor: LaInteractorToPresenter!
    var rout: LaRouterToPresenter!
    var view: LaViewToPresenter!
    
    var tableLimit: Int = 10
    var tableModels: [TableModel] = []
    
    init(rout: LaRouterToPresenter, view: LaViewToPresenter, interactor: LaInteractorToPresenter) {
        self.view = view
        self.rout = rout
        self.interactor = interactor
    }
    
    func viewDidLoad() {
         interactor.getTableModels(limit: tableLimit, offset: tableModels.count)
    }
    
    
    func showError(withError error: Error){
        let errorVC = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        errorVC.addAction(cancelAction)
        view?.showErrorView(alertVC: errorVC)
    }
    
    func saveAndReloadModels(withModels models: [TableModel]) {
        self.tableModels.append(contentsOf: models)
        self.view.reloadTable()
    }
    
    func getCertainIDModel(withID id: String) {
        interactor.getScreenModelWithID(id: id)
    }
    
    //use here decorator pattern
    func pushScreenWithModel(screenModelToShow: ScreenModel) {
        guard let model = screenModelToShow as? LaunchScreenEntity else {return}
        //toDO: check if model has certain field and add views of that fields in View by RocketDetailViewDecorators
    }
    
    func downloadImage(withUrl url: URL?, completion: @escaping ((Result<Data, Error>) -> ())) {
        interactor.downloadImage(withUrl: url, completion: completion)
    }
    
}

