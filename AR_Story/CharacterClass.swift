//
//  CharacterClass.swift
//  AR_Story
//
//  Created by Eduardo Quintero on 2/4/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit
import SceneKit
 
class FoxCharacter {
    let idleAnimation = loadAnimation(fromSceneNamed: "art.scnassets/character/max_idle.scn")
              
    let walkAnimation = loadAnimation(fromSceneNamed: "art.scnassets/character/max_walk.scn")
    
    var node = SCNScene(named: "art.scnassets/character/max.scn")?.rootNode.childNodes[0]
    
}



//----------Animations----------
 func loadAnimation(fromSceneNamed sceneName: String) -> SCNAnimationPlayer {
    let scene = SCNScene( named: sceneName )!
    // find top level animation
    var animationPlayer: SCNAnimationPlayer! = nil
    scene.rootNode.enumerateChildNodes { (child, stop) in
        if !child.animationKeys.isEmpty {
            animationPlayer = child.animationPlayer(forKey: child.animationKeys[0])
            stop.pointee = true
        }
    }
    return animationPlayer
}
