//
//  ViewController.swift
//  DynamicPartialView
//
//  Created by Mateus Leichsenring on 16.08.18.
//  Copyright © 2018 Mateus Leichsenring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var mainEmbedViewController: MainEmbedViewController = {
        return subViewManager.instantiateViewController(identifier: "MainEmbedViewController") as! MainEmbedViewController
    }()
    private lazy var oneEmbedViewController: OneEmbedViewController = {
        return subViewManager.instantiateViewController(identifier: "OneEmbedViewController") as! OneEmbedViewController
    }()
    private lazy var twoEmbedViewController: TwoEmbedViewController = {
        return subViewManager.instantiateViewController(identifier: "TwoEmbedViewController") as! TwoEmbedViewController
    }()
    private lazy var threeEmbedViewController: ThreeEmbedViewController = {
        return subViewManager.instantiateViewController(identifier: "ThreeEmbedViewController") as! ThreeEmbedViewController
    }()
    var currentIndex:Int = 1
    var subViewManager:SubViewManager!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subViewManager = SubViewManager(storyboardName: "PartialViews", parentView: containerView, parentViewController: self)
        subViewManager.updateView(nextViewController: mainEmbedViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextTapped(_ sender: Any) {
        updateView(currentIndex, parentView: containerView)
        currentIndex += 1
        if currentIndex == 4 {
            currentIndex = 0
        }
    }
    
    private func updateView(_ index:Int, parentView:UIView) {
        switch index {
        case 0:
            subViewManager.updateView(nextViewController: mainEmbedViewController)
        case 1:
            subViewManager.updateView(nextViewController: oneEmbedViewController)
        case 2:
            subViewManager.updateView(nextViewController: twoEmbedViewController)
        case 3:
            subViewManager.updateView(nextViewController: threeEmbedViewController)
        default:
            return
        }
    }
}
