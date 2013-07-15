package cn.ac.iscas.gz.sems.component.dataimport.model
{
	import cn.ac.iscas.gz.sems.cairngorm.BaseModelLocator;
	
	/**
	 * 节点控制器数据导入模块视图状态模型定位器
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 下午6:24:27
	 * @note:
	 */
	[Bindable]
	public class DINodeCtrlViewStateModelLocator extends BaseModelLocator
	{
		public static const STATE_DEFAULT:String = "DefaultState";
		public static const STATE_IMPORTING:String = "ImportingState";
		public static const STATE_IMPORTFINISH:String = "ImportFinishState";
		
		public var state:String = STATE_DEFAULT;
		
		/**
		 * 切换到默认状态
		 * @return 
		 * 
		 */		
		public function toDefault():void
		{
			state = STATE_DEFAULT;
		}
		
		/**
		 * 切换到导入中状态
		 * @return 
		 * 
		 */		
		public function toImporting():void
		{
			state = STATE_IMPORTING;
		}
		
		/**
		 * 切换到导入完成状态
		 * @return 
		 * 
		 */		
		public function toImportFinish():void
		{
			state = STATE_IMPORTFINISH;
		}
		
		/* ------------------------ 单例逻辑 --------------------- */
		
		/**
		 * 单例 
		 */		
		private static var instance:DINodeCtrlViewStateModelLocator=null;
		
		/**
		 * 构造时保证单例 
		 * @param error
		 * 
		 */		
		public function DINodeCtrlViewStateModelLocator(error:SingletonEnforcer):void{
			if(error==null){
				throw new Error("DIViewStateModelLocator只能存在一个实例!");
			}
		}
		
		/**
		 * 获得单例 
		 * @return 
		 * 
		 */		
		public static function getInstance():DINodeCtrlViewStateModelLocator
		{
			if(instance == null)
			{
				instance=new DINodeCtrlViewStateModelLocator(new SingletonEnforcer());
			}
			return instance;
			
		}
	}
}

/**
 * 单例强制类 
 * @author 
 * 
 */
class SingletonEnforcer{}
