package com.zeroserver {
	import com.zeroserver.core.IRouter;
	import com.zeroserver.core.IServer;
	import com.zeroserver.core.SenderEvent;
	import com.zeroserver.core.Transceiver;
	[Event(name="send",type="com.zeroserver.core.SenderEvent")]
	
	public class Sender extends Transceiver implements IRouter {
		private var _server:IServer;
		private var _command:String;
		private var _sign:int;
		
		public function Sender(server:IServer, command:String, sign:int = 0) {
			super(_server)
			_server = server;
			_command = command;
			_sign = sign;
			report = server.getReport();
		}
		
		public function send(sendData:Object):void {
			report.argument = sendData;
			report.command = _command;
			report.sign = _sign;
			used();
			_server.send(this.report);
			dispatchEvent(new SenderEvent(SenderEvent.SEND, this));
		}
		
		public function call(... arg):void {
			send(arg);
		}
		
		public function get server():IServer {
			return _server;
		}
	}
}