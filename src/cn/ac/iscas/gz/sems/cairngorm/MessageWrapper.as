package cn.ac.iscas.gz.sems.cairngorm
{
	import cn.ac.iscas.gz.sems.local.ResourceUtil;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import flash.display.Sprite;
	
	import mx.controls.Alert;

	/**
	 * 消息包装器
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-19 上午11:17:42
	 * @note:
	 */
	public final class MessageWrapper
	{
		/**
		 * 制造消息
		 * @param msg
		 * @param modelLocator
		 */
		public static function make(msg:String, modelLocator:BaseModelLocator=null):void
		{
			Tracer.debug(msg);
			
			if(modelLocator){
				modelLocator.message = msg;
			}
		}
		
		/**
		 * 制造错误消息
		 * 若isAlert为True则弹出
		 * @param msg
		 * @param modelLocator
		 *
		 */
		public static function makeFail(msg:String, modelLocator:BaseModelLocator=null,isAlert:Boolean = true):void
		{
			Tracer.debug(msg);
			
			if(modelLocator){
				modelLocator.message = msg;
			}
			
			if(isAlert){
				Alert.show(
					ResourceUtil.getInstance().getString("ac.operate.failure"), 
					ResourceUtil.getInstance().getString("ac.tip"), 
					Alert.YES
				);
			}
		}
		
		/**
		 * 通过国际化Key制造错误消息
		 * 若isAlert为True则弹出
		 * @param msg
		 * @param modelLocator
		 *
		 */
		public static function makeFailByKey(msg:String,i18nKey:String=null,isAlert:Boolean = true,modelLocator:BaseModelLocator=null,parent:Sprite = null):void
		{
			Tracer.debug(msg);
			
			if(modelLocator){
				modelLocator.message = msg;
			}
			
			if(isAlert){
				if(i18nKey){
					showException(i18nKey);
				}
			}
		}
		
		/**
		 * 窗体显示异常信息 
		 * @param reasonI18NKey
		 * 
		 */		
		public static function showException(descI18NKey:String,parent:Sprite = null):void
		{
			//具体的原因
			var desc:* = ResourceUtil.getInstance().getString(descI18NKey);
			
			// NOTICE  / 2013-5-6 11:02:38 注意undefined的判断
			if( (desc == "undefined") || !desc){
				//无
				desc = ResourceUtil.getInstance().getString("mw.none");
			}
			
			Alert.show(
				//例子:
				//数据请求失败或操作失败!
				//原因:
				//加载区域列表数据失败!
				ResourceUtil.getInstance().getString("mw.exception.desc") + "！\n" + ResourceUtil.getInstance().getString("mw.desc") + "：\n" + desc + "！", 
				ResourceUtil.getInstance().getString("mw.tip"), 
				Alert.OK,
				parent
			);
		}

		/**
		 * 按照判断制造消息 
		 * @param msg
		 * @param judge
		 * @param modelLocator
		 * @param isAlert
		 * 
		 */		
		public static function makeAndJudge(msg:String, judge:Boolean, modelLocator:BaseModelLocator=null):void
		{
			//控制台输出,无需国际化
			msg += judge ? "成功" : "失败";
			
			if(judge){
				make(msg, modelLocator);
			}else{
				makeFail(msg, modelLocator,true);
			}
		}

		/**
		 * 按照判断制造消息 
		 * @param msg
		 * @param judge
		 * @param modelLocator
		 * @param isAlert
		 * 
		 */		
		public static function makeAndJudgeByKey(msg:String,i18nKey:String, judge:Boolean, modelLocator:BaseModelLocator=null):void
		{
			//控制台输出,无需国际化
			msg += judge ? "成功" : "失败";
			
			if(judge){
				make(msg, modelLocator);
			}else{
				makeFailByKey(msg,i18nKey,true,modelLocator);
			}
		}
		
		/**
		 * 获得提示信息 
		 * @return 
		 * 
		 */		
		public static function getTip():String
		{
			return ResourceUtil.getInstance().getString('ac.tip');
		}
	}
}
