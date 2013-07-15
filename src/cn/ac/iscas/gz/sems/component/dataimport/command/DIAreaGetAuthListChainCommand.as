package cn.ac.iscas.gz.sems.component.dataimport.command
{
	import cn.ac.iscas.gz.sems.cairngorm.MessageWrapper;
	import cn.ac.iscas.gz.sems.component.dataimport.business.DIAreaDelegate;
	import cn.ac.iscas.gz.sems.component.dataimport.event.DIAreaEvent;
	import cn.ac.iscas.gz.sems.component.dataimport.model.DIAreaModelLocator;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo;
	import cn.ac.iscas.gz.sems.util.ObjectUtils;
	import cn.ac.iscas.gz.sems.util.Printf;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	/**
	 * 获得授权的区域列表后再关联查询集中控制器列表(联动的过程)数据命令
	 * @author: 
	 * @version: 1.0DIAreaModelLocator
	 * @date: 2013-5-4 上午12:57:27
	 * @note:
	 */
	public class DIAreaGetAuthListChainCommand extends SequenceCommand implements IResponder
	{
		private static const clazzName:String = " [DIAreaGetAuthListChainCommand] ";
		private static const action:String = " [获得授权的区域列表数据列表] ";
		
		/**
		 * 模型定位器
		 */
		protected var areaModelLocator:DIAreaModelLocator;
		
		/**
		 * 构造函数
		 */
		public function DIAreaGetAuthListChainCommand()
		{
			areaModelLocator = DIAreaModelLocator.getInstance();
		}
		
		/**
		 * 通过委托调用远程方法
		 * @param event
		 *
		 */
		// NOTICE  / 2013-5-6 15:04:39 继承(extends SequenceCommand)需要重写 
		override public function execute(event:CairngormEvent):void
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
					
					//构建且执行下一个事件
					buildAndExecNextEvent();
				}
			}
			
			MessageWrapper.makeAndJudgeByKey(action,"mw.di.list.error.get.auth.area",jsonObject.flag, areaModelLocator);
		}
		
		/**
		 * 构建且执行下一个事件
		 */
		private function buildAndExecNextEvent():void
		{
			//下一个事件
			var areaEvent:DIAreaEvent = new DIAreaEvent(DIAreaEvent.GET_ASSO_CONC_LIST);
			areaEvent.dataModel = areaModelLocator.dataModelList.getItemAt(0) as DIAreaVo;
			this.nextEvent = areaEvent;
		
			//执行下一个命令
			executeNextCommand();
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