//
//  RegisterViewController.swift
//  CognitiveGames
//
//  Created by Apple on 4/11/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var buttonBack: UIButton! {
        didSet {
            let origImage = UIImage(named: "back");
            let tintedImage = origImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            buttonBack.setImage(tintedImage, forState: .Normal)
            buttonBack.tintColor = UIColor.lightGrayColor()
        }
    }
    
    @IBOutlet weak var textFieldName: UITextField! {
        didSet {
            textFieldName.layer.cornerRadius = 8.0
            textFieldName.layer.borderWidth = 1.0
            textFieldName.layer.borderColor = UIColor.lightGrayColor().CGColor
            textFieldName.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        }
    }
    
    @IBOutlet weak var buttonRegister: UIButton! {
        didSet {
            buttonRegister.layer.cornerRadius = 8.0
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
    
    @IBAction func buttonRegisterTapped(sender: AnyObject)
    {
        let user = User()
        user.name = textFieldName.text!
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(user)
            self.dismissViewControllerAnimated(true, completion: nil)
        }

    }
    
    @IBAction func buttonBackTapped(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Text Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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
