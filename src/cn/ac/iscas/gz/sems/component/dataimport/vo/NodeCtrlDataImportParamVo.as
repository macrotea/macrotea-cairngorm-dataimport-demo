package cn.ac.iscas.gz.sems.component.dataimport.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	import flash.net.FileReference;
	
	/**
	 * 节点控制器数据导入参数值对象
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 上午12:36:26
	 * @note:
	 */
	[Bindable]
	public class NodeCtrlDataImportParamVo implements IValueObject
	{
		/**
		 * 区域ID
		 */
		public var areaId:Number;
		
		/**
		 * 集中控制器ID
		 */
		public var concId:Number;
		
		/**
		 * 文件路径
		 */
		public var filePath:String;
		
		/**
		 * 导入模式
		 */
		public var importMode:int;
		
		/**
		 * 是否在服务器上保留文件
		 */
		public var isKeepFileOnServer:Boolean;
		
		/**
		 * 文件引用
		 */
		public var fileRef:FileReference;
		
		public function NodeCtrlDataImportParamVo()
		{
		}
		
	}
}