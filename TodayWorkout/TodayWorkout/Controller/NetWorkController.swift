//
//  NetWork.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/27.
//

import Foundation
import UIKit

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
            datas.append(tempModel)
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

