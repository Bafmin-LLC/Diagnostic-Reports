//
//  WebViewVC.swift
//  Diagnostic Reports
//
//  Created by Bafmin LLC on 12/04/22.
//

import UIKit
import WebKit
import PDFKit

class PDFViewC: UIViewController {
    
    @IBOutlet weak var btn_print: UIButton!
    @IBOutlet weak var btn_close: UIButton!
    @IBOutlet weak var pdfView: PDFView!
    
    public var documentData: Data?
    
    var paperSize : PaperSize = .a4
    var pdfURL :URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.autoScales = true
        
        
        if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: pdfURL.path)) {
            
            pdfView.document = pdfDocument
        }
        
    }
  
    @IBAction func click_onPrintBtn(_ sender: Any) {
        
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = .general
        printInfo.duplex = .none
        printInfo.orientation = .portrait
        printController.printPageRenderer = nil
        printController.printingItem = self.pdfView.document?.documentURL
        printController.printInfo = printInfo
        
        printController.showsNumberOfCopies = true
        printController.showsPaperOrientation = false
        printController.showsPaperSelectionForLoadedPapers = true
        printController.present(animated: true, completionHandler: nil)
        
    }
    
    @IBAction func click_onCloseBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
