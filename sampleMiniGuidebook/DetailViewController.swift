//
//  DetailViewController.swift
//  sampleMiniGuidebook
//
//  Created by Tatsuki Nakatsuka on 2017/11/10.
//  Copyright © 2017年 Tatsuki Nakatsuka. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: UIViewController {

    //前の画面から受け取るためのプロパティ
    var getAreaName = ""
    
    @IBOutlet weak var seaTitle: UILabel!
    
    @IBOutlet weak var textDesc: UITextView!
    
   
    @IBOutlet weak var areaImage: UIImageView!
    
   
    @IBOutlet weak var areaMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("getAreaName:\(getAreaName)")
        
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let filepath = Bundle.main.path(forResource: "areaList", ofType:"plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: filepath!)
        
        //今画面に表示したいデータの取得   NSDictionary(ネクストステップ)
        let detailInfo = dic![getAreaName] as! NSDictionary
        
        print(detailInfo["description"] as! String)
        print(detailInfo["image"] as! String)
        print(detailInfo["latitude"] as! String)
        print(detailInfo["longitude"] as! String)
        
        //タイトル
//        seaTitle.text = getAreaName
        
        //タイトルを、ナビゲーションの真ん中に表示。
        navigationItem.title = getAreaName
       //これでも良い！　　self=このクラスの名前を提示する。
        self.title = getAreaName
        
        
        //タイトルダメパターン
//        navigationController?.taitle = getAreaName
        
        //説明を表示
        textDesc.text = detailInfo["description"] as! String
        
        //画像
        areaImage.image = UIImage(named:detailInfo["image"] as! String)
        
        //地図
        let latitude = detailInfo["latitude"] as! String
        let longitude = detailInfo["longitude"] as! String
        //座標オブジェクト
        //型変換　String型ー＞Double型
        let coodinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
        
        //拡縮率
        let span = MKCoordinateSpanMake(0.01, 0.01)
        //範囲オブジェクト
        let region = MKCoordinateRegionMake(coodinate, span)
        
        
        //地図にセット
        areaMap.setRegion(region, animated: true)
        //ピンを生成
        let myPin:MKPointAnnotation = MKPointAnnotation()
        myPin.coordinate = coodinate
        myPin.title = getAreaName
        
        areaMap.addAnnotation(myPin)
        
        //TableViewで扱いやすい配列の形（エリア名の入っている配列）を作成
//        for (key,data) in dic! {
//            print(key)
//            seaList.append(key as! String)
//        }
      
    }
    
    var contentOffset = CGPoint.zero
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textDesc.contentOffset = contentOffset //set
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        contentOffset = textDesc.contentOffset //keep
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentOffset = CGPoint.zero //init
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
