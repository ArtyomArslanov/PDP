//
//  LargeLabel.swift
//  Task11
//
//  Created by Tom on 25.10.2021.
//

import UIKit

class CustomLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureProperties()
    }
    convenience init(text: String){
        self.init(frame: .zero)
        self.text = text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureProperties(){}
}

class LargeBoldLabel: CustomLabel {
   
    override func configureProperties(){
        self.font = UIFont(name: "Roboto-Bold", size: 24)
        self.textColor = UIColor.black
    }
}

class MediumBoldLabel: CustomLabel {
    
    override func configureProperties(){
        self.font = UIFont(name: "Roboto-Medium", size: 17)
        self.textColor = UIColor.black
        self.textAlignment = .center
    }
}

class LittleBoldLabel: CustomLabel {
    
    
    override func configureProperties(){
        self.font = UIFont(name: "Roboto-Bold", size: 14)
        self.textColor = UIColor.black
    }
}


class InfoLabel: CustomLabel {
    
    override func configureProperties(){
        self.font = UIFont(name: "Roboto-Bold", size: 14)
        self.textColor = UIColor.gray
    }
}

class BlueLabel: CustomLabel {
    
    override func configureProperties(){
        self.font = UIFont(name: "Roboto-Medium", size: 17)
        self.textColor = Colors.blueLabelColor
    }
}

