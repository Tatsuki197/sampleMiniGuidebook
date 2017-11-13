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
 
    //選択されたエリア名を保存するメンバ変数
    var selectedName = ""
    
    
    
    var seaList:[String] = []
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let filepath = Bundle.main.path(forResource: "areaList", ofType:"plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: filepath!)
        
        //TableViewで扱いやすい配列の形（エリア名の入っている配列）を作成
        for (key,data) in dic! {
            print(key)
            seaList.append(key as! String)
        }
    }
    //行数決定
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return areaList.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seaList.count
    }
    
    //表示する文字列を決定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //表示したい文字の設定 (teaList001)
        cell.textLabel?.text = seaList[indexPath.row]
        
        
        //文字を設定したセルを返す
        return cell
        
    }
    //セルがタップされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップされた行のエリア名を保存
        selectedName = seaList[indexPath.row]
        
        //セグエのidentifier（識別子）を指定して、画面移動
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    //セグエを使って画面移動する時発動
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //次の画面のインスタンスを取得
    let dvc = segue.destination as!
        DetailViewController
    
    
    //次の画面のプロパティにタップされた行のエリア名を渡す
    dvc.getAreaName = selectedName
    }
    
//    //セルをタップしたら発動。　　紅茶の各種類の説明ページに飛ぶ。
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)行目がタップされました")
//        //選択された行番号を保存
//        selectedIndex = indexPath.row
//        
//        //セグエ(ページを紐付ける線)の名前を指定して、画面移動処理を発動
//        performSegue(withIdentifier: "showDetail", sender: nil)
//    }
//    
//    //セグエ(ページを紐付ける線)を使って、画面移動している時に発動
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        //次の画面のインスタンス（オブジェクト）を取得。
//        //as! DetailViewControllerが、ダウンキャスト変換している箇所。
//        
//        let dvc:DetailViewController = segue.destination            //segue.destination 画面の到着地点。
//            as! DetailViewController
//        //次の画面のプロパティ（メンバー変数）passedIndexに選択された行番号。移動するページに先にpassedIndexを飛ばす場所を要しする
//        dvc.passedIndex = selectedIndex                 //DetailViewControllerが持っているpassedIndexに飛ばす。
//        
//    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

