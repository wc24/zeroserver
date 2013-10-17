package com.zeroserver.core {
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Report implements IReport {
		private var _command:String;
		private var _argument:Object;
		private var _sign:uint;
		
		public function Report() {
		}
		
		/* INTERFACE com.zeroserver.core.IReport */
		public function get command():String {
			return _command;
		}
		
		public function set command(value:String):void {
			_command = value;
		}
		
		public function set argument(value:Object):void {
			_argument = value;
		}
		
		public function get argument():Object {
			return _argument;
		}
		
		public function get sign():uint {
			return _sign;
		}
		
		public function set sign(value:uint):void {
			_sign = value;
		}
	}
}