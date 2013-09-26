package com.zeroserver.socket {
	import com.zeroserver.core.IReport;
	import com.zeroserver.core.IRouter;
	import com.zeroserver.core.IServer;
	
	public interface ISocketServer extends IServer {
		function set packetParse(value:IPacketParse):void;
		
		
		//function set byteArrayParse(value:IByteArrayParse):void;
	}
}