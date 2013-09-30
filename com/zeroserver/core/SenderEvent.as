package com.zeroserver.core {
	import com.zeroserver.Sender;
	import flash.events.Event;
	import com.zeroserver.Receiver;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class SenderEvent extends Event {
		static public const SEND:String = "send";
		private var _sender:Sender;
		
		public function SenderEvent(type:String, sender:Sender, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_sender = sender;
		}
		
		public function get sender():Sender {
			return _sender;
		}
		
		public function set sender(value:Sender):void {
			_sender = value;
		}
	}
}