package cn.ac.iscas.gz.sems.util
{
	import mx.formatters.DateFormatter;
	
	/**
	 * 调试信息类 
	 * @author:	 
	 * @version: 1.0
	 * @date:    2012-7-11 上午10:35:50
	 * @note: 
	 */
	public final class Tracer
	{
		//[Embed(source="cn/ac/iscas/gz/sems/asset/images/warning.png")]
		//public static var IconWarning:Class;
		
		/**
		 * 是否已经输出描述信息
		 */		
		public static var descOnce:Boolean=true;
		
		/**
		 * 描述信息 
		 */		
		public static var descText:String=
			"*************************************************************************************\n" +
			"LQY: Tracer为调试信息类,在发布阶段可以设置Tracer.enable=false;从而关闭调试信息\n" +
			"*************************************************************************************";
		
		/**
		 * 是否启用
		 */		
		public static var enable:Boolean=true;
		
		//定义调试信息模板
		private static const TRACE_TEMPLATE:String="[%s-%s] %s %s"
		private static var mdObject:Object=new Object();
		
		/**
		 * 调试信息输出 
		 * @param msgObj
		 * @param target
		 * @param isAlert
		 * 
		 */		
		public static function debug(msgObj:Object,target:Object=null):void
		{
			var msg:String=msgObj.toString();
			
			if(descOnce){
				trace(descText);
				//ArthropodDebug.log("已经启用Arthropod调试监控");
				//mdebug("已经启用MonsterDebugger调试监控")
				descOnce=false;
			}
			
			if(enable){
				trace(Printf(TRACE_TEMPLATE,"LQY","Debug",DateUtil.getCurrentDateTimeFormat(),msg));
				//ArthropodDebug.log(msg);
				//mdebug(msg,target);
			}
		}
		
		/**
		 * MonsterDebugger调试信息输出 
		 * @param msg
		 * @param target
		 * 
		 */		
		public static function mdebug(msg:String,target:Object=null):void
		{
			/*
			if(target) 	{MonsterDebugger.initialize(target);MonsterDebugger.trace(target,msg);}
			else		{MonsterDebugger.initialize(Tracer.mdObject);MonsterDebugger.trace(Tracer.mdObject,msg);}
			*/
		}

	}
}