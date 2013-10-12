package com.zeroserver.socket {
	import com.zeroserver.core.IReport;
	import com.zeroserver.core.ReportEvent;
	import com.zeroserver.core.ZeroServerErrorCode;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	/**
	 * socket与报体的转换
	 */
	[Event(name="report",type="com.zeroserver.core.ReportEvent")]
	
	public class SocketServer extends Socket implements ISocketServer {
		private var _packetParse:IPacketParse;
		private var receiverPool:Object;
		private var report:SocketReport;
		private var _byteArrayParse:IByteArrayParse;
		
		public function SocketServer(packetParse:IPacketParse, byteArrayParse:IByteArrayParse = null) {
			_packetParse = packetParse;
			_byteArrayParse = byteArrayParse;
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
				if (_byteArrayParse != null) {
					_byteArrayParse.decode(report);
				}
				dispatchEvent(new ReportEvent(ReportEvent.REPORT, report));
				report = new SocketReport()
				_packetParse.decode(this, report);
			}
		}
		
		public function getReport():IReport {
			return new SocketReport();
		}
		
		public function send(report:IReport):void {
			var socketReport:ISocketReport = report as ISocketReport
			if (socketReport == null) {
				throw(ZeroServerErrorCode.NO_REPORT)
			} else if (socketReport.command == "" && socketReport.sign == 0) {
				throw(ZeroServerErrorCode.NO_COMMAND)
			} else {
				if (_byteArrayParse != null) {
					_byteArrayParse.encode(socketReport);
				}
				_packetParse.encode(this, socketReport)
			}
		}
		
		public function set packetParse(value:IPacketParse):void {
			_packetParse = value;
		}
	}
}