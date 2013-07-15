package cn.ac.iscas.gz.sems.util
{
	import mx.formatters.DateFormatter;

	/**
	 * 日期工具类
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-18 下午8:23:14
	 * @note:
	 */
	public final class DateUtil
	{
		public static const DEFAULT_PATTERN:String = "YYYY-MM-DD JJ:NN:SS";

		/**
		 * 获得当前日期时间的字符串
		 * @return
		 *
		 */
		public static function getCurrentDateTimeFormat():String
		{
			var dateFormatter:DateFormatter = new DateFormatter();
			dateFormatter.formatString = DEFAULT_PATTERN;
			return dateFormatter.format(new Date());
		}
	}

}
