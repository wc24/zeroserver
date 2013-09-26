package com.zeroserver {
	import com.zeroserver.core.AllReport;
	import com.zeroserver.core.IRouter;
	import com.zeroserver.core.IServer;
	import com.zeroserver.core.Transceiver;
	
	public class Sender extends Transceiver implements IRouter {
		private var _server:IServer;
		private var _command:String;
		private var _sign:int;
		
		public function Sender(server:IServer, command:String, sign:int = 0) {
			super(_server)
			_server = server;
			_command = command;
			_sign = sign;
			//_report = new AllReport();
			//report.command = _command;
			//report.sign = _sign;
			_className = "Sender"
		}
		
		public function call(... arg):void {
			report.argument = arg;
			report.command = _command;
			report.sign = _sign;
			used()	//_report = new AllReport();
			//report.command = _command;
			//report.sign = _sign;
			_server.send(this);
		}
		
		public function get server():IServer {
			return _server;
		}
	}
}