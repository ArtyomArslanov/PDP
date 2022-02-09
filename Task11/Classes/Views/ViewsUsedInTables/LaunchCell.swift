//
//  RocketCell.swift
//  Task11
//
//  Created by Tom on 25.10.2021.
//

import UIKit

class LaunchCell: UITableViewCell {

    var largeName = LargeBoldLabel(frame: .zero)
    var dateLabel = MediumBoldLabel(frame: .zero)
        
    var patchShadowView = UIView(frame: .zero)
    var patchImageView = UIImageView(frame: .zero)
    
   
    var checkmarkImageView = UIImageView(frame: .zero)
    var numberLabel = BlueLabel(frame: .zero)
    
    var spacedCellContentFrame: CGRect!
    
    
    //MARK: - Overriden methods
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
    
    override func prepareForReuse() {
        self.patchImageView.image = nil
    }

    
    //MARK: - Public funcs
    func configureCell(){
       
        setPatchShadowView()
        setPatchViewInsideShadowView()
        prepareElementsForAutolayout()
        setPropertiesOfCell()
        setConstraints()
    }
    func setCheckmarkImage(image: UIImage){
        self.checkmarkImageView.image = image
        checkmarkImageView.contentMode = .scaleAspectFill
    }
    func setNumberlabel(text: String){
        self.numberLabel.text = text
        
    }
    func setPatchImage(image: UIImage){
        self.patchImageView.image = image
        
    }
    
    
    //MARK: - Private funcs
    
    private func setPatchShadowView(){
        patchShadowView.addSubview(patchImageView)
        
        patchShadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        patchShadowView.layer.shadowRadius = 5
        patchShadowView.layer.shadowColor = UIColor.black.cgColor
        patchShadowView.layer.cornerRadius = 20
        
        
    }
    
    private func setPatchViewInsideShadowView(){
        patchImageView.translatesAutoresizingMaskIntoConstraints = false
        patchShadowView.addSubview(patchImageView)
        patchImageView.contentMode = .scaleAspectFit
        patchImageView.clipsToBounds = true
    }

    private func prepareElementsForAutolayout(){
        [largeName, patchShadowView, dateLabel, checkmarkImageView, numberLabel].forEach({ (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
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
            
            //large name
            largeName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            largeName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            largeName.trailingAnchor.constraint(equalTo: patchShadowView.leadingAnchor, constant: -10),
            largeName.heightAnchor.constraint(equalToConstant: largeName.font.pointSize),
            
            //date Label
            dateLabel.topAnchor.constraint(equalTo: largeName.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: largeName.leadingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: dateLabel.font.pointSize),
            
            //patchView
            patchShadowView.topAnchor.constraint(equalTo: largeName.topAnchor),
            patchShadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            patchShadowView.bottomAnchor.constraint(equalTo: checkmarkImageView.bottomAnchor),
            patchShadowView.widthAnchor.constraint(equalTo: patchShadowView.heightAnchor),
            
            //patchImageView inside shadowView
            patchImageView.leadingAnchor.constraint(equalTo: patchShadowView.leadingAnchor, constant: 9.5),
            patchImageView.trailingAnchor.constraint(equalTo: patchShadowView.trailingAnchor, constant: -9.5),
            patchImageView.topAnchor.constraint(equalTo: patchShadowView.topAnchor, constant: 9.5),
            patchImageView.bottomAnchor.constraint(equalTo: patchShadowView.bottomAnchor, constant: -9.5),
            
            //checkmark
            checkmarkImageView.leadingAnchor.constraint(equalTo: largeName.leadingAnchor),
            checkmarkImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            checkmarkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -23),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 30),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 30),
           //numberLabel
            numberLabel.centerYAnchor.constraint(equalTo: checkmarkImageView.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: checkmarkImageView.trailingAnchor, constant: 15),
            
        ])
        
    }
}
