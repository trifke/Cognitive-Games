//
//  LandingViewController.swift
//  CognitiveGames
//
//  Created by Apple on 4/11/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit
import RealmSwift

class LandingViewController: UIViewController
{
    @IBOutlet weak var buttonPlay: UIButton! {
        didSet {
            buttonPlay.layer.cornerRadius = 8.0
        }
    }

    @IBOutlet weak var buttonNew: UIButton! {
        didSet {
            buttonNew.layer.cornerRadius = 8.0
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
