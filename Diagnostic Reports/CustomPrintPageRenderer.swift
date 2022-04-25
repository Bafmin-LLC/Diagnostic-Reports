//
//  CustomPrintPageRenderer.swift
//  Print2PDF
//
//  Created by Gabriel Theodoropoulos on 24/06/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit

class CustomPrintPageRenderer: UIPrintPageRenderer {
  
    override init() {
        super.init()
   
        self.headerHeight = 150
        self.footerHeight = 30
       
    }
    
    override func drawContentForPage(at pageIndex: Int, in contentRect: CGRect) {
        
        if pageIndex == 0 {
            
            let bodyview = UIView(frame:CGRect(x: 30, y: 0, width: paperRect.width, height: paperRect.height))
            
            let lblTitle1 = UILabel(frame: CGRect(x: 30, y: 150, width: bodyview.vWidth, height: 30))
            lblTitle1.text = "Indication for Exam"
            lblTitle1.font = UIFont(name: Font.semibold, size: 16.0)
            lblTitle1.sizeToFit()
            lblTitle1.vWidth = lblTitle1.vWidth + 10
            bodyview.addSubview(lblTitle1)
            
            let lblInfo1 = UILabel(frame: CGRect(x: 30, y: lblTitle1.YH + 2, width: bodyview.vWidth, height: 30))
            lblInfo1.text = "Patient referred for diagnostic ultrasound due to \nelevated TSH.Thyroid shows signs of goiter."
            lblInfo1.font = UIFont(name: Font.regular, size: 14.0)
            lblInfo1.numberOfLines = 0
            lblInfo1.sizeToFit()
            lblInfo1.vWidth = lblInfo1.vWidth + 10
            lblInfo1.vHeight = lblInfo1.vHeight + 5
            bodyview.addSubview(lblInfo1)
            
            let lblTitle2 = UILabel(frame: CGRect(x: 30, y: lblInfo1.YH + 20, width: bodyview.vWidth, height: 30))
            lblTitle2.text = "Procedure"
            lblTitle2.font = UIFont(name: Font.semibold, size: 16.0)
            lblTitle2.sizeToFit()
            lblTitle2.vWidth = lblTitle2.vWidth + 10
            lblTitle2.vHeight = lblTitle2.vHeight + 5
            bodyview.addSubview(lblTitle2)
            
            let lblInfo2 = UILabel(frame: CGRect(x: 30, y: lblTitle2.YH, width: bodyview.vWidth, height: 30))
            lblInfo2.text = "Ultrasound examination of the thyroid and \nadjacent soft tissues was performed."
            lblInfo2.font = UIFont(name: Font.regular, size: 14.0)
            lblInfo2.numberOfLines = 0
            lblInfo2.sizeToFit()
            lblInfo2.vWidth = lblInfo2.vWidth + 10
            lblInfo2.vHeight = lblInfo2.vHeight + 5
            bodyview.addSubview(lblInfo2)
            
            let imageX = (bodyview.vWidth - 200)
            let imageView = UIImageView(frame:CGRect(x: imageX, y:160,width: 170, height: 100))
            imageView.image = UIImage(named: "thyroid_outline.png")
            bodyview.addSubview(imageView)
            
            let bgView = UIView(frame:CGRect(x: 25, y: lblTitle2.YH + 40, width: bodyview.vWidth - 50, height: 50))
            bgView.backgroundColor = bgViewColor
            bodyview.addSubview(bgView)
            
            let lblFinding = UILabel(frame: CGRect(x: 10, y: 15, width: bgView.vWidth, height: 30))
            lblFinding.text = "Finding"
            lblFinding.font = UIFont(name: Font.semibold, size: 18)!
            lblFinding.sizeToFit()
            bgView.addSubview(lblFinding)
            
            let lblNodule = UILabel(frame: CGRect(x: 25, y: bgView.YH + 10, width: 130, height: 45))
            lblNodule.text = "Nodule 1"
            lblNodule.textAlignment = .center
            lblNodule.backgroundColor = appThemeColor
            lblNodule.textColor = .white
            lblNodule.font = UIFont(name: Font.semibold, size: 28.0)
            bodyview.addSubview(lblNodule)
            
            let lbl_tridas = UILabel(frame: CGRect(x: 170, y: bgView.YH + 10, width: 130, height: 45))
            lbl_tridas.text = "TI-RADS 1"
            lbl_tridas.textAlignment = .center
            lbl_tridas.textColor = appThemeColor
            lbl_tridas.font = UIFont(name: Font.semibold, size: 28.0)
            bodyview.addSubview(lbl_tridas)
            
            let lbl_summary = UILabel(frame: CGRect(x: 30, y: lbl_tridas.YH + 10, width: bodyview.vWidth - 60, height: 30))
            lbl_summary.text = "Summary"
            lbl_summary.font = UIFont(name: Font.semibold, size: 22.0)
            bodyview.addSubview(lbl_summary)
            
            let lbl_summaryInfo = UILabel(frame: CGRect(x: 30, y: lbl_summary.YH + 3, width: bodyview.vWidth - 60, height: 30))
            lbl_summaryInfo.text = "Evolution of the nodule utilizing artificial intelligence reveals a TI-RADSⓇ rating of 1,and reccomends.No Fine Needle Aspiration."
            lbl_summaryInfo.font = UIFont(name: Font.regular, size: 15.0)
            lbl_summaryInfo.numberOfLines = 0
            lbl_summaryInfo.sizeToFit()
            bodyview.addSubview(lbl_summaryInfo)
            
            let lbl_triDesc = UILabel(frame: CGRect(x: 30, y: lbl_summaryInfo.YH + 20, width: bodyview.vWidth - 60, height: 30))
            lbl_triDesc.text = "TI-RADS® Descriptors"
            lbl_triDesc.font = UIFont(name: Font.semibold, size: 17.0)
            lbl_triDesc.numberOfLines = 0
            lbl_triDesc.sizeToFit()
            bodyview.addSubview(lbl_triDesc)
            
            let vstack = UIStackView(frame: CGRect(x: 30, y: lbl_triDesc.YH + 10, width: bodyview.vWidth / 2 , height: 30))
            vstack.axis = .vertical
            vstack.distribution = .fillEqually
            vstack.spacing = 5
            bodyview.addSubview(vstack)
            
            let lbl_compo = getStackLabel(frame: CGRect(x: 0, y: 0, width: vstack.vWidth, height: 30), text: "Composition: Sipongiform", BoldString: "Composition:")
            vstack.addSubview(lbl_compo)
            
            let lbl_Echo = getStackLabel(frame: CGRect(x: 0, y: lbl_compo.YH + 5, width: vstack.vWidth, height: 30), text: "Echogenicity: Hyprechonic or Isoechoic", BoldString: "Echogenicity:")
            vstack.addSubview(lbl_Echo)
            
            let lbl_shape = getStackLabel(frame: CGRect(x: 0, y: lbl_Echo.YH + 5, width: vstack.vWidth, height: 30), text: "Shape: Wider-Than-Tall", BoldString: "Shape:")
            vstack.addSubview(lbl_shape)
            
            let lbl_margin = getStackLabel(frame: CGRect(x: 0, y: lbl_shape.YH + 5, width: vstack.vWidth, height: 30), text: "Margin: smooth", BoldString: "Margin:")
            vstack.addSubview(lbl_margin)
            
            let lbl_foci = getStackLabel(frame: CGRect(x: 0, y: lbl_margin.YH + 5, width: vstack.vWidth, height: 30), text: "Echogenic Foci: Large Comet-Tail Artifact", BoldString: "Echogenic Foci:")
            vstack.addSubview(lbl_foci)
          
            
            let lbl_size = UILabel(frame: CGRect(x: bodyview.vWidth / 2 + 20, y: lbl_summaryInfo.YH + 20, width: bodyview.vWidth / 2, height: 30))
            lbl_size.text = "Size & Position"
            lbl_size.font = UIFont(name: Font.semibold, size: 17.0)
            lbl_size.sizeToFit()
            bodyview.addSubview(lbl_size)
            
            let vstack1 = UIStackView(frame: CGRect(x: bodyview.vWidth / 2 + 20, y: lbl_size.YH + 10, width: bodyview.vWidth / 2 , height: 30))
            vstack1.axis = .vertical
            vstack1.distribution = .fillEqually
            vstack1.spacing = 5
            bodyview.addSubview(vstack1)
            
            
            let lbl_Position = getStackLabel(frame: CGRect(x: 0, y: 0, width: vstack.vWidth, height: 30), text: "Position: Left Mid Medical", BoldString: "Position:")
            vstack1.addSubview(lbl_Position)

            let lbl_cm = getStackLabel(frame: CGRect(x: 0, y: lbl_Position.YH + 5, width: vstack.vWidth, height: 30), text: "Size(cm): 3.45 x 4.54 x 2.47 (LxWxh)", BoldString: "Size(cm):")
            vstack1.addSubview(lbl_cm)

            let lbl_preSize = getStackLabel(frame: CGRect(x: 0, y: lbl_cm.YH + 5, width: vstack.vWidth, height: 30), text: "Previous size(cm): 3.45 x 4.54 x 2.47 \n(LxWxh)", BoldString: "Previous size(cm):")
            vstack1.addSubview(lbl_preSize)

            let lbl_date = getStackLabel(frame: CGRect(x: 0, y: lbl_preSize.YH + 5, width: vstack.vWidth, height: 30), text: "Date of previos mesurement:", BoldString: "Date of previos mesurement:")
            vstack1.addSubview(lbl_date)
            vstack1.vHeight = lbl_Position.vHeight + lbl_date.vHeight + lbl_cm.vHeight + lbl_preSize.vHeight
            
            let lbl_note = getStackLabel(frame: CGRect(x: 30, y: vstack1.YH + 40, width: 100, height: 30), text: "Notes:", BoldString: "Notes:")
            bodyview.addSubview(lbl_note)
            
            let lineview = UIView(frame: CGRect(x: 100, y:lbl_note.YH  , width: 300, height: 1))
            lineview.backgroundColor = .lightGray
            bodyview.addSubview(lineview)
            
            let blueLineView = UIView(frame: CGRect(x: 30, y:lineview.YH + 15 , width: bodyview.vWidth - 60, height: 3))
            blueLineView.backgroundColor = appThemeColor
            bodyview.addSubview(blueLineView)
            
            let lbl_impression = getSimpleLabel(frame: CGRect(x: 30, y:blueLineView.YH + 15 , width: bodyview.vWidth - 60, height: 3), text: "Impression", fontName: Font.semibold, size: 17)
            bodyview.addSubview(lbl_impression)
            
            let lbl_impInfo = getSimpleLabel(frame: CGRect(x: 30, y:lbl_impression.YH + 5 , width: bodyview.vWidth - 60, height: 3), text: "According To ACR TI-RADSⓇ 1 reqiured no fine needle aspriation or Additional Follow-up.", fontName: Font.regular, size: 14)
            bodyview.addSubview(lbl_impInfo)
            
            let lbl_additional = getSimpleLabel(frame: CGRect(x: 30, y:lbl_impInfo.YH + 15 , width: bodyview.vWidth - 60, height: 3), text: "Additional Study Notes", fontName: Font.semibold, size: 17)
            bodyview.addSubview(lbl_additional)
            
            let lbl_studyNote = getSimpleLabel(frame: CGRect(x: 30, y:lbl_additional.YH + 5 , width: bodyview.vWidth - 60, height: 3), text: "Pationat Has no Faimily History of Hyperthiroidiasm oe elevated TSH.\nThank you for The opportunity to participate in your care \nplease do not hesitate to reach out with any questions Leo M. Barinov M.D., PhD", fontName: Font.regular, size: 14)
            bodyview.addSubview(lbl_studyNote)
            
            let lbl_follow = getSimpleLabel(frame: CGRect(x: 30, y:lbl_studyNote.YH + 15 , width: bodyview.vWidth - 60, height: 3), text: "Follow-up", fontName: Font.semibold, size: 17)
            bodyview.addSubview(lbl_follow)
            
            let lbl_followInfo = getSimpleLabel(frame: CGRect(x: 30, y:lbl_follow.YH + 5 , width: bodyview.vWidth - 60, height: 3), text: "Your provider has not recommended follow-up at this time \nIf you have any questions regarding your result or future treatment plan.\nplease call the office at +52.669.983.9080", fontName: Font.regular, size: 14)
            bodyview.addSubview(lbl_followInfo)
            
            let footerView = UIView(frame: CGRect(x: 30, y: lbl_followInfo.YH + 15, width: bodyview.vWidth - 60, height: 130))
            
            let lbl_arti = getSimpleLabel(frame: CGRect(x: 0, y:30 , width: bodyview.vWidth - 60, height: 3), text: "Artificial Intelligents Analysis powerd by:", fontName: Font.semibold, size: 10)
            lbl_arti.textColor = appThemeColor
            lbl_arti.sizeToFit()
            lbl_arti.vWidth = lbl_arti.vWidth + 10
            footerView.addSubview(lbl_arti)
          
            let img_kois = UIImageView(frame:CGRect(x: lbl_arti.XW + 5, y:15,width: 100, height: 30))
            img_kois.image = UIImage(named: "KoiosLogo.png")
            footerView.addSubview(img_kois)
            
            let img_sign = UIImageView(frame:CGRect(x: img_kois.XW + 10, y:-15,width: 230, height: 60))
            img_sign.image = UIImage(named: "DrSignatureDEMO.png")
            footerView.addSubview(img_sign)
            
            let signLineview = UIView(frame: CGRect(x: img_sign.center.x - 90, y:img_kois.YH + 10 , width: 180, height: 3))
            signLineview.backgroundColor = appThemeColor
            footerView.addSubview(signLineview)
            
            bodyview.addSubview(footerView)
            
            guard let context = UIGraphicsGetCurrentContext() else { return }
            let bounds = bodyview.bounds
            context.scaleBy(x: bodyview.frame.width / bounds.width, y: bodyview.frame.height / bounds.height)
            bodyview.layer.render(in: context)
           
        }
    }
    
    override func drawPrintFormatter(_ printFormatter: UIPrintFormatter, forPageAt pageIndex: Int) {

        printFormatter.maximumContentWidth = self.printableRect.width
        printFormatter.maximumContentHeight = self.printableRect.height 
        self.addPrintFormatter(printFormatter, startingAtPageAt: 0)
    }

    override func drawHeaderForPage(at pageIndex: Int, in headerRect: CGRect) {
       
        let headerView = UIView(frame:CGRect(x: 40, y: 0, width: paperRect.width, height: headerHeight))
        headerView.backgroundColor = .white
        
        let lblTitle = UILabel(frame: CGRect(x: 30, y: 0, width: headerView.vWidth, height: 30))
        lblTitle.text = "Diagnostic Result Reports"
        lblTitle.font = UIFont(name: Font.semibold, size: 16.0)
        lblTitle.sizeToFit()
        lblTitle.vWidth = lblTitle.vWidth + 10
        headerView.addSubview(lblTitle)
        
        let imageX = (headerView.vWidth - 210)
        let imageView = UIImageView(frame:CGRect(x: imageX, y:0,width: 180, height: 50))
        imageView.image = UIImage(named: "hospital-logo-1.jpg")
        headerView.addSubview(imageView)
        
        let bgView = UIView(frame:CGRect(x: 30, y: 70, width: headerView.vWidth - 60, height: 60))
        bgView.backgroundColor = bgViewColor
        bgView.cornerRadius = 5
        
        let lblFirst = UILabel(frame: CGRect(x: 10, y: 10, width: bgView.vWidth, height: 30))
        lblFirst.text = "Amy F. Doe MRN: 6615474"
        lblFirst.font = UIFont(name: Font.semibold, size: 18)!
        lblFirst.sizeToFit()
        lblFirst.vWidth = lblFirst.vWidth + 10
        bgView.addSubview(lblFirst)
        
        let lblsec = UILabel(frame: CGRect(x: 10, y: 35, width: bgView.vWidth, height: 30))
        lblsec.text = "27 July 2021"
        lblsec.font = UIFont(name: Font.semibold, size: 18)!
        lblsec.sizeToFit()
        lblsec.vWidth = lblsec.vWidth + 10
        bgView.addSubview(lblsec)
        
        let lblthird = UILabel(frame: CGRect(x: 10, y: 35, width: bgView.vWidth, height: 30))
        lblthird.text = "Wendie Berg Breast Care Clinic 902-555-1234"
        lblthird.font = UIFont(name: Font.semibold, size: 18)!
        lblthird.sizeToFit()
        lblthird.vWidth = lblthird.vWidth + 10
        lblthird.XPOINT = bgView.vWidth - lblthird.vWidth
        bgView.addSubview(lblthird)
        
        headerView.addSubview(bgView)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let bounds = headerView.bounds
        context.scaleBy(x: headerView.frame.width / bounds.width, y: headerView.frame.height / bounds.height)
        headerView.layer.render(in: context)
        headerView.draw(headerView.layer, in: context)
        
        
    }
    
   
    override func drawFooterForPage(at pageIndex: Int, in footerRect: CGRect) {

        let footerText = "Page \(pageIndex + 1) of \(self.numberOfPages)"

        let font = UIFont(name: Font.regular, size: 14.0)
        let textSize = getTextSize(text: footerText as String, font: font!)

        let centerX = footerRect.size.width - textSize.width - 20
        print("centerX:",centerX)
        let centerY = footerRect.origin.y + self.footerHeight/2 - textSize.height/2  - 10
        let attributes = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor.black]

        footerText.draw(at: CGPoint(x: centerX, y: centerY), withAttributes: attributes)

    }
    
   
    func getTextSize(text: String, font: UIFont!, textAttributes: [NSAttributedString.Key: Any]! = nil) -> CGSize {
        
        let testLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: self.paperRect.size.width, height: footerHeight))
        if let attributes = textAttributes {
            testLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
        }
        else {
            testLabel.text = text
            testLabel.font = font!
        }
        
        testLabel.sizeToFit()
        
        return testLabel.frame.size
    }
    
    func getScaledImageSize(imageView: UIImageView) -> CGSize {

        var scaledWidth     = CGFloat(0)
        var scaledHeight    = CGFloat(0)

        let image = imageView.image!

        if image.size.height >= image.size.width {

            scaledHeight    = imageView.frame.size.height
            scaledWidth     = (image.size.width / image.size.height) * scaledHeight

            if scaledWidth > imageView.frame.size.width {

                let diff : CGFloat  = imageView.frame.size.width - scaledWidth
                scaledHeight        = scaledHeight + diff / scaledHeight * scaledHeight
                scaledWidth         = imageView.frame.size.width

            }

        } else {

            scaledWidth     = imageView.frame.size.width
            scaledHeight    = (image.size.height / image.size.width) * scaledWidth

            if scaledHeight > imageView.frame.size.height {

                let diff : CGFloat  = imageView.frame.size.height - scaledHeight
                scaledWidth         = scaledWidth + diff / scaledWidth * scaledWidth
                scaledHeight        = imageView.frame.size.height

            }
        }

        return CGSize(width: scaledWidth, height: scaledHeight)

    }
    
    func drawImageFromUIImageView(imageView: UIImageView) {

        let theImage = imageView.image!
//        let scaledImageSize = getScaledImageSize(imageView: imageView)
        let imageFrame = CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y, width: imageView.frame.width, height: imageView.frame.height)
        theImage.draw(in: imageFrame)

    }

    func drawTextFromLabel(aLabel: UILabel) {

        if aLabel.text?.isEmpty == false {

            let theFont             = aLabel.font
            let theAttributedFont   = [NSAttributedString.Key.font: theFont!]

            let theText     = aLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines) as NSString
            let theFrame    = aLabel.frame

            theText.draw(in: theFrame, withAttributes: theAttributedFont)

        }

    }

//
    func getStackLabel(frame:CGRect,text:String,BoldString:String) -> UILabel{
        
        let lbl_Echo = UILabel(frame: frame)
        lbl_Echo.text = text
        lbl_Echo.font = UIFont(name: Font.regular, size: 14.0)
        lbl_Echo.attributedText = makeSubStringBold(mainString: lbl_Echo.text!, boldString: BoldString, size: 15.0)
        lbl_Echo.numberOfLines = 0
        lbl_Echo.sizeToFit()
        return lbl_Echo
    }
    
  
}
