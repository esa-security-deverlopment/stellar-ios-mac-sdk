//
//  AccountCreditedEffect.swift
//  stellarsdk
//
//  Created by Rogobete Christian on 05.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

import UIKit

///  Represents an account credited effect response.
///  See [Horizon API](https://www.stellar.org/developers/horizon/reference/resources/effect.html "Effect")
public class AccountCreditedEffect: Effect {
    
    /// Amount credited to the account.
    public var amount:String
    
    /// Asset type credited to this account. E.g. native
    public var assetType:String
    
    /// Asset code of the asset credited to the account. E.g. BTC, nil if native
    public var assetCode:String!
    
    /// The issuer of the asset credited to the account. Nil if asset type is "native"
    public var assetIssuer:String!
    
    // Properties to encode and decode
    private enum CodingKeys: String, CodingKey {
        case amount
        case assetType = "asset_type"
        case assetCode = "asset_code"
        case assetIssuer = "asset_issuer"
    }
    
    /**
        Initializer - creates a new instance by decoding from the given decoder.
     
        - Parameter decoder: The decoder containing the data
     */
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amount = try values.decode(String.self, forKey: .amount)
        assetType = try values.decode(String.self, forKey: .assetType)
        assetCode = try values.decodeIfPresent(String.self, forKey: .assetCode)
        assetIssuer = try values.decodeIfPresent(String.self, forKey: .assetIssuer)
        
        try super.init(from: decoder)
    }
    
    /**
        Encodes this value into the given encoder.
     
        - Parameter encoder: The encoder to receive the data
     */
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(assetType, forKey: .assetType)
        try container.encode(assetCode, forKey: .assetCode)
        try container.encode(assetIssuer, forKey: .assetIssuer)
    }
}
