//
//  ViewController.swift
//  sampleMiniGuidebook
//
//  Created by Tatsuki Nakatsuka on 2017/11/09.
//  Copyright © 2017年 Tatsuki Nakatsuka. All rights reserved.
//

import UIKit
//1.プロトコルの設定
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var areaList = ["パーパチュアル・スコア病院","セブ・ドクターズ・ユニバーシティ病院","Chong Hua Hospital, Mandaue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //行数決定
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return areaList.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaList.count
    }
    
    //表示する文字列を決定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //表示したい文字の設定 (teaList001)
        cell.textLabel?.text = areaList[indexPath.row]
        
        
        //文字を設定したセルを返す
        return cell
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

