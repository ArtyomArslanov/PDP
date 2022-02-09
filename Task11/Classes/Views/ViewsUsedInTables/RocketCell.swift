//
//  RocketCell.swift
//  Task11
//
//  Created by Tom on 25.10.2021.
//

import UIKit

class RocketCell: UITableViewCell {

    var rocketImageView: UIImageView = UIImageView(frame: .zero)
    var rocketNameLabel: UILabel = LargeBoldLabel(frame: .zero)
    
    var firstLaunchLabel: UILabel = LittleBoldLabel(text: "First launch")
    var firstLaunchLabelInfo: UILabel = InfoLabel(frame: .zero)
    var firstLaunchStackView: UIStackView!
    
    var launchCostLabel: UILabel = LittleBoldLabel(text: "Launch cost")
    var launchCostLabelInfo: UILabel = InfoLabel(frame: .zero)
    var launchCostStackView: UIStackView!
    
    var successLabel: UILabel = LittleBoldLabel(text: "Success")
    var successLabelInfo: UILabel = InfoLabel(frame: .zero)
    var successStackView: UIStackView!
    
    var labelsStackView: UIStackView!
    
    var spacedCellContentFrame: CGRect!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = UIColor.white
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if(highlighted){
            contentView.backgroundColor = UIColor.lightGray
        }else{
            contentView.backgroundColor = UIColor.white
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (spacedCellContentFrame != nil){
            contentView.frame = spacedCellContentFrame
        }else {
            spacedCellContentFrame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0))
            contentView.frame = spacedCellContentFrame
        }
        
    }
    
    
    
    //MARK: - Public funcs
    func configureCell(){
        createImageView()
        createStackViews()
        prepareElementsForAutolayout()
        setPropertiesOfCell()
        setConstraints()
    }
    
    
    //MARK: - Private funcs
    private func createImageView(){
        
        rocketImageView.contentMode = .scaleToFill
        rocketImageView.clipsToBounds = true
        
    }

    private func createStackViews(){
        firstLaunchStackView = UIStackView(arrangedSubviews: [firstLaunchLabel, firstLaunchLabelInfo])
        firstLaunchStackView.axis = .vertical
        
        launchCostStackView = UIStackView(arrangedSubviews: [launchCostLabel, launchCostLabelInfo])
        launchCostStackView.axis = .vertical
        
        successStackView = UIStackView(arrangedSubviews: [successLabel, successLabelInfo])
        successStackView.axis = .vertical
        
        labelsStackView = UIStackView(arrangedSubviews: [firstLaunchStackView, launchCostStackView, successStackView])
        labelsStackView.axis = .horizontal
        labelsStackView.distribution = .equalSpacing
        labelsStackView.alignment = .center
    }
    
    private func prepareElementsForAutolayout(){
        [labelsStackView, rocketImageView, rocketNameLabel].forEach({ (view) in
            guard let view = view else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        })
    }
    
    private func setPropertiesOfCell(){
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor.white
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear // if not set, then corners will stay white
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
           rocketImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.27),
            
            rocketNameLabel.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: 10),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rocketNameLabel.heightAnchor.constraint(equalToConstant: rocketNameLabel.font.pointSize),
            rocketNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
           
            labelsStackView.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant:15),
           
            labelsStackView.leadingAnchor.constraint(equalTo: rocketNameLabel.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -self.contentView.frame.width * 0.05),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            labelsStackView.heightAnchor.constraint(equalToConstant: launchCostLabel.font.pointSize + launchCostLabelInfo.font.pointSize)
        ])
        
    }
}
