//
//  CommentViewController.swift
//  Instagram
//
//  Created by Hisashi Sugimoto on 2017/06/01.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {

    var postData : PostData!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func handleCommentPostButton(_ sender: AnyObject) {
        
        // postDataに必要な情報を取得しておく
        let comment = commentTextView.text!
        let name = FIRAuth.auth()?.currentUser?.displayName
        
        // 辞書を作成してFirebaseに保存する
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
        let data = ["name": name!, "comment":comment]
        
        postData.comments.append(data) // 配列に追加
        let comments = ["comments": postData.comments]    // 保存する値の準備
        postRef.updateChildValues(comments)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
       /* let name =  postData.comments[0]["name"]
        let comment =  postData.comments[0]["comment"]
         参照方法
         */
        
    }
    
    @IBAction func handleCommentCancelButton(_ sender: AnyObject) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    
    




    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
