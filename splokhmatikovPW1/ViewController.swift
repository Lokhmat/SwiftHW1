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
    
    func genHex() -> String{
        let possible = "0123456789abcdef"
        var chars: [Character] = []
        for _ in 1...8{
            chars.append(possible.randomElement() ?? "f")
        }
        return String(chars)
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
            set.insert(UIColor(hex:"#\(genHex())"))
        }
        for view in views{
            UIView.animate(withDuration:1 , animations: {view.backgroundColor = set.popFirst()})
                {completion in button?.isEnabled = true}
        }
    }
}

extension UIColor {
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
