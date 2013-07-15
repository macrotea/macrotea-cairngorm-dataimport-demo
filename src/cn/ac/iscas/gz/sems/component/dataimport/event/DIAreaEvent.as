package cn.ac.iscas.gz.sems.component.dataimport.event
{
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	/**
	 * 数据导入模块下区域事件
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 上午12:50:50
	 * @note:
	 */
	public class DIAreaEvent extends CairngormEvent
	{
		/**
		 * 获得授权的区域列表
		 */		
		public static var GET_AUTH_AREA_LIST:String = "getAuthAreaList";
		
		/**
		 * 获得授权的区域列表(链式事件)
		 */		
		public static var GET_AUTH_AREA_LIST_CHAIN:String = "getAuthAreaListChain";
		
		/**
		 * 获得区域关联的集中控制器列表
		 */		
		public static var GET_ASSO_CONC_LIST:String = "getAssoConcList";
		
		/**
		 * 数据模型 ::DIAreaVo
		 */		
		public var dataModel:DIAreaVo;
		
		/**
		 * 构造函数 
		 * @param type
		 * @param alarmConfigVo
		 * 
		 */		
		public function DIAreaEvent(type:String)
		{
			super(type);
		}
		
		/**
		 * 重写克隆方法 
		 * @return 
		 * 
		 */		
		override public function clone():Event
		{
			return new DIAreaEvent(this.type);
		}
	}
}