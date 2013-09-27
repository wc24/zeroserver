package com.zeroserver.socket {
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import com.zeroserver.core.IReport;
	import com.zeroserver.core.IRouter;
	import com.zeroserver.core.ReportEvent;
	import com.zeroserver.core.ZeroServerErrorCode;
	/**
	 * socket与报体的转换
	 */
	[Event(name="report",type="com.zeroserver.core.ReportEvent")]
	
	public class SocketServer extends Socket implements ISocketServer {
		private var _packetParse:IPacketParse;
		private var receiverPool:Object;
		private var report:SocketReport;
		
		public function SocketServer(packetParse:IPacketParse) {
			_packetParse = packetParse;
			receiverPool = new Object();
			report = new SocketReport()
			if (_packetParse == null) {
				throw(ZeroServerErrorCode.NO_PACK_PARSE)
			}
			addEventListener(ProgressEvent.SOCKET_DATA, socketDataHd);
		}
		
		private function socketDataHd(e:ProgressEvent):void {
			_packetParse.decode(this, report);
			while (report.byteArray != null) {
				dispatchEvent(new ReportEvent(ReportEvent.REPORT, report));
				report = new SocketReport()
				_packetParse.decode(this, report);
			}
		}
		
		public function getReport():IReport {
			return new SocketReport();
		}
		
		public function send(router:IRouter):void {
			var report:ISocketReport = router.report as ISocketReport
			if (report == null) {
				throw(ZeroServerErrorCode.NO_REPORT)
			//} else if (report.byteArray == null || report.byteArray.length == 0) {
			//	throw(ZeroServerErrorCode.NO_PACK_DATA)
			} else if (report.command == "" && report.sign == 0) {
				throw(ZeroServerErrorCode.NO_COMMAND)
			} else {
				_packetParse.encode(this, report)
			}
		}
		
		public function set packetParse(value:IPacketParse):void {
			_packetParse = value;
		}
	}
}