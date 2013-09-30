package com.zeroserver.core {
	
	public interface IRouter {
		function get report():IReport;
		function set report(value:IReport):void;
		function get usage():uint;
		function get intact():Boolean;
	}
}