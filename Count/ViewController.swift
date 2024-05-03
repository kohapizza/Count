//
//  ViewController.swift
//  Count
//
//  Created by 佐伯小遥 on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    //初期値0,Int型の変数numberを定義
    
    @IBOutlet var label: UILabel!
    //ストーリーボード上で「label」という名前のUILabelというパーツを作成
    //labelを @IBOutlet へ関連付け
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus(){
        number = number + 1
        label.text = String(number)
        
        if (number%3 == 0)||(String(number).contains("3")){
            label.textColor = UIColor.red
        }else{
            label.textColor = UIColor.black
        }
        changeImage()
    }
    
    @IBAction func minus(){
        number = number - 1
        label.text = String(number)
        if (number%3 == 0)||(String(number).contains("3")){
            label.textColor = UIColor.red
        }else{
            label.textColor = UIColor.black
        }
        changeImage()
    }
    
    func changeImage(){
        if (number%3 == 0)||(String(number).contains("3")){
            self.imageView.image = UIImage(named: "after")
        }else{
            self.imageView.image = UIImage(named: "before")
        }
    }


}

