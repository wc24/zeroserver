package com.zeroserver.socket {
	
	public interface IByteArrayParse {
		function encode(socketReport:ISocketReport):void;
		function decode(socketReport:ISocketReport):void;
	}
}