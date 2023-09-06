//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 大森宗一郎 on 2023/08/17.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 2画面目のLabelを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var imageview: UIImageView!
    //@IBOutlet weak var label: UILabel!
    
        // 受け取るためのプロパティ（変数）を宣言しておく
        //var x:Int = 0
        //var y:Int = 0
    var gazou:UIImage =  UIImage(named: "Fireworks1.jpeg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // 上記では、x, y を 0 と宣言していたが、
        // 1画面目のViewControllerから遷移するときにprepareForSegueで
        // x, yの値を新たに代入されたので両方共 1 が入っている
        //let result = x + y
        //label.text = "結果は \(result) です"
    //}
        
        let result = gazou
        imageview.image = result
    }
    
    // Do any additional setup after loading the view.
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    */

