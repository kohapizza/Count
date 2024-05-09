//
//  ViewController.swift
//  Count
//
//  Created by 佐伯小遥 on 2024/05/01.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let SoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "nabeatu")!.data)
    
    var timer: Timer!
    var number: Int = 0
    //初期値0,Int型の変数numberを定義
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var reset_button: UIButton!
    
    @IBOutlet var label: UILabel!
    //ストーリーボード上で「label」という名前のUILabelというパーツを作成
    //labelを @IBOutlet へ関連付け
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(){
//        タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.minus), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @IBAction func reset(){
        self.imageView.image = UIImage(named: "before")
        label.text = String(0)
        button.isEnabled = true
        label.textColor = UIColor.black
        
    }
    
    @IBAction func plus(){
        number = number + 1
        label.text = String(number)
        
        if number == 33 {
//            スペシャルナベアツ
            button.isEnabled = false
            timer.invalidate()
        }
        
        if (number%3 == 0)||(String(number).contains("3")){
            label.textColor = UIColor.red
            SoundPlayer.currentTime = 0
            SoundPlayer.play()
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
        if number == 33 {
            self.imageView.image = UIImage(named: "Image")
        } else if (number%3 == 0)||(String(number).contains("3")){
            self.imageView.image = UIImage(named: "after")
        }else{
            self.imageView.image = UIImage(named: "before")
        }
    }


}

