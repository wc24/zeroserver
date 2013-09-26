package com.zeroserver.socket {
	import com.zeroserver.Receiver;
	import com.zeroserver.Sender;
	
	public interface IByteArrayParse {
		function encode(sender:Sender):void;
		function decode(receiver:Receiver):void;
	}
}