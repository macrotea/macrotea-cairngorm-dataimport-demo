package cn.ac.iscas.gz.sems.component.dataimport
{
	import flash.net.FileFilter;

	/**
	 * 数据导入常量配置
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-3 下午11:24:31
	 * @note:
	 */
	public final class DataImportConstants
	{
		/**
		 * 数据导入默认HttpService服务名
		 */
		public static const DATA_IMPORT_SERVICE_NAME:String = "dataImportHttpService";

		/**
		 * 默认状态名
		 */
		public static const DEFAULT_STATE_NAME:String = "defaultState";

		/**
		 * 上传字段
		 */
		public static var DEFAULT_UPLOAD_FIELDNAME:String = "uploadFile";

		/**
		 * 上传文件限定扩展名
		 */
		public static var EXT_NAME_XML:String = "*.xls;*.xlsx";

		/**
		 * 上传文件限定扩展文件过滤器
		 */
		public static var FILE_FILTER_XML:FileFilter = new FileFilter("Excel文件(" + EXT_NAME_XML + ")", EXT_NAME_XML);

		/**
		 * 上传导入动作名
		 */
		public static var FILE_IMPORT_ACTION:String = "import";

		/**
		 * 最大文件选择数
		 */
		public static var MAX_FILE_SELECT:uint = 1;

		/**
		 * 模式: 回滚
		 */
		public static const MODE_ROLLBACK:Number = 2;

		/**
		 * 模式: 仅导入正确的记录
		 */
		public static const MODE_ONLY_CORRECT:Number = 1;
		
		/**
		 * 集中控制器数据导入URL
		 */
		public static const CONC_DATA_IMPORT_URL:String = "/sems/concDataImport.do";
		
		/**
		 * 节点控制器数据导入URL
		 */
		public static const NODECTRL_DATA_IMPORT_URL:String = "/sems/nodeCtrlDataImport.do";
	}
}
