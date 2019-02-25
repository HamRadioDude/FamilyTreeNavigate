//
//  SwitchingViewController.swift
//  FamilyTreeNavigate
//
//  Created by student on 2/24/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit

private var dadViewController: DadViewController!
private var momViewController: MomViewController!
private var aaronViewController: AaronViewController!
private var colinViewController: ColinViewController!
private var seanViewController: SeanViewController!


class SwitchingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
            
            // Do any additional setup after loading the view.
            dadViewController = storyboard?.instantiateViewController(withIdentifier: "dad") as? DadViewController
            dadViewController.view.frame = view.frame
            switchViewController(from: nil, to: dadViewController) // helper method
       
            aaronViewController = storyboard?.instantiateViewController(withIdentifier: "aaron") as? AaronViewController
            momViewController = storyboard?.instantiateViewController(withIdentifier: "mom") as? MomViewController
            colinViewController = storyboard?.instantiateViewController(withIdentifier: "colin") as? ColinViewController
            seanViewController = storyboard?.instantiateViewController(withIdentifier: "sean") as? SeanViewController

            
            
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
            if dadViewController != nil && dadViewController!.view.superview == nil{
                dadViewController = nil
            }
            if momViewController!.view.superview == nil {
                momViewController = nil
            }
        }
        
        
        
        


    @IBAction func switchViews(sender: UIBarButtonItem){
        
        // Create the new view controller if required
        if dadViewController?.view.superview == nil {
            if dadViewController == nil {
                dadViewController = storyboard?.instantiateViewController(withIdentifier: "dad") as? DadViewController
            }
        } else if momViewController?.view.superview == nil {
            if momViewController == nil {
                momViewController = storyboard?.instantiateViewController(withIdentifier: "mom") as? MomViewController
            }
            // Aaron Next
        } else if aaronViewController?.view.superview == nil {
            if aaronViewController == nil {
                aaronViewController = storyboard?.instantiateViewController(withIdentifier: "aaron") as? AaronViewController
            }
            // Colin Next
        } else if colinViewController?.view.superview == nil {
            if colinViewController == nil {
                colinViewController = storyboard?.instantiateViewController(withIdentifier: "colin") as? ColinViewController
            }
        } else if seanViewController?.view.superview == nil {
            if seanViewController == nil {
                seanViewController = storyboard?.instantiateViewController(withIdentifier: "sean") as? SeanViewController
            }
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        // switch view controllers
        if dadViewController != nil
            && dadViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            
            momViewController.view.frame = view.frame
            switchViewController(from: dadViewController, to: momViewController)
      
        } else if momViewController != nil
            && momViewController.view.superview  != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            aaronViewController.view.frame = view.frame
            switchViewController(from: momViewController, to: aaronViewController)
        
        } else if aaronViewController != nil
            && aaronViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            
            colinViewController.view.frame = view.frame
            switchViewController(from: aaronViewController, to: colinViewController)
       
        } else if colinViewController != nil
            && colinViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            
            seanViewController.view.frame = view.frame
            switchViewController(from: colinViewController, to: seanViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadViewController.view.frame = view.frame
            switchViewController(from: seanViewController, to: dadViewController)
    }
        
        
        
        UIView.commitAnimations()
        }
    
        
        private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
            if fromVC != nil {
                fromVC!.willMove(toParent: nil)
                fromVC!.view.removeFromSuperview()
                fromVC!.removeFromParent()
                
            }
            if toVC != nil {
                self.addChild(toVC!)
                self.view.insertSubview(toVC!.view, at:0)
                toVC!.didMove(toParent: self)
            }
    }
}
