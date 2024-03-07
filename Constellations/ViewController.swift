//
//  ViewController.swift
//  Constellations
//
//  Created by 林郁琦 on 2024/1/21.
//

import UIKit
import Foundation

//利用結構 (Struct) Sign，用來表示星座名稱和圖片名稱
struct Constellation {
    let name: String
    let pic: String
}

class ViewController: UIViewController {
    //把需要設定的UI元件拉進outlet
    @IBOutlet weak var constellationLabel: UILabel!
    
    @IBOutlet weak var constellationImageView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var preButton: UIButton!
    
   
    
    //定義四個象限的Array
    let waterSign: [Constellation] = [Constellation(name: "巨蠍座", pic: "巨蠍座" ),Constellation(name: "天蠍座", pic: "天蠍座"),Constellation(name: "雙魚座", pic: "雙魚座")]
    let fireSign: [Constellation] = [Constellation(name: "牡羊座", pic: "牡羊座"),Constellation(name: "獅子座", pic: "獅子座"),Constellation(name: "射手座", pic: "射手座")]
    let earthSign: [Constellation] = [Constellation(name: "摩羯座", pic: "摩羯座"),Constellation(name: "金牛座", pic: "金牛座"),Constellation(name: "處女座", pic: "處女座")]
    let airSign: [Constellation] = [Constellation(name: "水瓶座", pic: "水瓶座"),Constellation(name: "雙子座", pic: "雙子座"),Constellation(name: "天秤座", pic: "天秤座")]
    
    //利用segmentedControl來判斷要顯示哪一個象限的圖片和文字
    func changeImage() {
        let Constellation: Constellation
        if segmentedControl.selectedSegmentIndex == 0 {
            Constellation = waterSign[pageControl.currentPage]
        } else if segmentedControl.selectedSegmentIndex == 1 {
            Constellation = fireSign[pageControl.currentPage]
        } else if segmentedControl.selectedSegmentIndex == 2 {
            Constellation = earthSign[pageControl.currentPage]
        } else {
            Constellation = airSign[pageControl.currentPage]
        }
        constellationLabel.text = Constellation.name
        constellationImageView.image = UIImage(named: Constellation.pic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constellationImageView.layer.cornerRadius = 40
        constellationImageView.image = UIImage(named: "巨蠍座")
        
        
    }
    //設定下一頁的按鈕，控制pageControl，當currentPage到達上限時，不會有作用
    @IBAction func nextButton(_ sender: Any) {
        pageControl.currentPage += 1
        changeImage()
    }
    //設定上一頁的按鈕，控制pageControl，當currentPage等於0時，不會有作用
    @IBAction func preButton(_ sender: Any) {
        pageControl.currentPage -= 1
        changeImage()
    }
    //設定pageControl來換圖片
    @IBAction func pageControl(_ sender: UIPageControl) {
        changeImage()
    }
    //設定segmentedControl，每按一個象限，pageControl就會從當前顯示的頁面切換回第一頁
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        pageControl.currentPage = 0
        changeImage()
    }
    
    
}



