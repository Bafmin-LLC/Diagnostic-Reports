//
//  Constants.swift
//  Diagnostic Reports
//
//  Created by Bafmin LLC on 11/04/22.
//

import Foundation
import UIKit

let appThemeColor = UIColor(named: "appThemeColor")!
let bgViewColor = UIColor(named: "bgViewColor")!


struct Font {
    
    static let regular :String = "ProximaSoft-Regular"
    static let light :String = "ProximaSoft-Light"
    static let semibold :String = "ProximaSoft-SemiBold"
}

extension UIView {
    
    var vHeight : CGFloat {
        
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    
    var vWidth : CGFloat {
        
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    
    var XPOINT : CGFloat {
        
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    var YPOINT : CGFloat {
        
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    
    var YH : CGFloat {
        
        return self.frame.origin.y + self.frame.size.height
    }
    
    var XW : CGFloat {
        
        return self.frame.origin.x + self.frame.size.width
    }
 
    var cornerRadius : CGFloat {
        
        get { return  self.layer.cornerRadius }
        set {  self.layer.cornerRadius = newValue }
    }
    
    func setBorderAndCorner(_ BS:CGFloat,color:UIColor,CS:CGFloat) {
        
        self.layer.cornerRadius = CS
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = BS
        self.clipsToBounds = true
    }
   
    func setButtonShadow(){
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
    }
   
}

func showAlertWithMsg(_ msg:String,cc:UIViewController) {
  
    let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)

    let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction!) in
        print("you have pressed the Cancel button");
    }

    alert.addAction(cancelAction)

    DispatchQueue.main.async {
        cc.present(alert, animated: true, completion: nil)
    }
}


extension UITextField {
   
    func RightIcon(tf_R_Icon rIM:String){
        
        let lView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let setIV = UIImageView(image: UIImage(named: rIM))
        setIV.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        setIV.center = lView.center
        setIV.contentMode = .scaleAspectFit
        lView.addSubview(setIV)
        self.rightView = lView
        self.rightViewMode = .always

    }
   
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

enum ReportName {
    
    case breast
    case thyroid
}

enum PaperSize {
    
    case a4
    case letter

    var size: CGSize {
        switch self {
        case .a4:
            return CGSize(width: 595.2, height: 841.8)

        case .letter:
            return CGSize(width: 612, height: 792)

        }
    }
}

extension String {
    
    func getImagePath()-> String{
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent(self).path
        
        return filePath
    }
}

func makeSubStringBold(mainString:String,boldString:String,size:CGFloat) -> NSAttributedString {
    
    let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
    
    let range1 = (mainString as NSString).range(of: boldString)
    
    mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Font.semibold, size: size)!, range: range1)
    
    return mutableAttributedString
}

func getSimpleLabel(frame:CGRect,text:String,fontName:String,size:CGFloat) -> UILabel{
    
    let lbl_Echo = UILabel(frame: frame)
    lbl_Echo.text = text
    lbl_Echo.font = UIFont(name: fontName, size: size)
    lbl_Echo.numberOfLines = 0
    lbl_Echo.sizeToFit()
    return lbl_Echo
}
