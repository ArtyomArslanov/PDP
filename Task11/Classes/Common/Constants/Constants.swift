//
//  Images.swift
//  Task11
//
//  Created by Tom on 22.10.2021.
//

import Foundation
import UIKit

struct Images{
    //MARK: - Tab bar items images
    //when setting image into button need to set the tintColor property
    static let rocketsItemImage: UIImage = {
        let image = UIImage(named: "RocketsImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        return tintedImage
    }()
    static let rocketsItemImageSelected: UIImage = {
        let image = UIImage(named: "RocketsImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        return tintedImage.withTintColor(UIColor.orange)
    }()
    
    static let launchesItemImage: UIImage = {
        let image = UIImage(named: "LaunchesImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        return tintedImage
    }()
    static let launchesItemImageSelected: UIImage = {
        let image = UIImage(named: "LaunchesImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        return tintedImage.withTintColor(UIColor.orange)
    }()
    static let launchesCheckmarkTrue: UIImage = {
        let image = UIImage(named: "checkmarkTrue")!
        return image
    }()
    static let launchesCheckmarkFalse: UIImage = {
        let image = UIImage(named: "checkmarkFalse")!
        return image
    }()
    static let launchesPlaceholderImage: UIImage = {
        let image = UIImage(named: "launchPlaceholderImage")!
        return image
    }()
    static let launchepadsItemImage: UIImage = {
        let image = UIImage(named: "LaunchpadsImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        
        return tintedImage
    }()
    static let launchepadsItemImageSelected: UIImage = {
        let image = UIImage(named: "LaunchpadsImage")!
        let tintedImage = image.withRenderingMode(.alwaysOriginal)
        
        return tintedImage.withTintColor(.orange)
    }()
    static let rocketPlaceHolderImage: UIImage = {
        let image = UIImage(named: "RocketImage")!
        return image
    }()
    
}
struct ErrorData{
    static let errorRocketImageData: Data = {
        let image = UIImage(named: "RocketImage")!
        let data = image.pngData()!
        return data
    }()
}

struct Colors{
    static let blueBackgroundColor = UIColor(named: "BlueBackgroundColor")!
    static let tabBarItemTintColor = UIColor(named: "TabBarItemTitleColor")!
    static let blueLabelColor = UIColor(named: "BlueLabelColor")!
}
