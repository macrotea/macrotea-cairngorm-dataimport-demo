package cn.ac.iscas.gz.sems.component.dataimport.model
{
	import cn.ac.iscas.gz.sems.cairngorm.BaseModelLocator;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIConcVo;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * 数据导入模块集中器模型定位器
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 下午6:24:27
	 * @note:
	 */
	[Bindable]
	public class DIConcModelLocator extends BaseModelLocator
	{
		/**
		 * 报警配置数据列表 
		 */		
		[ArrayElementType("cn.ac.iscas.gz.sems.component.dataimport.vo.DIConcVo")]
		public var dataModelList:ArrayCollection = new ArrayCollection();
		
		/**
		 * 报警配置数据模型 
		 */		
		public var dataModel:DIConcVo;
		
		/**
		 * 选中的集中控制器的下标
		 */		
		public var selectedConcIndex:int = 0;
		
		/**
		 * 重置默认选中
		 * @return 
		 * 
		 */		
		public function resetSelectedConcIndex():void
		{
			selectedConcIndex = 0;
		}
		
		/* ------------------------ 单例逻辑 --------------------- */
		
		/**
		 * 单例 
		 */		
		private static var instance:DIConcModelLocator=null;
		
		/**
		 * 构造时保证单例 
		 * @param error
		 * 
		 */		
		public function DIConcModelLocator(error:SingletonEnforcer):void{
			if(error==null){
				throw new Error("DIConcModelLocator只能存在一个实例!");
			}
		}
		
		/**
		 * 获得单例 
		 * @return 
		 * 
		 */		
		public static function getInstance():DIConcModelLocator
		{
			if(instance == null)
			{
				instance=new DIConcModelLocator(new SingletonEnforcer());
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
