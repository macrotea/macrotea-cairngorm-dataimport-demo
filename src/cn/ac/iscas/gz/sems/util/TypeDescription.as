package cn.ac.iscas.gz.sems.util
{

	/**
	 *
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-25 下午8:25:29
	 * @note:
	 */
	public class TypeDescription
	{
		/**
		 * 类的属性列表, 包括访问器 (accessor) 和变量 (variable)
		 */
		public var properties:Array; /* of String */
		
		/**
		 * 类名
		 */
		public var name:String;

		/**
		 * 由 flash.utils.describeType() 获取的原始 XML 数据
		 */
		public var typeInfo:XML;

		public function TypeDescription()
		{
		}
	}
}
