// Copyright (c) 2018 ZHANITEST
// Copyright (c) 2017 The I2P Project
// Copyright (c) 2013-2015 The Anoncoin Core developers
// Copyright (c) 2012-2013 giv
// Distributed under the LGPLv3 software license, see the accompanying
// file LICENSE or https://opensource.org/licenses/lgpl-3.0.html
//--------------------------------------------------------------------------------------------------

module silhouette.sam;

import std.stdio;
import std.socket;
// Was 65536, seemed unnecessarily large
immutable short SAM_BUFSIZE =            4096;
immutable short I2P_DESTINATION_SIZE =   516;

int I2pSocket_instances_ = 0

class SAM{
    static void print_error(string err){
        // -- std.socket.lastSocketError
        writeln(err, "(", lastSocketError() ,")");
    }
}

class I2pSocket{
    Socket skdata;  
    this(){
        this.skdata = new Socket();
        // wsdata는 skdata로 치환
        int ret = WSAStartup(MAKEWORD(2,2), &wsadata);
        
        /*
        if (ret != NO_ERROR)
        print_error("Failed to initialize std.socket library");
        */
    }

    ~this(){

    }
}