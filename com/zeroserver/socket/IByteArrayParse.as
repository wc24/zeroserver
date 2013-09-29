package com.zeroserver.socket {
	import com.zeroserver.Receiver;
	import com.zeroserver.Sender;
	
	public interface IByteArrayParse {
		function encode(socketReport:ISocketReport):void;
		function decode(socketReport:ISocketReport):void;
	}
}