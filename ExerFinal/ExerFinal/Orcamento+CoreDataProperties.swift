//
//  Orcamento+CoreDataProperties.swift
//  ExerFinal
//
//  Created by ALUNO on 25/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

import Foundation
import CoreData


extension Orcamento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Orcamento> {
        return NSFetchRequest<Orcamento>(entityName: "Orcamento");
    }

    @NSManaged public var nome: String?

}
