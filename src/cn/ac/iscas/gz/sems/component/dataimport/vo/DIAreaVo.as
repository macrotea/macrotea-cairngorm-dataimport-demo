package cn.ac.iscas.gz.sems.component.dataimport.vo
{
	import cn.ac.iscas.gz.sems.cairngorm.IdLabelVo;
	
	import com.adobe.cairngorm.vo.IValueObject;
	
	/**
	 * 数据导入模块 区域项值对象
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-5-4 下午6:25:21
	 * @note:
	 */
	[Bindable]
	public class DIAreaVo extends IdLabelVo implements IValueObject 
	{
		
		public function DIAreaVo()
		{
			super();
		}
	}
}