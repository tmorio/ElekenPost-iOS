//
//  CheckReachability.swift
//  ElekenPost
//
//  Created by T.Morio on 2018/10/02.
//  Copyright © 2018年 T.Morio All rights reserved.
//

import SystemConfiguration

func CheckReachability(host_name:String)->Bool{
    
    let reachability = SCNetworkReachabilityCreateWithName(nil, host_name)!
    var flags = SCNetworkReachabilityFlags.connectionAutomatic
    if !SCNetworkReachabilityGetFlags(reachability, &flags) {
        return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    return (isReachable && !needsConnection)
}
