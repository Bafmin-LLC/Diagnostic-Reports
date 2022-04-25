//
//  CustomPrintBreastReport.swift
//  Diagnostic Reports
//
//  Created by Bafmin LLC on 16/04/22.
//

import Foundation
import UIKit

class CustomPrintBreastReport:UIPrintPageRenderer{
    
    override init() {
        super.init()
        
        self.headerHeight = 150
        self.footerHeight = 30
        
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
    
    override func drawContentForPage(at pageIndex: Int, in contentRect: CGRect)  {
        
        if pageIndex == 0{
         
            let bgView = UIView(frame:CGRect(x: 30, y: 0, width: paperRect.width, height: paperRect.height))
           
            let font = UIFont(name: "ProximaSoft-Regular", size: 13.0)
            let fontBold = UIFont(name: "ProximaSoft-SemiBold", size: 13.0)
            
            let topView = UIView(frame: CGRect(x: 0, y: 150, width: paperRect.width, height: 150))
            bgView.addSubview(topView)
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: topView.vWidth/2, height: 150))
            
            
            let lblIndication = UILabel(frame: CGRect(x: 20, y: 10, width: leftView.vWidth - 20, height: 15))
            lblIndication.text = "Indication for Exam"
            lblIndication.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            leftView.addSubview(lblIndication)
            
            let lblIndicationDetail = UILabel(frame: CGRect(x: 20, y: lblIndication.YH + 5, width: leftView.vWidth - 30, height: 40))
            lblIndicationDetail.lineBreakMode = .byWordWrapping
            lblIndicationDetail.font  = font
            lblIndicationDetail.text = "Patient referred for diagnostic ultrasound due to elevated TSH.Thyroid shows signs of goiter."
            lblIndicationDetail.numberOfLines = 2
            leftView.addSubview(lblIndicationDetail)
            
            
            let lblProcedure = UILabel(frame: CGRect(x: 20, y: lblIndicationDetail.YH + 30, width: leftView.vWidth - 20, height: 15))
            lblProcedure.text = "Procedure"
            lblProcedure.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            leftView.addSubview(lblProcedure)
            
            
            let lblProcedureDetail = UILabel(frame: CGRect(x: 20, y: lblProcedure.YH + 5, width: leftView.vWidth - 30, height: 40))
            lblProcedureDetail.lineBreakMode = .byWordWrapping
            lblProcedureDetail.font  = font
            lblProcedureDetail.text = "Ultrasound examination of the thyroid and adjacent soft tissues was performed."
            lblProcedureDetail.numberOfLines = 2
            leftView.addSubview(lblProcedureDetail)
            
            topView.addSubview(leftView)
            
            
            let rightView = UIView(frame: CGRect(x: leftView.XW, y: 0, width: topView.vWidth/2, height: 150))
            //        rightView.backgroundColor = .blue
            
            let lblComposition = UILabel(frame: CGRect(x: 20, y: 10, width: leftView.vWidth - 20, height: 15))
            lblComposition.text = "Breast Composition"
            lblComposition.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            rightView.addSubview(lblComposition)
            
            let lblCompositionDetail = UILabel(frame: CGRect(x: 20, y: lblIndication.YH + 5, width: leftView.vWidth - 30, height: 40))
            lblCompositionDetail.lineBreakMode = .byWordWrapping
            lblCompositionDetail.font  = font
            lblCompositionDetail.text = "Overall hettrogenously dence composition of left and right breast."
            lblCompositionDetail.numberOfLines = 2
            rightView.addSubview(lblCompositionDetail)
            
            //Add image - outline
            
            topView.addSubview(rightView)
           
            let findingView = UIView(frame: CGRect(x: 10, y: topView.YH + 20, width: paperRect.width - 30 , height: 30))
            findingView.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            
            let lblTitle = UILabel(frame: CGRect(x: 10, y: 7.5, width: findingView.vWidth, height: 15))
            lblTitle.text = "Findings: 3 Total"
            lblTitle.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            findingView.addSubview(lblTitle)
            
            bgView.addSubview(findingView)
            
            let finding1View = UIView(frame: CGRect(x: 10, y: findingView.YH + 10, width: 80, height: 30))
            finding1View.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.7333333333, blue: 0.8549019608, alpha: 1)
            
            let lblFinding1 = UILabel(frame: CGRect(x: 10, y: 7.5, width: finding1View.vWidth, height: 15))
            lblFinding1.text = "Finding 1"
            lblFinding1.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            findingView.addSubview(lblTitle)
            finding1View.addSubview(lblFinding1)
            bgView.addSubview(finding1View)
            
            let lblBi = UILabel(frame: CGRect(x: finding1View.vWidth + 20, y:  findingView.YH + 17, width: 100, height: 15))
            lblBi.text = "BI-RADS 3"
            lblBi.textColor = #colorLiteral(red: 0.2117647059, green: 0.7333333333, blue: 0.8549019608, alpha: 1)
            lblBi.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            bgView.addSubview(lblBi)
            
            let summaryView = UIView(frame: CGRect(x: 10, y: finding1View.YH + 10, width: paperRect.width - 30, height: 60))
            
            let lblSummary = UILabel(frame: CGRect(x: 0, y: 5, width: summaryView.vWidth, height: 15))
            lblSummary.text = "Summary"
            lblSummary.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            summaryView.addSubview(lblSummary)
            
            
            let lblSummaryDetail = UILabel(frame: CGRect(x: 0, y: lblSummary.YH + 5, width: lblSummary.vWidth - 30, height: 35))
            lblSummaryDetail.lineBreakMode = .byWordWrapping
            lblSummaryDetail.font  = font
            lblSummaryDetail.text = "Evolution of the nodule utilizing artificial intelligence reveals a TI-RADS ® rating of 1,and reccomands.No Fine Needle Apriciation"
            lblSummaryDetail.numberOfLines = 0
            summaryView.addSubview(lblSummaryDetail)
            
            bgView.addSubview(summaryView)
            //summaryBottom view
            
            let summaryBottomView = UIView(frame: CGRect(x: 10, y: summaryView.YH + 2, width: paperRect.width - 30, height: 150))
            
            let leftReportView = UIView(frame:  CGRect(x: 0, y: 0, width: summaryBottomView.vWidth/3, height: 150))
            
            //
            let lblDeacripors = UILabel(frame: CGRect(x: 0, y: 5, width: leftReportView.vWidth, height: 15))
            lblDeacripors.text = "BI-RADS® Deacripors"
            lblDeacripors.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            leftReportView.addSubview(lblDeacripors)
            
            let lblTitleShape = UILabel(frame: CGRect(x: 0, y: lblDeacripors.YH + 5, width: 60, height: 15))
            lblTitleShape.text = "Shape:"
            lblTitleShape.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitleShape)
            
            let lblShape = UILabel(frame: CGRect(x: lblTitleShape.vWidth, y: lblDeacripors.YH + 5, width: 100, height: 15))
            lblShape.text = "Oval"
            lblShape.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblShape)
            
            let lblTitleOriantation = UILabel(frame: CGRect(x: 0, y: lblTitleShape.YH + 5, width: 90, height: 15))
            lblTitleOriantation.text = "Oriantation:"
            lblTitleOriantation.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitleOriantation)
            
            let lblOriantation = UILabel(frame: CGRect(x: lblTitleOriantation.vWidth, y: lblTitleShape.YH + 5, width: 100, height: 15))
            lblOriantation.text = "Parralal"
            lblOriantation.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblOriantation)
            
            let lblTitleMargin = UILabel(frame: CGRect(x: 0, y: lblTitleOriantation.YH + 5, width: 50, height: 15))
            lblTitleMargin.text = "Margin:"
            lblTitleMargin.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitleMargin)
            
            let lblMargin = UILabel(frame: CGRect(x: lblTitleMargin.vWidth, y: lblTitleOriantation.YH + 5, width: 150, height: 15))
            lblMargin.text = "Not-circumscribed,indistinct"
            lblMargin.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblMargin)
            
            let lblTitleEcho = UILabel(frame: CGRect(x: 0, y: lblTitleMargin.YH + 5, width: 100, height: 15))
            lblTitleEcho.text = "Echo pattern:"
            lblTitleEcho.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitleEcho)
            
            let lblEcho = UILabel(frame: CGRect(x: lblTitleEcho.vWidth, y: lblTitleMargin.YH + 5, width: 100, height: 15))
            lblEcho.text = "Hypoechoic"
            lblEcho.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblEcho)
            
            let lblTitlePosterior = UILabel(frame: CGRect(x: 0, y: lblTitleEcho.YH + 5, width: 100, height: 15))
            lblTitlePosterior.text = "Posterior features:"
            lblTitlePosterior.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitlePosterior)
            
            let lblPosterior = UILabel(frame: CGRect(x: lblTitlePosterior.vWidth, y: lblTitleEcho.YH + 5, width: 100, height: 15))
            lblPosterior.text = "Enhancement"
            lblPosterior.numberOfLines = 0
            lblPosterior.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblPosterior)
            
            let lblTitleCalci = UILabel(frame: CGRect(x: 0, y: lblPosterior.YH + 5, width: 100, height: 15))
            lblTitleCalci.text = "Calci cation:"
            lblTitleCalci.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView.addSubview(lblTitleCalci)
            
            let lblCalci = UILabel(frame: CGRect(x: lblTitleCalci.vWidth, y: lblPosterior.YH + 5, width: 100, height: 15))
            lblCalci.text = "in a mass"
            lblCalci.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView.addSubview(lblCalci)
            
            
            summaryBottomView.addSubview(leftReportView)
            
            
            let centerReportView = UIView(frame:  CGRect(x: leftReportView.vWidth + 5, y: 0, width: summaryBottomView.vWidth/3, height: 150))
            
            let lblAsociated = UILabel(frame: CGRect(x: 0, y: 20, width: centerReportView.vWidth, height: 20))
            lblAsociated.numberOfLines = 0
            lblAsociated.text = "Associated features: Architectural distortion Duct changes"
            lblAsociated.font = font
            lblAsociated.sizeToFit()
            centerReportView.addSubview(lblAsociated)
            
            let lblSkin = UILabel(frame: CGRect(x: 0, y: lblAsociated.YH, width: centerReportView.vWidth, height: 20))
            lblSkin.numberOfLines = 0
            lblSkin.text = "Skin Changes: thickening \n Edema"
            lblSkin.font = font
            centerReportView.addSubview(lblSkin)
            
            let lblVascularity = UILabel(frame: CGRect(x: 0, y: lblSkin.YH, width: centerReportView.vWidth, height: 15))
            lblVascularity.text = "Vascularity: absent"
            lblVascularity.font = font
            centerReportView.addSubview(lblVascularity)
            
            let lblElasity = UILabel(frame: CGRect(x: 0, y: lblVascularity.YH, width: centerReportView.vWidth, height: 15))
            lblElasity.text = "Elasity: soft"
            lblElasity.font = font
            centerReportView.addSubview(lblVascularity)
            
            let lblSpecial = UILabel(frame: CGRect(x: 0, y: lblElasity.YH, width: centerReportView.vWidth, height: 15))
            lblSpecial.numberOfLines = 0
            lblSpecial.text = "Special cases: Simple cyst"
            lblSpecial.font = font
            centerReportView.addSubview(lblSpecial)
            
            let lblFeedback = UILabel(frame: CGRect(x: 0, y: lblSpecial.YH + 5, width: centerReportView.vWidth, height: 15))
            lblFeedback.numberOfLines = 0
            lblFeedback.text = "Feedback:"
            lblFeedback.font = font
            centerReportView.addSubview(lblFeedback)
            
            summaryBottomView.addSubview(centerReportView)
            
            
            let rightReportView = UIView(frame:  CGRect(x: leftReportView.vWidth + 5 + centerReportView.vWidth, y: 0, width: summaryBottomView.vWidth/3, height: 150))
            
            let lblPosition = UILabel(frame: CGRect(x: 0, y: 20, width: rightReportView.vWidth, height: 20))
            lblPosition.text = "Position: 11:00"
            lblPosition.font = font
            rightReportView.addSubview(lblPosition)
            
            let lblDistance = UILabel(frame: CGRect(x: 0, y: lblPosition.YH + 2, width: rightReportView.vWidth, height: 20))
            lblDistance.numberOfLines = 0
            lblDistance.text = "Distance from Nipple(CMFN): 7 cm"
            lblDistance.font = font
            lblDistance.sizeToFit()
            rightReportView.addSubview(lblDistance)
            
            let lblSize = UILabel(frame: CGRect(x: 0, y: lblDistance.YH + 2, width: rightReportView.vWidth, height: 20))
            lblSize.numberOfLines = 0
            lblSize.text = "Size: 0.9x1.0x0.7cm \n (LxWxH)"
            lblSize.font = font
            lblSize.sizeToFit()
            rightReportView.addSubview(lblSize)
            
            let lblPrevious = UILabel(frame: CGRect(x: 0, y: lblSize.YH + 2, width: rightReportView.vWidth, height: 20))
            lblPrevious.numberOfLines = 0
            lblPrevious.text = "Previous size: \n (LxWxH)"
            lblPrevious.font = font
            lblPrevious.sizeToFit()
            rightReportView.addSubview(lblPrevious)
            
            let lblMesurment = UILabel(frame: CGRect(x: 0, y: lblPrevious.YH + 2, width: rightReportView.vWidth, height: 20))
            lblMesurment.numberOfLines = 0
            lblMesurment.text = "Date of previous measurement:"
            lblMesurment.font = font
            lblMesurment.sizeToFit()
            rightReportView.addSubview(lblMesurment)
            
            summaryBottomView.addSubview(rightReportView)
            
            let lblNote = UILabel(frame: CGRect(x: 10, y: summaryBottomView.YH + 5, width: 50, height: 20))
            lblNote.text = "Notes:"
            lblNote.font = fontBold
            bgView.addSubview(lblNote)
            
            let lblNotedesc = UILabel(frame: CGRect(x: lblNote.vWidth + 10, y: lblNote.YPOINT + 5, width: bgView.vWidth - lblNote.vWidth, height: 20))
            lblNotedesc.font = font
            lblNotedesc.numberOfLines = 0
            lblNotedesc.text = "No remarkable ductal ectasia is seen \n Retroareoer areas and the pectoral muscles are unremarkable."
            lblNotedesc.sizeToFit()
            bgView.addSubview(lblNotedesc)
            
            
            let sepraterView = UIView(frame: CGRect(x: 10, y: lblNotedesc.YH + 5, width: bgView.vWidth - 20, height: 3))
            sepraterView.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.7333333333, blue: 0.8549019608, alpha: 1)
            bgView.addSubview(sepraterView)
            
            
            
            let finding2View = UIView(frame: CGRect(x: 10, y: sepraterView.YH + 10, width: 80, height: 30))
            finding2View.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
            
            let lblFinding2 = UILabel(frame: CGRect(x: 10, y: 7.5, width: finding2View.vWidth, height: 15))
            lblFinding2.text = "Finding 2"
            lblFinding2.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            lblFinding2.textColor = UIColor.white
            finding2View.addSubview(lblFinding2)
            bgView.addSubview(finding2View)
            
            let lblBi1 = UILabel(frame: CGRect(x: finding2View.vWidth + 20, y:  sepraterView.YH + 20, width: 100, height: 15))
            lblBi1.text = "BI-RADS 3"
            lblBi1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            lblBi1.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            bgView.addSubview(lblBi1)
            
            
            
            let lblAnalys = UILabel(frame: CGRect(x: 10, y: finding2View.frame.origin.y + finding2View.frame.height + 5, width: bgView.vWidth, height: 20))
            lblAnalys.text = "AI Analysis + BI-RADS Rating"
            lblAnalys.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            bgView.addSubview(lblAnalys)
            
            
            let summaryBottomView2 = UIView(frame: CGRect(x: 10, y:lblAnalys.frame.origin.y + lblAnalys.frame.height + 5, width: paperRect.width - 30, height: 150))
            
            let leftReportView1 = UIView(frame:  CGRect(x: 0, y: 0, width: summaryBottomView2.vWidth/3, height: 150))
            
            //
            let lblDeacripors1 = UILabel(frame: CGRect(x: 0, y: 5, width: leftReportView1.vWidth, height: 15))
            lblDeacripors1.text = "BI-RADS® Deacripors"
            lblDeacripors1.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            leftReportView1.addSubview(lblDeacripors1)
            
            let lblTitleShape1 = UILabel(frame: CGRect(x: 0, y: lblDeacripors1.YH + 5, width: 60, height: 15))
            lblTitleShape1.text = "Shape:"
            lblTitleShape1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitleShape1)
            
            let lblShape1 = UILabel(frame: CGRect(x: lblTitleShape1.vWidth, y: lblDeacripors1.YH + 5, width: 100, height: 15))
            lblShape1.text = "Oval"
            lblShape1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblShape1)
            
            let lblTitleOriantation1 = UILabel(frame: CGRect(x: 0, y: lblTitleShape1.YH + 5, width: 90, height: 15))
            lblTitleOriantation1.text = "Oriantation:"
            lblTitleOriantation1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitleOriantation1)
            
            let lblOriantation1 = UILabel(frame: CGRect(x: lblTitleOriantation1.vWidth, y: lblTitleShape1.YH + 5, width: 100, height: 15))
            lblOriantation1.text = "Parralal"
            lblOriantation1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblOriantation1)
            
            let lblTitleMargin1 = UILabel(frame: CGRect(x: 0, y: lblTitleOriantation1.YH + 5, width: 50, height: 15))
            lblTitleMargin1.text = "Margin:"
            lblTitleMargin1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitleMargin1)
            
            let lblMargin1 = UILabel(frame: CGRect(x: lblTitleMargin1.vWidth, y: lblTitleOriantation1.YH + 5, width: 150, height: 15))
            lblMargin1.text = "Not-circumscribed,indistinct"
            lblMargin1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblMargin1)
            
            let lblTitleEcho1 = UILabel(frame: CGRect(x: 0, y: lblTitleMargin1.YH + 5, width: 100, height: 15))
            lblTitleEcho1.text = "Echo pattern:"
            lblTitleEcho1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitleEcho1)
            
            let lblEcho1 = UILabel(frame: CGRect(x: lblTitleEcho1.vWidth, y: lblTitleMargin1.YH + 5, width: 100, height: 15))
            lblEcho1.text = "Hypoechoic"
            lblEcho1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblEcho1)
            
            let lblTitlePosterior1 = UILabel(frame: CGRect(x: 0, y: lblTitleEcho1.YH + 5, width: 100, height: 15))
            lblTitlePosterior1.text = "Posterior features:"
            lblTitlePosterior1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitlePosterior1)
            
            let lblPosterior1 = UILabel(frame: CGRect(x: lblTitlePosterior1.vWidth, y: lblTitleEcho1.YH + 5, width: 100, height: 15))
            lblPosterior1.text = "Enhancement"
            lblPosterior1.numberOfLines = 0
            lblPosterior1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblPosterior1)
            
            let lblTitleCalci1 = UILabel(frame: CGRect(x: 0, y: lblPosterior1.YH + 5, width: 100, height: 15))
            lblTitleCalci1.text = "Calci cation:"
            lblTitleCalci1.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            leftReportView1.addSubview(lblTitleCalci1)
            
            let lblCalci1 = UILabel(frame: CGRect(x: lblTitleCalci1.vWidth, y: lblPosterior1.YH + 5, width: 100, height: 15))
            lblCalci1.text = "in a mass"
            lblCalci1.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            leftReportView1.addSubview(lblCalci1)
            
            
            summaryBottomView2.addSubview(leftReportView1)
            
            
            let centerReportView1 = UIView(frame:  CGRect(x: leftReportView1.vWidth + 5, y: 0, width: summaryBottomView2.vWidth/3, height: 150))
            
            let lblAsociated1 = UILabel(frame: CGRect(x: 0, y: 20, width: centerReportView1.vWidth, height: 20))
            lblAsociated1.numberOfLines = 0
            lblAsociated1.text = "Associated features: Architectural distortion Duct changes"
            lblAsociated1.font = font
            lblAsociated1.sizeToFit()
            centerReportView1.addSubview(lblAsociated1)
            
            let lblSkin1 = UILabel(frame: CGRect(x: 0, y: lblAsociated1.YH, width: centerReportView1.vWidth, height: 20))
            lblSkin1.numberOfLines = 0
            lblSkin1.text = "Skin Changes: thickening \n Edema"
            lblSkin1.font = font
            centerReportView1.addSubview(lblSkin1)
            
            let lblVascularity1 = UILabel(frame: CGRect(x: 0, y: lblSkin1.YH, width: centerReportView1.vWidth, height: 15))
            lblVascularity1.text = "Vascularity: absent"
            lblVascularity1.font = font
            centerReportView1.addSubview(lblVascularity1)
            
            let lblElasity1 = UILabel(frame: CGRect(x: 0, y: lblVascularity1.YH, width: centerReportView1.vWidth, height: 15))
            lblElasity1.text = "Elasity: soft"
            lblElasity1.font = font
            centerReportView1.addSubview(lblVascularity1)
            
            let lblSpecial1 = UILabel(frame: CGRect(x: 0, y: lblElasity1.YH, width: centerReportView1.vWidth, height: 15))
            lblSpecial1.numberOfLines = 0
            lblSpecial1.text = "Special cases: Simple cyst"
            lblSpecial1.font = font
            centerReportView1.addSubview(lblSpecial1)
            
            let lblFeedback1 = UILabel(frame: CGRect(x: 0, y: lblSpecial1.YH + 5, width: centerReportView1.vWidth, height: 15))
            lblFeedback1.numberOfLines = 0
            lblFeedback1.text = "Feedback:"
            lblFeedback1.font = font
            centerReportView1.addSubview(lblFeedback1)
            
            summaryBottomView2.addSubview(centerReportView1)
            
            
            let rightReportView1 = UIView(frame:  CGRect(x: leftReportView1.vWidth + 5 + centerReportView1.vWidth, y: 0, width: summaryBottomView2.vWidth/3, height: 150))
            
            let lblPosition1 = UILabel(frame: CGRect(x: 0, y: 20, width: rightReportView1.vWidth, height: 20))
            lblPosition1.text = "Position: 11:00"
            lblPosition1.font = font
            rightReportView1.addSubview(lblPosition1)
            
            let lblDistance1 = UILabel(frame: CGRect(x: 0, y: lblPosition1.YH + 2, width: rightReportView1.vWidth, height: 20))
            lblDistance1.numberOfLines = 0
            lblDistance1.text = "Distance from Nipple(CMFN): 7 cm"
            lblDistance1.font = font
            lblDistance1.sizeToFit()
            rightReportView1.addSubview(lblDistance1)
            
            let lblSize1 = UILabel(frame: CGRect(x: 0, y: lblDistance1.YH + 2, width: rightReportView1.vWidth, height: 20))
            lblSize1.numberOfLines = 0
            lblSize1.text = "Size: 0.9x1.0x0.7cm \n (LxWxH)"
            lblSize1.font = font
            lblSize1.sizeToFit()
            rightReportView1.addSubview(lblSize1)
            
            let lblPrevious1 = UILabel(frame: CGRect(x: 0, y: lblSize1.YH + 2, width: rightReportView1.vWidth, height: 20))
            lblPrevious1.numberOfLines = 0
            lblPrevious1.text = "Previous size: \n (LxWxH)"
            lblPrevious1.font = font
            lblPrevious1.sizeToFit()
            rightReportView1.addSubview(lblPrevious1)
            
            let lblMesurment1 = UILabel(frame: CGRect(x: 0, y: lblPrevious1.YH + 2, width: rightReportView1.vWidth, height: 20))
            lblMesurment1.numberOfLines = 0
            lblMesurment1.text = "Date of previous measurement:"
            lblMesurment1.font = font
            lblMesurment1.sizeToFit()
            rightReportView1.addSubview(lblMesurment1)
            
            summaryBottomView2.addSubview(rightReportView1)
        
            bgView.addSubview(summaryBottomView2)
            bgView.addSubview(summaryBottomView)
//            bgView.layer.render(in: UIGraphicsGetCurrentContext()!)
//            bgView.draw(imageRect1)
//
            guard let context = UIGraphicsGetCurrentContext() else { return }
            let bounds = bgView.bounds
            context.scaleBy(x: bgView.frame.width / bounds.width, y: bgView.frame.height / bounds.height)
            bgView.layer.render(in: context)
            bgView.draw(bgView.layer, in: context)
        }
        
        if pageIndex == 1{
            
          
            let bgView = UIView(frame:CGRect(x: 30, y: 0, width: paperRect.width, height: paperRect.height))
            
            let font = UIFont(name: "ProximaSoft-Regular", size: 13.0)
            let fontBold = UIFont(name: "ProximaSoft-SemiBold", size: 13.0)
            
            let lblNote1 = UILabel(frame: CGRect(x: 30, y: 150, width: 50, height: 20))
            lblNote1.text = "Notes:"
            lblNote1.font = fontBold
            bgView.addSubview(lblNote1)
            
            let lblNotedesc1 = UILabel(frame: CGRect(x: lblNote1.XW + 10, y: lblNote1.YPOINT + 5, width: bgView.vWidth - lblNote1.vWidth, height: 20))
            lblNotedesc1.font = font
            lblNotedesc1.numberOfLines = 0
            lblNotedesc1.text = "No remarkable ductal ectasia is seen \n Retroareoer areas and the pectoral muscles are unremarkable."
            lblNotedesc1.sizeToFit()
            bgView.addSubview(lblNotedesc1)
            
            let blueLineView = UIView(frame: CGRect(x: 30, y:lblNotedesc1.YH + 15 , width: bgView.vWidth - 60, height: 3))
            blueLineView.backgroundColor = appThemeColor
            bgView.addSubview(blueLineView)
            
            let lbl_impression = getSimpleLabel(frame: CGRect(x: 30, y:blueLineView.YH + 15 , width: bgView.vWidth - 60, height: 3), text: "Impression", fontName: Font.semibold, size: 17)
            bgView.addSubview(lbl_impression)
            
            let lbl_impInfo = getSimpleLabel(frame: CGRect(x: 30, y:lbl_impression.YH + 5 , width: bgView.vWidth - 60, height: 3), text: "According To ACR TI-RADSⓇ 1 reqiured no fine needle aspriation or Additional Follow-up.", fontName: Font.regular, size: 14)
            bgView.addSubview(lbl_impInfo)
            
            let lbl_additional = getSimpleLabel(frame: CGRect(x: 30, y:lbl_impInfo.YH + 15 , width: bgView.vWidth - 60, height: 3), text: "Additional Study Notes", fontName: Font.semibold, size: 17)
            bgView.addSubview(lbl_additional)
            
            let lbl_studyNote = getSimpleLabel(frame: CGRect(x: 30, y:lbl_additional.YH + 5 , width: bgView.vWidth - 60, height: 3), text: "Pationat Has no Faimily History of Hyperthiroidiasm oe elevated TSH.\nThank you for The opportunity to participate in your care \nplease do not hesitate to reach out with any questions Leo M. Barinov M.D., PhD", fontName: Font.regular, size: 14)
            bgView.addSubview(lbl_studyNote)
            
            let lbl_follow = getSimpleLabel(frame: CGRect(x: 30, y:lbl_studyNote.YH + 15 , width: bgView.vWidth - 60, height: 3), text: "Follow-up", fontName: Font.semibold, size: 17)
            bgView.addSubview(lbl_follow)
            
            let lbl_followInfo = getSimpleLabel(frame: CGRect(x: 30, y:lbl_follow.YH + 5 , width: bgView.vWidth - 60, height: 3), text: "Your provider has not recommended follow-up at this time \nIf you have any questions regarding your result or future treatment plan.\nplease call the office at +52.669.983.9080", fontName: Font.regular, size: 14)
            bgView.addSubview(lbl_followInfo)
            
            let footerView = UIView(frame: CGRect(x: 30, y: lbl_followInfo.YH + 15, width: bgView.vWidth - 60, height: 130))
            
            let lbl_arti = getSimpleLabel(frame: CGRect(x: 0, y:30 , width: bgView.vWidth - 60, height: 3), text: "Artificial Intelligents Analysis powerd by:", fontName: Font.semibold, size: 10)
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
            
            bgView.addSubview(footerView)
           
            guard let context = UIGraphicsGetCurrentContext() else { return }
            let bounds = bgView.bounds
            context.scaleBy(x: bgView.frame.width / bounds.width, y: bgView.frame.height / bounds.height)
            bgView.layer.render(in: context)
            
            
        }
    }
  
    override func drawFooterForPage(at pageIndex: Int, in footerRect: CGRect) {
        
        let footerText = "Page \(pageIndex + 1) of \(self.numberOfPages)"
        
        let font = UIFont(name: "ProximaSoft-Regular", size: 14.0)
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
    
    
    
    
    
}
