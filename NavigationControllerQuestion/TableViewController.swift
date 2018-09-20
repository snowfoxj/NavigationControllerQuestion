//
//  TableViewController.swift
//  NavigationControllerQuestion
//
//  Created by user on 2018/09/19.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

// 一覧表示
class TableViewController: UITableViewController {

    // 表示用データ 自作のデータ型Itemの配列
    var tableData:[[Item]]!
    
    // 表示用タイトル
    var tableTitles = ["干支","星座"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示データ準備
        let etoArray = createEtoItems()
        let starArray = createStarItems()
        
        // 表示用データ
        tableData = [etoArray,starArray]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row].name
        cell.detailTextLabel?.text = tableData[indexPath.section][indexPath.row].reading
        cell.imageView?.image = tableData[indexPath.section][indexPath.row].image

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitles[section]
    }

    // MARK: - Navigation

    // セグエで情報を伝える
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "detail" {
            // 型がスーパクラスの方に落ちてるので戻す
            let dest = segue.destination as! ViewController
            
            // 今選ばれているセルのindexPath
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // 遷移先の画面に表示データを渡す
                dest.item = tableData[indexPath.section][indexPath.row]
            }
        }
    }
    
    // MARK: - 自分メソッド
    
    // 干支情報(Itemインスタンスの詰まったArray)の作成
    func createEtoItems() -> [Item] {
        // 干支
        let etoArray = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]
        
        // 干支詳細テキスト
        let detailArray = ["ね","うし","とら","う","たつ","み","うま","ひつじ","さる","とり","いぬ","いのしし"]
        // 画像ファイル名
        let etoImageNames = ["eto_ca_025.png","eto_ca_026.png","eto_ca_027.png","eto_ca_028.png","eto_ca_029.png","eto_ca_030.png","eto_ca_031.png","eto_ca_032.png","eto_ca_033.png","eto_ca_034.png","eto_ca_035.png","eto_ca_036.png"]
        
        // 干支アイテムの入れ物
        var etoItemArray:[Item] = []
        
        // 干支のデータが入ったItemを作る
        for i in 0..<etoArray.count {
            
            let etoItem = Item(number: i, image: UIImage(named: etoImageNames[i]) ?? nil, name: etoArray[i], reading: detailArray[i])
            // 追加
            etoItemArray.append(etoItem)
        }
        
        return etoItemArray
    }
    
    // 星座のItemを作る
    func createStarItems() -> [Item] {
        let starArray = ["牡羊座", "牡牛座", "双子座", "蟹座", "獅子座", "乙女座", "天秤座", "蠍座", "蛇使い座", "射手座", "山羊座", "水瓶座", "魚座"]
        
        // 星座アイテムを作る
        var starItemArray:[Item] = []
        
        for i in 0..<starArray.count {
            
            let starItem = Item(number: i, image: nil, name: starArray[i], reading: "")
            starItemArray.append(starItem)
        }
        
        return starItemArray
    }
}
