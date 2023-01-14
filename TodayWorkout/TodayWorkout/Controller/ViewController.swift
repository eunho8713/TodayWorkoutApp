//
//  ViewController.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/01.
//

import UIKit
import Foundation


class ViewController: UIViewController, UIScrollViewDelegate, XMLParserDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var isLock = true
    var tagType: TagType = .none
    var tempModel : item?
    var datas: [item] = []
    var parser : XMLParser!
    
    var images = [#imageLiteral(resourceName: "bird"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "bear")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "http://api.kcisa.kr/openapi/service/rest/convergence2019/getConver09?serviceKey=8ba40b5d-49ef-4a92-944f-3980c9e578d0") else {
            return
        }

        parser = XMLParser(contentsOf: url)
        parser.delegate = self
        parser.parse()
        print(datas[0].spatial)
        
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
        
       
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


