package com.zeroserver {
	import com.zeroserver.core.IReport;
	import com.zeroserver.core.IRouter;
	import com.zeroserver.core.IServer;
	import com.zeroserver.core.ReceiverEvent;
	import com.zeroserver.core.ReportEvent;
	import com.zeroserver.core.Transceiver;
	[Event(name="receiver",type="com.zeroserver.core.ReceiverEvent")]
	
	public class Receiver extends Transceiver implements IRouter {
		private var _server:IServer;
		private var _command:String;
		private var _sign:int;
		
		public function Receiver(server:IServer, command:String, sign:int = 0) {
			super(_server)
			_sign = sign;
			_command = command;
			_server = server;
			_server.addEventListener(ReportEvent.REPORT, server_report);
		}
		
		private function server_report(e:ReportEvent):void {
			var report:IReport = e.report
			if (report.command == _command && report.sign == _sign) {
				used();
				receive(report)
			}
		}
		
		public function receive(report:IReport):void {
			this.report = report;
			dispatchEvent(new ReceiverEvent(ReceiverEvent.RECEIV, this));
		}
		
		public function get server():IServer {
			return _server;
		}
	}
}