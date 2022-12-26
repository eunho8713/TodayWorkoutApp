//
//  ViewController.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/01.
//

import UIKit
import XMLCoder
import Foundation
import Alamofire
import Combine

class ViewController: UIViewController, UIScrollViewDelegate, XMLParserDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBAction func tap(_ sender: Any) {
        for i in 0..<books.count {
            print(books[i])
        }
        print(books.count)
    }
    
    var images = [#imageLiteral(resourceName: "bird"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "bear")]
    var imageViews = [UIImageView]()
    
    var isLock = true
    var tagType : TagType = .none
    var tempModel : item?
    var books: [item] = []
    
//    let urlstring = "http://api.kcisa.kr/openapi/service/rest/convergence2019/getConver09?serviceKey=8ba40b5d-49ef-4a92-944f-3980c9e578d0"
//    guard let url = URL(string: urlstring) else {
//        return
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var parser : XMLParser
        var yourKey = "8ba40b5d-49ef-4a92-944f-3980c9e578d0" // 공공 데이터 포털에서 발급받은 개인 키
        var url = URL(string: "http://api.kcisa.kr/openapi/service/rest/convergence2019/getConver09?serviceKey=\(yourKey)")
        parser = XMLParser(contentsOf: url!)!
        parser.delegate = self
        parser.parse()
        
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
       
    }

}

extension ViewController {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "item" {
            isLock = true
            tempModel = item.init()
        } else if elementName == "rnum" {
            tagType = .rnum
        } else if elementName == "creator" {
            tagType = .creator
        } else if elementName == "publisher" {
            tagType = .publisher
        } else if elementName == "collectionDb" {
            tagType = .collectionDb
        } else if elementName == "regDate" {
            tagType = .regDate
        } else if elementName == "issuedDate" {
            tagType = .issuedDate
        } else if elementName == "period" {
            tagType = .period
        } else if elementName == "title" {
            tagType = .title
        } else if elementName == "medium" {
            tagType = .medium
        } else if elementName == "extent" {
            tagType = .extent
        } else if elementName == "venue" {
            tagType = .venue
        } else if elementName == "description" {
            tagType = .description
        } else if elementName == "affiliation" {
            tagType = .affiliation
        } else if elementName == "subDescription" {
            tagType = .subDescription
        } else if elementName == "spatial" {
            tagType = .spatial
        } else if elementName == "subDescription" {
            tagType = .relation
        } else if elementName == "relation" {
            tagType = .subDescription
        } else if elementName == "rights" {
            tagType = .rights
        } else if elementName == "source" {
            tagType = .source
        } else if elementName == "contributor" {
            tagType = .contributor
        } else if elementName == "subjectCategory" {
            tagType = .subjectCategory
        } else if elementName == "grade" {
            tagType = .grade
        } else if elementName == "state" {
            tagType = .state
        } else if elementName == "url" {
            tagType = .url
        } else {
            tagType = .none
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            guard let tempModel = tempModel else {
                return
            }
            books.append(tempModel)
            isLock = false
        } else {
            print("----- didEndElement (else)-----")
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let parseString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if isLock {
            switch tagType {
            case .rnum:
                tempModel?.rnum = parseString
            case .creator:
                tempModel?.creator = parseString
            case .publisher:
                tempModel?.publisher = parseString
            case .collectionDb:
                tempModel?.collectionDb = parseString
            case .regDate:
                tempModel?.regDate = parseString
            case .issuedDate:
                tempModel?.issuedDate = parseString
            case .period:
                tempModel?.period = parseString
            case .title:
                tempModel?.title = parseString
            case .medium:
                tempModel?.medium = parseString
            case .extent:
                tempModel?.extent = parseString
            case .venue:
                tempModel?.venue = parseString
            case .description:
                tempModel?.description = parseString
            case .affiliation:
                tempModel?.affiliation = parseString
            case .subDescription:
                tempModel?.subDescription = parseString
            case .spatial:
                tempModel?.spatial = parseString
            case .relation:
                tempModel?.relation = parseString
            case .reference:
                tempModel?.reference = parseString
            case .rights:
                tempModel?.rights = parseString
            case .source:
                tempModel?.source = parseString
            case .contributor:
                tempModel?.contributor = parseString
            case .subjectCategory:
                tempModel?.subjectCategory = parseString
            case .grade:
                tempModel?.grade = parseString
            case .subjectKeyword:
                tempModel?.subjectKeyword = parseString
            case .state:
                tempModel?.state = parseString
            case .url:
                tempModel?.url = parseString
            case .none: break
        
            }
        }
    }
    
    
}


extension ViewController {
    
    private func addContentScrollView() {
            
            for i in 0..<images.count {
                let imageView = UIImageView()
                let xPos = scrollView.frame.width * CGFloat(i)
                imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
                imageView.image = images[i]
                scrollView.addSubview(imageView)
                scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            }
            
        }
        
        private func setPageControl() {
            pageControl.numberOfPages = images.count
            
        }
        
        private func setPageControlSelectedPage(currentPage:Int) {
            pageControl.currentPage = currentPage
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let value = scrollView.contentOffset.x/scrollView.frame.size.width
            setPageControlSelectedPage(currentPage: Int(round(value)))
        }
    

}


