/**
* BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
*
* Copyright (c) 2008 by respective authors (see below).
*
* This program is free software; you can redistribute it and/or modify it under the
* terms of the GNU Lesser General Public License as published by the Free Software
* Foundation; either version 2.1 of the License, or (at your option) any later
* version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT ANY
* WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
* PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
* 
*/
package org.bigbluebutton.modules.video
{
	import org.bigbluebutton.common.IBigBlueButtonModule;
	import org.bigbluebutton.modules.video.control.StartupCommand;
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	/**
	 * 
	 * @author Denis Zgonjanin
	 * 
	 */	
	public class VideoModuleFacade extends Facade implements IFacade
	{
		public static const NAME:String = "VideoModuleFacade";
		
		public static const STARTUP:String = "STARTUP";
		public static const STOP:String     = "STOP";
		
		/**
		 * The constructor. Should never be called, however ActionScript does not support private
		 * constructors. Use the getInstance() method instead. 
		 * 
		 */		
		public function VideoModuleFacade()
		{
			super(NAME);
		}
		
		/**
		 * The getInstance() method of this singleton 
		 * @return 
		 * 
		 */		
		public static function getInstance():VideoModuleFacade{
			if (instanceMap[NAME] == null) instanceMap[NAME] = new VideoModuleFacade();
			return instanceMap[NAME] as VideoModuleFacade;
		}
		
		/**
		 * Maps notifications to command execution 
		 * 
		 */		
		override protected function initializeController():void{
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		/**
		 * Starts up the model of this application 
		 * @param app
		 * 
		 */		
		public function startup(app:IBigBlueButtonModule):void{
			sendNotification(STARTUP, app);
		}

		public function stop(app:IBigBlueButtonModule):void {
			sendNotification(STOP, app);
			removeCore(NAME);
		}	
		
	}
}