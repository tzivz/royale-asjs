////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.textLayout.edit 
{
	import org.apache.flex.textLayout.elements.ITextFlow;
	
	// [ExcludeClass]
	/** 
	 * The MementoList class is a meta-memento.  It encapuslates the concept of having a sequence of mementos behave as a memento.
	 * 
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @langversion 3.0
	 */

	public class MementoList implements IMemento
	{
		private var _mementoList:Array;
		/**
		 * MementoList is a memento made of a list of other mementos
		 */
		public function MementoList(textFlow:ITextFlow)
		{ 
		}
		
		public function push(memento:IMemento):void
		{
			if (memento)
				mementoList.push(memento);
		}
		
		private function get mementoList():Array
		{
			if(!_mementoList)
				_mementoList = [];
			
			return _mementoList;
		}
		
		public function undo():*
		{
			var retVal:Array = [];
			if(_mementoList)
			{
				_mementoList.reverse();
				for each (var memento:IMemento in  _mementoList)
					retVal.push(memento.undo());
				_mementoList.reverse();
			}
			
			return retVal; 
		}
		
		public function redo():*
		{
			var retVal:Array = [];
			for each (var memento:IMemento in  _mementoList)
				retVal.push(memento.redo());
			return retVal;	
		}
	}
}