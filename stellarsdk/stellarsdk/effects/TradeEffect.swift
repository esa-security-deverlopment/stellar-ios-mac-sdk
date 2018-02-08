//
//  TradeEffect.swift
//  stellarsdk
//
//  Created by Rogobete Christian on 05.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

import UIKit

///  Represents a trade effect response.
///  See [Horizon API](https://www.stellar.org/developers/horizon/reference/resources/effect.html "Effect")
public class TradeEffect: Effect {
    
    /// The seller in the trade effect.
    public var seller:String
    
    /// The id of the offer that has been traded.
    public var offerId:Int64
    
    /// The ammount of the asset sold.
    public var soldAmount:String
    
    /// The type of the sold asset. E.g. native
    public var soldAssetType:String
    
    /// The code of the sold asset. E.g. BTC. Nil if asset type is native.
    public var soldAssetCode:String!
    
    /// The asset issuer account id of the sold asset. Nil if asset type is native.
    public var soldAssetIssuer:String!
    
    /// The ammount of the asset sold.
    public var boughtAmount:String
    
    /// The type of the bought asset. E.g. native
    public var boughtAssetType:String
    
    /// The code of the bought asset. E.g. BTC. Nil if asset type is native.
    public var boughtAssetCode:String!
    
    /// The asset issuer account id of the bought asset. Nil if asset type is native.
    public var boughtAssetIssuer:String!
    
    // Properties to encode and decode
    private enum CodingKeys: String, CodingKey {
        case seller
        case offerId = "offer_id"
        case soldAmount = "sold_amount"
        case soldAssetType = "sold_asset_type"
        case soldAssetCode = "sold_asset_code"
        case soldAssetIssuer = "sold_asset_issuer"
        case boughtAmount = "bought_amount"
        case boughtAssetType = "bought_asset_type"
        case boughtAssetCode = "bought_asset_code"
        case boughtAssetIssuer = "bought_asset_issuer"
    }
    
    /**
        Initializer - creates a new instance by decoding from the given decoder.
     
        - Parameter decoder: The decoder containing the data
     */
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        seller = try values.decode(String.self, forKey: .seller)
        offerId = try values.decode(Int64.self, forKey: .offerId)
        soldAmount = try values.decode(String.self, forKey: .soldAmount)
        soldAssetType = try values.decode(String.self, forKey: .soldAssetType)
        soldAssetCode = try values.decodeIfPresent(String.self, forKey: .soldAssetCode)
        soldAssetIssuer = try values.decodeIfPresent(String.self, forKey: .soldAssetIssuer)
        boughtAmount = try values.decode(String.self, forKey: .boughtAmount)
        boughtAssetType = try values.decode(String.self, forKey: .soldAssetType)
        boughtAssetCode = try values.decodeIfPresent(String.self, forKey: .soldAssetCode)
        boughtAssetIssuer = try values.decodeIfPresent(String.self, forKey: .soldAssetIssuer)
        
        try super.init(from: decoder)
    }
    
    /**
        Encodes this value into the given encoder.
     
        - Parameter encoder: The encoder to receive the data
     */
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(seller, forKey: .seller)
        try container.encode(offerId, forKey: .offerId)
        try container.encode(soldAmount, forKey: .soldAmount)
        try container.encode(soldAssetType, forKey: .soldAssetType)
        try container.encode(soldAssetCode, forKey: .soldAssetCode)
        try container.encode(soldAssetIssuer, forKey: .soldAssetIssuer)
        try container.encode(boughtAmount, forKey: .boughtAmount)
        try container.encode(boughtAssetType, forKey: .boughtAssetType)
        try container.encode(boughtAssetCode, forKey: .boughtAssetCode)
        try container.encode(boughtAssetIssuer, forKey: .boughtAssetIssuer)
    }
}
