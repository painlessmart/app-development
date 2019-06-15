//
//  Conestant.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/22/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

// Network manager for connect to server
var AFManager = Networking.manager

// Timeout Connect to server in seconds
let TimeOut_WebService : TimeInterval = 10

// Server url
let Server_Url = "http://139.162.39.19:8000/api/v1"

let Login_Api_Address = "/auth/login"
let Register_Api_Address = "/auth/register"
