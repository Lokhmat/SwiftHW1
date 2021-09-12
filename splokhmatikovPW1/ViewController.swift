//
//  ViewController.swift
//  splokhmatikovPW1
//
//  Created by Сергей Лохматиков on 12.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    
    func changeForm(){
        var set = Set<UIColor>()
        while set.count < views.count{
            set.insert(UIColor(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1))
        }
        for view in views{
            view.backgroundColor = set.popFirst()
            view.layer.cornerRadius = .random(in: 1..<20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeForm()
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        var set = Set<UIColor>()
        while set.count < views.count{
            set.insert(UIColor(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1))
        }
        for view in views{
            UIView.animate(withDuration:1 , animations: {view.backgroundColor = set.popFirst()})
                {completion in button?.isEnabled = true}
        }
    }
}

