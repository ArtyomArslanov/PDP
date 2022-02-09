//
//  View.swift
//  Task11
//
//  Created by Tom on 22.10.2021.
//

import Foundation
import UIKit

protocol RocketsPresenterToView: AnyObject{
    var view: RocketsViewToPresenter! {get set}
    var tableModels: [TableModel] {get set}
    func viewDidLoad()
    func downloadImage(withUrl url: URL, completion: @escaping((Result<Data,Error>) -> ()))
}


class RocketsView: CommonNavVC, RocketsViewToPresenter{
    //MARK: - Properties
    var presenter: RocketsPresenterToView!
    var tableView: UITableView = UITableView(frame: .zero)
    
    //MARK: - Overriden funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        configureTable()
        
        presenter.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        addTableSubview()
        setTableConstraints()
    }
    
    
    //MARK: - Public funcs
    func reloadTable(){
        tableView.reloadData()
    }
    
    func showErrorView(alertVC: UIAlertController){
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func setTabBarItem(){
        self.tabBarItem = UITabBarItem(title: nil, image: Images.rocketsItemImage, selectedImage: Images.rocketsItemImageSelected)
        self.tabBarItem.title = "Rockets"
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.tabBarItemTintColor], for: .normal)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
    }
   
    
    
    
    //MARK: - Private funcs
    private func setDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func configureTable(){
        tableView.register(RocketCell.self, forCellReuseIdentifier: "RocketCell")
        tableView.backgroundColor = self.view.backgroundColor
        
    }
    private func addTableSubview(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
    }
    private func setTableConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 18),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -30)
        ])

    }
}

//MARK: - Extension: UITableViewDataSource
extension RocketsView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rocketCell = tableView.dequeueReusableCell(withIdentifier: "RocketCell") as! RocketCell
        guard let model = presenter.tableModels[indexPath.row] as? RocketTableEntity else {return UITableViewCell()}
        rocketCell.configureCell()
        //rocketCell.backgroundColor = UIColor.clear
        rocketCell.rocketNameLabel.text =  model.name
        rocketCell.firstLaunchLabelInfo.text = model.firstLaunch
        rocketCell.launchCostLabelInfo.text = model.launchCost
        rocketCell.successLabelInfo.text = model.success
        
        presenter.downloadImage(withUrl: model.mainImageUrl, completion: { (result) in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    rocketCell.rocketImageView.image = UIImage(data: data)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    rocketCell.rocketImageView.image = Images.rocketPlaceHolderImage
                }
            }
        })
        return rocketCell
    }
}

//MARK: - Extension: UITableViewDataSource
extension RocketsView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.lightGray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            cell?.setSelected(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(cell.isSelected)
    }
}

