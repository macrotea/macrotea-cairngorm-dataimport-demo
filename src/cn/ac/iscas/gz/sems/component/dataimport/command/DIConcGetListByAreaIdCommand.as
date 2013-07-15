package cn.ac.iscas.gz.sems.component.dataimport.command
{
	import cn.ac.iscas.gz.sems.cairngorm.MessageWrapper;
	import cn.ac.iscas.gz.sems.component.dataimport.business.DIConcDelegate;
	import cn.ac.iscas.gz.sems.component.dataimport.event.DIAreaEvent;
	import cn.ac.iscas.gz.sems.component.dataimport.model.DIConcModelLocator;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIAreaVo;
	import cn.ac.iscas.gz.sems.component.dataimport.vo.DIConcVo;
	import cn.ac.iscas.gz.sems.util.ObjectUtils;
	import cn.ac.iscas.gz.sems.util.Printf;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	/**
	 * 根据区域Id获得集中控制器列表数据命令
	 * @author: DIConcModelLocator
	 * @version: 1.0DIConcModelLocator
	 * @date: 2013-5-4 上午12:57:27
	 * @note:
	 */
	public class DIConcGetListByAreaIdCommand implements ICommand, IResponder
	{
		private static const clazzName:String = " [DIConcGetListByAreaIdCommand] ";
		private static const action:String = " [根据区域Id获得集中控制器列表数据] ";
		
		/**
		 * 模型定位器
		 */
		protected var concModelLocator:DIConcModelLocator;
		
		/**
		 * 构造函数
		 */
		public function DIConcGetListByAreaIdCommand()
		{
			concModelLocator = DIConcModelLocator.getInstance();
		}
		
		/**
		 * 通过委托调用远程方法
		 * @param event
		 *
		 */
		public function execute(event:CairngormEvent):void
		{
			var areaEvent:DIAreaEvent = event as DIAreaEvent;
			
			//参数模型
			var areaVo:DIAreaVo = areaEvent.dataModel;
			
			Tracer.debug(Printf("根据 区域Id=%s 获得集中控制器列表数据",areaVo.id));
			
			if(areaVo){
				getDelegate().getConcListByAreaId(areaVo.id);
			}else{
				Tracer.debug(Printf("%s%s,事件中的数据模型为NULL", clazzName, action));
			}
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
				var concVoList:ArrayCollection = new ArrayCollection;
				for(var i:int=0;i<jsonArrayList.length;i++){
					var eachJsonObject:Object = jsonArrayList[i];
					var concVo:DIConcVo = new DIConcVo();
					//同名属性值拷贝
					ObjectUtils.copy(eachJsonObject,concVo);
					concVoList.addItem(concVo);
				}
				
				concModelLocator.dataModelList = concVoList;
				
				if(concModelLocator.dataModelList && concModelLocator.dataModelList.length){
					concModelLocator.resetSelectedConcIndex();
				}
			}
			
			MessageWrapper.makeAndJudgeByKey(action,"mw.di.list.error.get.asso.conc",jsonObject.flag, concModelLocator);
		}
		
		/**
		 * 当出错时处理
		 * @param event
		 *
		 */
		public function fault(event:Object):void
		{
			MessageWrapper.makeFailByKey(Printf("%s失败,错误信息: \n%s", action, event.message.body),"mw.di.list.error.get.asso.conc",true,concModelLocator);
		}
		
		/**
		 * 获得委托
		 */
		protected function getDelegate():DIConcDelegate
		{
			return new DIConcDelegate(this);
		}
		
	}
}