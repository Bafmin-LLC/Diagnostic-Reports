//
//  ViewController.swift
//  Diagnostic Reports
//
//  Created by Sarika scc on 11/04/22.
//

import UIKit
import PDFKit
import WebKit


class ViewController: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource, UITextFieldDelegate {
 
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btn_thyroid: UIButton!
    @IBOutlet weak var btn_breast: UIButton!
    @IBOutlet weak var txt_paper: UITextField!
    @IBOutlet weak var TFview: UIView!
    
    var arrSelection = ["A4", "Letter"]
    var selectedIndex = 0
    var oldIndex = -1
    var pickerView = UIPickerView()
    var pdfFilename: String!

    var HTMLcontents : String = ""
    var paperSize : PaperSize = .a4
    var reportName : ReportName!
   
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        pickerView.delegate = self
        pickerView.dataSource = self
        txt_paper.RightIcon(tf_R_Icon: "ic_dropdown")
        [btn_breast,btn_thyroid].forEach({$0?.cornerRadius = 20
            $0?.setButtonShadow()
        })
        
        TFview.setBorderAndCorner(1, color: .lightGray, CS:  TFview.frame.size.height / 2)
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        hideIndicator()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        hideIndicator()
    }
    
    func showIndicator(){
        
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func hideIndicator(){
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    //MARK: textfiled delegate method
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        pickerView.selectRow(oldIndex != -1 ? oldIndex : selectedIndex, inComponent: 0, animated: true)
        textField.inputView = pickerView
        addToolBar2(textField)
        textField.becomeFirstResponder()
    }
    
    //MARK: add tool bar
    
    func addToolBar2(_ textField: UITextField)
    {
        let toolBar = UIToolbar(frame: CGRect(x: 0,y: 0,width: self.view.frame.size.width, height: 44))
        toolBar.backgroundColor = .systemGray
        toolBar.tintColor = UIColor.black
        let barbuttonDone : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.click_DonePicker(_:)))
        
        let barbuttonCancel : UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelValue(sender:)))
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.items = [barbuttonCancel,flexible,barbuttonDone]
        toolBar.tag = textField.tag
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func cancelValue(sender: UIBarButtonItem) {
        
        self.view.endEditing(true)
        
        txt_paper.text = oldIndex != -1 ? arrSelection[oldIndex] : ""
        selectedIndex = oldIndex != -1 ? oldIndex : 0
    }
    
    @objc func click_DonePicker(_ sender : UIBarButtonItem) {
        
        self.view.endEditing(true)
        
        paperSize = selectedIndex == 0 ? .a4 : .letter
        txt_paper.text = arrSelection[selectedIndex]
        oldIndex = selectedIndex
    }
    
    //MARK: pickerview delegate method
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrSelection.count
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.arrSelection[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        selectedIndex = row
    }
    
    
    @IBAction func click_onBreatReportBtn(_ sender: Any) {
        
        if oldIndex != -1 {
            
            showIndicator()
            LoadHTMLFile(file_name: "report_breast")
            reportName = .breast
        }
        else
        {
            showAlertWithMsg("First select paper size", cc: self)
        }
    }
    
    @IBAction func click_onThyroidReportBtn(_ sender: Any) {
  
        if oldIndex != -1 {
            
            showIndicator()
            LoadHTMLFile(file_name: "report_thyroid")
            reportName = .thyroid
        }
        else
        {
            showAlertWithMsg("First select paper size", cc: self)
        }
    }
    
    //MARK: generate PDF

    func LoadHTMLFile(file_name:String){
        
        let htmlFile = Bundle.main.path(forResource: file_name, ofType: "html")
        let pathToHTMLCSS = Bundle.main.path(forResource: file_name, ofType: "css")
        
        do {
            
            var strHTMLContent = try String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
            strHTMLContent = strHTMLContent.replacingOccurrences(of: "./new.css", with: pathToHTMLCSS!)
            
            let pdfURL = URL(fileURLWithPath: htmlFile!)
            self.webView.loadHTMLString(strHTMLContent, baseURL: pdfURL)
            self.HTMLcontents = strHTMLContent
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                
                exportHTMLContentToPDF(HTMLContent: HTMLcontents)
            }
         
            
        } catch {
            print ("File HTML error",error.localizedDescription)
        }
    }
    
    func exportHTMLContentToPDF(HTMLContent: String) {     
        
        var render = UIPrintPageRenderer()
        
        if reportName == .breast {
            
            render = CustomPrintBreastReport()
        }
        else
        {
            render = CustomPrintPageRenderer()
        }
        
        let page = CGRect(x: 0, y: 0, width: paperSize.size.width, height: paperSize.size.height)
        let printable = page.insetBy(dx: 0, dy: 0)
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        render.drawContentForPage(at: 0, in: page)
        
        let formater = UIViewPrintFormatter()
        formater.maximumContentWidth = page.width
        formater.maximumContentHeight = page.height//
        render.addPrintFormatter(self.view.viewPrintFormatter(), startingAtPageAt: 0)
        
        let pdfData =  drawPDFUsingPrintPageRenderer(printPageRenderer: render)
        let name = "new.pdf"
        let pdfFilename = name.getImagePath()
        pdfData?.write(toFile: pdfFilename, atomically: true)
        
        print(pdfFilename)
   
        let vc = storyboard?.instantiateViewController(withIdentifier: "PDFViewC")as! PDFViewC
        vc.documentData = pdfData as Data?
        vc.pdfURL = URL(string: pdfFilename)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        let page = CGRect(x: 0, y: 0, width: paperSize.size.width, height: paperSize.size.height)
        UIGraphicsBeginPDFContextToData(data,page, nil)
        
        for i in 0..<printPageRenderer.numberOfPages{
            UIGraphicsBeginPDFPage()
            printPageRenderer.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext()
        
        return data
    }
}

