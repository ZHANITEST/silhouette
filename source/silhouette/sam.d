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

int I2pSocket_instances_ = 0;

void print_error(string err){
    // -- std.socket.lastSocketError
    writeln(err, "(", lastSocketError() ,")");
}

/*
struct servAddr{
    AddressFamily family; // std.socket;
    string addr;
    uint port;

   this(AddressFamily af, string ad, uint port){
       this.family = af;
       this.addr = ad;
       this.port = port;
   }

}*/

enum SessionStyle{
    RAW = SocketType.RAW,
    DATAGRAM = SocketType.DGRAM,
    STREAM = SocketType.STREAM
}

class I2pSocket{
    Socket skdata;
    AddressInfo info;
    
    this(AddressFamily af, string ad, ushort port){
        // 소켓연결 정보
        this.info.family = af; //-- AddressFamily
        this.info.type = SessionStyle.STREAM; //-- SocketType 
        this.info.protocol = ProtocolType.RAW; //-- ProtocolType
        this.info.address = getAddress(ad, port)[0]; //-- Address

        this.skdata = new Socket(info);
        //this.addr = servAddr(af, ad, port);
        
        if (this.skdata){
            print_error("Failed to initialize std.socket library");
        }
    }

    ~this(){

    }
}