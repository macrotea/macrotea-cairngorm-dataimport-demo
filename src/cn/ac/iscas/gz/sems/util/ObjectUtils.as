package cn.ac.iscas.gz.sems.util
{
	import com.adobe.serialization.json.JSON;
	
	import mx.collections.ArrayCollection;

	/**
	 * 对象工具类
	 * @author: 
	 * @version: 1.0
	 * @date: 2013-4-17 上午11:04:42
	 * @note:
	 */
	public final class ObjectUtils
	{
		/**
		 * 是否启用轨迹跟踪调试信息
		 */ 
		public static const enableTrace:Boolean = true;
		
		public function ObjectUtils()
		{
		}
		
		/**
		 * 将源对象的属性值拷贝到目标对象的同名属性中, ignore数组为需被过滤的属性名
		 * @param source
		 * @param target
		 * @param ignore
		 * @return
		 *
		 */
		public static function copy(source:Object, target:*, ignore:Array = null):*
		{
			if(target is Class)
			{
				target = new target();
			}
			
			//遍历属性且赋值
			for(var _name:* in source)
			{
				// 如果在忽略列表中，则跳过
				if(ignore && ignore.indexOf(_name) != -1)
				{
					continue;
				}
				try
				{
					if(typeof(target[_name]) == "number")
					{
						target[_name] = Number(source[_name]);
					}
					else
					{
						target[_name] = source[_name];
					}
				}
				catch(err:Error)
				{
					if(enableTrace)
					{
						trace("[ ObjectUtil ] : " + err.message);
					}
				}
			}
			
			return target;
		}
		
		/**
		 * 将源对象的属性值拷贝到目标对象的同名属性中, ignore数组为需被过滤的属性名
		 * @param source
		 * @param target
		 * @param ignore
		 * @return
		 *
		 */
		public static function copyBean(source:Object, target:*, ignore:Array = null):*
		{
			if(target is Class)
			{
				target = new target();
			}
			
			//反射
			var typeDesc:TypeDescription = TypeDescriptor.describeType(source);
			var propArray:Array = typeDesc.properties;
			trace("反射类: " + typeDesc.name);
			
			for(var i:int = 0 ; i < propArray.length ; i++){
				var propName:String = String(propArray[i]);
				var propValue:Object = source[propName];
				trace( ' -> ' + propName + ' : ' + propValue);
				
				if(propValue != null)
				{
					if(typeof(propValue) == "number")
					{
						target[propName] = Number(propValue);
					}
					else
					{
						target[propName] = propValue;
					}
				}
			}
			
			return target;
		}
		
		/**
		 * 把响应的JSON数据转换成JSON对象
		 * @param result
		 * @return 
		 * 
		 */
		public static function toJsonObject(result:Object):Object
		{
			var rawJsonText:String = String(result);
			var jsonObject:Object = (JSON.decode(rawJsonText) as Object);
			return jsonObject;
		}
		
		/**
		 * 把响应的JSON数据转换成JSON对象集合
		 * @param result
		 * @return 
		 * 
		 */
		public static function toJsonObjectList(result:Object):ArrayCollection
		{
			var rawJsonText:String = String(result);
			var array:Array = (JSON.decode(rawJsonText) as Array);
			var jsonArrayList:ArrayCollection = new ArrayCollection(array);
			return jsonArrayList;
		}
	}
}
