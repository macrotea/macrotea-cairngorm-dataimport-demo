package cn.ac.iscas.gz.sems.component.dataimport.command
{
	import cn.ac.iscas.gz.sems.cairngorm.MessageWrapper;
	import cn.ac.iscas.gz.sems.component.dataimport.business.DIAreaDelegate;
	import cn.ac.iscas.gz.sems.component.dataimport.model.DIAreaModelLocator;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo;
	import cn.ac.iscas.gz.sems.util.ObjectUtils;
	import cn.ac.iscas.gz.sems.util.Printf;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	/**
	 * 获得授权的区域列表数据命令
	 * @author: DIAreaModelLocator
	 * @version: 1.0DIAreaModelLocator
	 * @date: 2013-5-4 上午12:57:27
	 * @note:
	 */
	public class DIAreaGetAuthListCommand implements ICommand, IResponder
	{
		private static const clazzName:String = " [DIAreaGetAuthListCommand] ";
		private static const action:String = " [获得授权的区域列表] ";
		
		/**
		 * 模型定位器
		 */
		protected var areaModelLocator:DIAreaModelLocator;
		
		/**
		 * 构造函数
		 */
		public function DIAreaGetAuthListCommand()
		{
			areaModelLocator = DIAreaModelLocator.getInstance();
		}
		
		/**
		 * 通过委托调用远程方法
		 * @param event
		 *
		 */
		public function execute(event:CairngormEvent):void
		{
			Tracer.debug("查询授权的区域列表数据");
			getDelegate().getAuthAreaList();
		}
		
		/**
		 * 当正确返回数据时处理
		 * @param event
		 *
		 */
		public function result(event:Object):void
		{
			Tracer.debug(Printf("%s%s,服务器返回数据: \n%s", clazzName, action, event.result));
			
			/*获得JSON数据对象*/
			var jsonObject:Object = ObjectUtils.toJsonObject(event.result);
			
			if(jsonObject.flag){
				/*遍历且填充DIAreaVo列表*/
				var jsonArrayList:ArrayCollection = new ArrayCollection(jsonObject.data);
				var areaVoList:ArrayCollection = new ArrayCollection;
				for(var i:int=0;i<jsonArrayList.length;i++){
					var eachJsonObject:Object = jsonArrayList[i];
					var areaVo:DIAreaVo = new DIAreaVo();
					//同名属性值拷贝
					ObjectUtils.copy(eachJsonObject,areaVo);
					areaVoList.addItem(areaVo);
				}
				
				areaModelLocator.dataModelList = areaVoList;
				
				if(areaModelLocator.dataModelList && areaModelLocator.dataModelList.length){
					areaModelLocator.resetSelectedAreaIndex();
					areaModelLocator.actionButtonEnable = true;
				}
			}
			
			MessageWrapper.makeAndJudgeByKey(action,"mw.di.list.error.get.auth.area",jsonObject.flag, areaModelLocator);
		}
		
		/**
		 * 当出错时处理
		 * @param event
		 *
		 */
		public function fault(event:Object):void
		{
			MessageWrapper.makeFailByKey(Printf("%s失败,错误信息: \n%s", action, event.message.body),"mw.di.list.error.get.auth.area",true,areaModelLocator);
		}
		
		/**
		 * 获得委托
		 */
		protected function getDelegate():DIAreaDelegate
		{
			return new DIAreaDelegate(this);
		}
		
	}
}