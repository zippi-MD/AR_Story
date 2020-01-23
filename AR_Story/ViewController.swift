//
//  ViewController.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 22/01/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController , ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    let idleAnimation = loadAnimation(fromSceneNamed: "art.scnassets/character/max_idle.scn")
           
    let walkAnimation = loadAnimation(fromSceneNamed: "art.scnassets/character/max_walk.scn")
    
    var batmanNode = SCNScene(named: "art.scnassets/obj/batman.scn")?.rootNode.childNodes[0]
    var foxNode =  SCNScene(named: "art.scnassets/character/max.scn")?.rootNode.childNodes[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
    }


    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          // Create a session configuration
          let configuration = ARImageTrackingConfiguration()
          if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "imageAR", bundle: Bundle.main){
              
              configuration.trackingImages = trackingImages
              configuration.maximumNumberOfTrackedImages = 2
              
              
          }

          // Run the view's session
          sceneView.session.run(configuration)
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          // Pause the view's session
          sceneView.session.pause()
      }
    
    
    
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
          
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor{
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.red.withAlphaComponent(0.8)
            plane.cornerRadius = 0.005
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            var temporalNode: SCNNode?
           
            if (imageAnchor.referenceImage.name == "libro 3"){
                foxNode?.scale = SCNVector3(0.2,0.2,0.2)
                foxNode?.addAnimationPlayer(idleAnimation, forKey: "idle")
                temporalNode = foxNode
                
                
            }else if (imageAnchor.referenceImage.name == "pikachu"){
           
                
              temporalNode = batmanNode
            }else{
                
            }
            
            if let character = temporalNode {
                node.addChildNode(character)
            }
            
            
        }
        
        
        
        return node
    }
    
      @objc
       func handleTap(_ gestureRecognize: UIGestureRecognizer) {
           // retrieve the SCNView
           let scnView = self.sceneView as! ARSCNView
           
           // check what nodes are tapped
           let p = gestureRecognize.location(in: scnView)
           let hitResults = scnView.hitTest(p, options: [:])
           // check that we clicked on at least one object
           if hitResults.count > 0 {
               // retrieved the first clicked object
               let result = hitResults[0]
              
               // get its material
               let material = result.node.geometry!.firstMaterial!
              
              if (result.node.name != nil){
                  if (result.node.name! == "Max"){
                  
                   
                      result.node.parent?.removeAllAnimations()
                      result.node.parent?.addAnimationPlayer(walkAnimation, forKey: "walk")
                      
                  }
                   
              }
               // highlight it
               SCNTransaction.begin()
               SCNTransaction.animationDuration = 0.5
               
               // on completion - unhighlight
              
               
               material.emission.contents = UIColor.blue
               
               SCNTransaction.commit()
            }
         }
    
    
    
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
