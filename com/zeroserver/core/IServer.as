package com.zeroserver.core {
	import flash.events.IEventDispatcher;
	[Event(name="report",type="com.zeroserver.core.ReportEvent")]
	
	public interface IServer extends IEventDispatcher {
		function get connected():Boolean;
		function get timeout():uint;
		function set timeout(value:uint):void;
		function send(report:IReport):void;
		function getReport():IReport;
	}
}