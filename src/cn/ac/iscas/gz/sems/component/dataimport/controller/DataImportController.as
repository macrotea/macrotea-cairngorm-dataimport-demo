package cn.ac.iscas.gz.sems.component.dataimport.controller
{
	import cn.ac.iscas.gz.sems.component.dataimport.command.DIAreaGetAuthListChainCommand;
	import cn.ac.iscas.gz.sems.component.dataimport.command.DIAreaGetAuthListCommand;
	import cn.ac.iscas.gz.sems.component.dataimport.command.DIConcGetListByAreaIdCommand;
	import cn.ac.iscas.gz.sems.component.dataimport.event.DIAreaEvent;
	
	import com.adobe.cairngorm.control.FrontController;
	
	/**
	 * 数据导入控制器
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 上午12:55:11
	 * @note:
	 */
	public class DataImportController extends FrontController
	{
		/**
		 * 构造函数 
		 */		
		public function DataImportController()
		{
			registerCommands();
		}
		
		/**
		 * 注册命令 
		 */		
		public function registerCommands():void
		{
			this.addCommand(DIAreaEvent.GET_AUTH_AREA_LIST_CHAIN, DIAreaGetAuthListChainCommand);
			this.addCommand(DIAreaEvent.GET_AUTH_AREA_LIST, DIAreaGetAuthListCommand);
			this.addCommand(DIAreaEvent.GET_ASSO_CONC_LIST, DIConcGetListByAreaIdCommand);
		}
	}
}