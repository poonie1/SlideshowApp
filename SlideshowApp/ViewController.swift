//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大森宗一郎 on 2023/08/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextImage(_ sender: Any) {
        
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backImage(_ sender: Any) {
        
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == -1 ) {
            // indexを３番目の数字に戻す
            nowIndex = 2
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @IBOutlet weak var startstop: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int! = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "Fireworks1.jpeg")!,
        UIImage(named: "Fireworks2.jpeg")!,
        UIImage(named: "Fireworks3.jpeg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 再生ボタンを押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startstop.setTitle("停止", for: .normal)
            
            // タップ無効化
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startstop.setTitle("再生", for: .normal)
            
            // タップ有効化
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        //resultViewController.x = 1
        //resultViewController.y = 1
        resultViewController.gazou = imageView.image!
        
        if (timer == nil) {
            
        } else {
            timer.invalidate()
            
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startstop.setTitle("再生", for: .normal)
            
            // タップ有効化
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        }
        //課題提出 Git ID   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
        
    }
