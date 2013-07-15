package cn.ac.iscas.gz.sems.cairngorm
{
	import cn.ac.iscas.gz.sems.util.ObjectUtils;
	import cn.ac.iscas.gz.sems.util.Tracer;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.net.URLVariables;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;

	/**
	 * 父级HttpService委托
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-25 上午9:13:34
	 * @note:
	 */
	public class BaseHttpServiceDelegate
	{
		/**
		 * 服务响应处理者
		 */
		private var _responder:IResponder;

		/**
		 * HTTPService实例
		 */
		private var _service:HTTPService;

		/**
		 * 服务名
		 */
		private var _serviceName:String;

		/**
		 * 参数
		 */
		private var _params:URLVariables;

		/**
		 * 是否启用刷新
		 */
		private var _enableRefresh:Boolean = true;

		/**
		 * 构造,获得服务,初始化_params
		 * @param serviceName
		 * @param responder
		 *
		 */
		public function BaseHttpServiceDelegate(serviceName:String, responder:IResponder)
		{
			super();
			this._responder = responder;
			if(serviceName){
				this._serviceName = serviceName;
				this._service = ServiceLocator.getInstance().getHTTPService(_serviceName);
			}else{
				Tracer.debug("当执行BaseHttpServiceDelegate()构造方法时,服务名不能为空");
			}
			this._params = new URLVariables();
		}
		
		/**
		 * 刷新服务
		 * @return
		 *
		 */
		public function refreshService(serviceName:String):BaseHttpServiceDelegate
		{
			if(_enableRefresh){
				this._serviceName = serviceName;
				if(serviceName){
					this._serviceName = serviceName;
					this._service = ServiceLocator.getInstance().getHTTPService(_serviceName);
				}else{
					Tracer.debug("当执行refreshService()方法时,服务名不能为空");
				}
				this._params = new URLVariables();
			}
			return this;
		}

		/**
		 * 以Post方式请求
		 * @return
		 *
		 */
		public function asPost():BaseHttpServiceDelegate
		{
			service.method = "POST";
			return this;
		}

		/**
		 * 以Get方式请求
		 * @return
		 *
		 */
		public function asGet():BaseHttpServiceDelegate
		{
			service.method = "GET";
			return this;
		}

		/**
		 * 设置动作
		 * @param actionName
		 * @return
		 *
		 */
		public function action(actionName:String):BaseHttpServiceDelegate
		{
			params.action = actionName;
			return this;
		}

		/**
		 * 动作 :: 列表
		 * @return
		 *
		 */
		public function list():BaseHttpServiceDelegate
		{
			action("list");
			return this;
		}

		/**
		 * 动作 :: 添加
		 * @return
		 *
		 */
		public function add():BaseHttpServiceDelegate
		{
			action("add");
			return this;
		}

		/**
		 * 动作 :: 删除
		 * @return
		 *
		 */
		public function del():BaseHttpServiceDelegate
		{
			action("delete");
			return this;
		}

		/**
		 * 动作 :: 更新
		 * @return
		 *
		 */
		public function update():BaseHttpServiceDelegate
		{
			action("update");
			return this;
		}

		/**
		 * 动作 :: 编辑
		 * @return
		 *
		 */
		public function edit():BaseHttpServiceDelegate
		{
			action("edit");
			return this;
		}

		/**
		 * 发送
		 * Useage:
		 * 1.
		 * xx.send(['areaId','1','page','1']);
		 * 2.
		 * xx.send(new XXXXVo());
		 * @return
		 *
		 */
		public function send(dynaParam:Object = null):BaseHttpServiceDelegate
		{
			if(dynaParam)
			{

				//处理数组和对象的差异性
				if(dynaParam is Array)
				{

					//转换
					var paramList:Array = dynaParam as Array;

					if(paramList.length % 2 != 0)
					{
						Tracer.debug("当进行HttpService发送时,参数为数组,但是不是成对出现,请修正!如: ['areaId','1','page','1'] ! ");
					}

					//构造参数对象				
					var paramObject:Object = new Object();
					for(var i:int = 0; i < paramList.length; i++)
					{
						var key:String = String(paramList[i]);
						var value:String = String(paramList[i + 1]);
						paramObject[key] = value;
						i++;
					}

					ObjectUtils.copy(paramObject, _params);
				}
				else
				{
					//若是对象,直接copy
					ObjectUtils.copy(dynaParam, _params);
				}
			}

			/*调用服务且注册回调处理者*/
			var token:AsyncToken = service.send(_params);
			token.addResponder(_responder);

			return this;
		}

		/* ------------------------ Getter --------------------- */

		public function get responder():IResponder
		{
			return _responder;
		}

		public function get service():HTTPService
		{
			return _service;
		}

		public function get serviceName():String
		{
			return _serviceName;
		}

		public function get params():URLVariables
		{
			return _params;
		}
		
		public function get enableRefresh():Boolean
		{
			return _enableRefresh;
		}

		public function set enableRefresh(value:Boolean):void
		{
			_enableRefresh = value;
		}
	}
}
