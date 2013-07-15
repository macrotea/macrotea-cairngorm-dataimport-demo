package cn.ac.iscas.gz.sems.util
{
	import flash.display.DisplayObject;
	
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;
	
	/**
	 * 窗口工具类
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-18 下午4:18:47
	 * @note:
	 */
	public final class WindowUtil
	{
		/**
		 * 关闭窗口 
		 * @param obj
		 * 
		 */		
		public static function closeWin(window:IFlexDisplayObject):void{
			PopUpManager.removePopUp(window);
		}
		
		/**
		 * 显示且居中窗口 
		 * @param obj
		 * 
		 */		
		public static function showAndCenterWin(window:IFlexDisplayObject,
												parent:DisplayObject,
												modal:Boolean = true):void
		{
			PopUpManager.addPopUp(window,parent,modal);
			PopUpManager.centerPopUp(window);
		}
	}
}