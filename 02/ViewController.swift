//
//  ViewController.swift
//  02
//
//  Created by Jennifer Yang on 2022/2/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var userSelectSegment: UISegmentedControl!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var mySelectLabel: UILabel!
    @IBOutlet var pcSelectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtnClick(_ sender: Any) {
        //如果 nameField.text 不等於 空白
        if(nameField.text != ""){
            //nameLabel 儲存 nameField位址 字串
            nameLabel.text = String(format: "名字\n%@", nameField.text!)
            //宣告 myIndex常數 = userSelectSegment這個類別 的 被選擇的選項引數屬性
            let myIndex = userSelectSegment.selectedSegmentIndex
            //宣告 mySelect常數 = 副函式getSelectBy 把數字轉換為字串回傳
            let mySelect = getSelectBy(index:myIndex)
            //mySelectLabel 儲存 mySelect位址 字串
            mySelectLabel.text = String(format:"我方出拳\n%@",mySelect)
            //宣告 pcIndex = Int.random()副程式產生隨機整數，介於0-2之間
            let pcIndex = Int.random(in: 0...2)
            //宣告 pcSelect = 副函式getSelectBy 把數字轉換為字串回傳
            let pcSelect = getSelectBy(index:pcIndex)
            //pcSelectLable 儲存 電腦出拳位址 字串
            pcSelectLabel.text = String(format:"電腦出拳\n%@",pcSelect)
            //執行 副函式showWinnerBy，輸入myIndex和pcIndex，判斷玩家勝負
            showWinnerBy(myIndex: myIndex, pcIndex: pcIndex)
            
        }else{
            textLabel.text = "請輸入玩家姓名"
        }
    }
    
    func getSelectBy(index:Int) -> String{
        //出拳 index = 0 剪刀, 1 石頭, 2 布
        return userSelectSegment.titleForSegment(at: index)!
    }
    
    func showWinnerBy(myIndex: Int, pcIndex: Int){
        if(myIndex == pcIndex){
            textLabel.text = "平手，再一次"
            winnerLabel.text = "勝利者\n平手"
        }else if((myIndex == 0 && pcIndex == 2) ||
                 (myIndex == 1 && pcIndex == 0) ||
                 (myIndex == 2 && myIndex == 1)){
            textLabel.text = "恭喜你獲得勝利"
            winnerLabel.text = String(format:"勝利者\n%@",nameField.text!)
        }else{
            textLabel.text = "可惜，電腦獲勝了"
            winnerLabel.text = "勝利者\n電腦"
        }
    }
    
}

