package cn.ac.iscas.gz.sems.local
{
		import flash.events.Event;
		import flash.events.EventDispatcher;
		import mx.resources.IResourceManager;
		import mx.resources.ResourceManager;
		import mx.controls.Alert;
		
		/**
		 * 登陆界面国际化类，加载字符串以及图片资源
		 * author by xuzhongming 2013-04-07
		 **/ 
		public class ResourceUtil extends EventDispatcher
		{
			private static const BUNDLE_NAME:String = "message";
			
			[Bindable]
			public static var resourceManager:IResourceManager = null;
			
			private static var instance:ResourceUtil = null;
			private static var currentLanguage:String = "zh_CN";
			
			//使用单例模式
			public static function getInstance():ResourceUtil {
				if(instance == null) {
					instance = new ResourceUtil();
					resourceManager = ResourceManager.getInstance();
					resourceManager.initializeLocaleChain([currentLanguage]);
				}
				return instance;
			}
			
			public function changeLanguage(languageName:String):void {
				resourceManager.localeChain.localeChain = [languageName];
				currentLanguage = languageName;
				dispatchChange();
			}
			
			[Bindable("change")]
			public function getImage(resName:String):Class {
				var result:Class = resourceManager.getClass(BUNDLE_NAME, resName, currentLanguage);
				return result;
			}
			
			[Bindable("change")]
			public function getString(resName:String, para:Array = null):String {
				var result:String = resourceManager.getString(BUNDLE_NAME, resName, para, currentLanguage);
				return result;
			}
			
			private function dispatchChange():void
			{
				dispatchEvent(new Event("change"));
			}
	}
}