package cn.ac.iscas.gz.sems.component.dataimport.business
{
	import cn.ac.iscas.gz.sems.cairngorm.BaseHttpServiceDelegate;
	import cn.ac.iscas.gz.sems.component.dataimport.DataImportConstants;
	import cn.ac.iscas.gz.sems.util.Printf;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import mx.rpc.IResponder;
	
	/**
	 * 数据导入模块下区域委托
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 下午6:49:50
	 * @note:
	 */
	public class DIAreaDelegate extends BaseHttpServiceDelegate
	{
		private static const clazzName:String = " [DIAreaDelegate] ";
		
		/**
		 * 构造函数
		 * @param responder
		 *
		 */
		public function DIAreaDelegate(responder:IResponder,serviceName:String=null)
		{
			enableRefresh = true;
			super(DataImportConstants.DATA_IMPORT_SERVICE_NAME,responder);
		}
		
		/**
		 * 获得所有授权区域
		 * @param name
		 *
		 */
		public function getAuthAreaList():void
		{
			Tracer.debug(Printf("%s获得所有授权区域" , clazzName));
			
			refreshService("diAreaJsonHttpService");
			asGet().action("areaListOfCurrUser").send();
		}
		
	}
}