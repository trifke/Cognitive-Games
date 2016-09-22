//
//  TutorialViewController.swift
//  CognitiveGames
//
//  Created by Apple on 4/21/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController
{
    @IBOutlet weak var labelText: UILabel!

    @IBOutlet weak var imageViewTutorial: UIImageView!
    
    @IBOutlet weak var buttonOK: UIButton! {
        didSet {
            buttonOK.layer.cornerRadius = 8.0
        }
    }
    
    var game = ""
    
    let text = ["sort" : "Neka od polja će prikazati brojeve. \nZapamtite gde je koji broj. \nVaš zadatak je da sortirate brojeve tako što ćete prvo kliknuti na polje gde je je bio broj 1, pa na polje gde je bio broj 2.",
                "numbers" : "Čućete brojeve. \nVaš zadatak je da unesete brojeve u obrnutom poretku",
                "grid" : "Neka od polja će se osvetliti. \nVaš zadatak je da kliknete na polja u istom poretku.",
                "rotating" : "Lampice se kreću u krug. Neke od lampica će se osvetiliti u određenom poretku. Pošto se kreću morate da pazite gde je koja. Vaš zadatak je da kliknete na lampice istim redom kojim su se osvetljavale"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelText.text = text[game]
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        var imgListArray = [UIImage](repeating: UIImage(), count: 8)
        for i in 0...7
        {
            let strImageName = game + "\(i).png"
            let image = UIImage(named: strImageName)
            imgListArray[i] = image!
        }
        
        imageViewTutorial.animationImages = imgListArray
        imageViewTutorial.animationDuration = 8.0
        imageViewTutorial.animationRepeatCount = Int.max
        imageViewTutorial.startAnimating()
        
        if game == "rotating"
        {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = M_PI * 2.0 /* full rotation*/
            rotationAnimation.duration = 16
            rotationAnimation.isCumulative = true
            rotationAnimation.repeatCount = FLT_MAX

            imageViewTutorial.layer.add(rotationAnimation, forKey: "rotationAnimation")
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOKTapped(_ sender: AnyObject)
    {
        dismiss(animated: true, completion: nil)
    }
}
