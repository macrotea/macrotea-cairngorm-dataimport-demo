package cn.ac.iscas.gz.sems.component.dataimport.model
{
	import cn.ac.iscas.gz.sems.cairngorm.BaseModelLocator;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * 数据导入模块区域模型定位器
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 下午6:24:27
	 * @note:
	 */
	[Bindable]
	public class DIAreaModelLocator extends BaseModelLocator
	{
		/**
		 * 报警配置数据列表 
		 */		
		[ArrayElementType("cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo")]
		public var dataModelList:ArrayCollection = new ArrayCollection();
		
		/**
		 * 报警配置数据模型 
		 */		
		public var dataModel:DIAreaVo;
		
		/**
		 * 选中的区域的下标
		 */		
		public var selectedAreaIndex:int = 0;
		
		/**
		 * 核心动作按钮是否启用
		 */		
		public var actionButtonEnable:Boolean = false;
		
		/**
		 * 重置默认选中
		 * @return 
		 * 
		 */		
		public function resetSelectedAreaIndex():void
		{
			selectedAreaIndex = 0;
		}
		
		/* ------------------------ 单例逻辑 --------------------- */
		
		/**
		 * 单例 
		 */		
		private static var instance:DIAreaModelLocator=null;
		
		/**
		 * 构造时保证单例 
		 * @param error
		 * 
		 */		
		public function DIAreaModelLocator(error:SingletonEnforcer):void{
			if(error==null){
				throw new Error("DIAreaModelLocator只能存在一个实例!");
			}
		}
		
		/**
		 * 获得单例 
		 * @return 
		 * 
		 */		
		public static function getInstance():DIAreaModelLocator
		{
			if(instance == null)
			{
				instance=new DIAreaModelLocator(new SingletonEnforcer());
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
