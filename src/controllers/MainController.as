package controllers
{
	import flash.display.BitmapData;
	import flash.events.MediaEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Camera;
	import flash.media.CameraRoll;
	import flash.media.CameraUI;
	import flash.media.MediaType;
	import flash.media.Video;
	
	import mx.core.UIComponent;
	
	import spark.components.Image;
	import spark.components.Label;

	public class MainController
	{
		public function MainController()
		{
		}
		
		public static function cameraRollClickHandler(image:Image, info:Label):void
		{
			if (CameraRoll.supportsBrowseForImage)
			{
				var cameraRoll:CameraRoll = new CameraRoll();
				cameraRoll.addEventListener(MediaEvent.SELECT, function(event:MediaEvent):void {
					image.source = event.data.file.url;
				});
				
				cameraRoll.browseForImage();
			}
			else
			{
				info.text = "CameraRoll not supported";
			}
		}
		
		public static function cameraUIClickHandler(image:Image, info:Label):void
		{
			if (CameraUI.isSupported)
			{
				var cameraUI:CameraUI = new CameraUI();
				cameraUI.addEventListener(MediaEvent.COMPLETE, function(event:MediaEvent):void {
					image.source = event.data.file.url;
				});

				cameraUI.launch(MediaType.IMAGE);
			}
			else
			{
				info.text = "CameraUI not supported";
			}
		}
		
		public static function cropClickHandler(image:Image):void
		{
			var bitmapData:BitmapData = new BitmapData(400, 300, false);
			bitmapData.copyPixels(image.bitmapData, new Rectangle(50, 50, 400, 300), new Point(0, 0));
			
			image.source = bitmapData;
		}
		
		public static function initCamera(uic:UIComponent):void
		{
			var v:Video = new Video(400, 300);
			uic.addChild(v);
			var c:Camera = Camera.getCamera();
			c.setMode(400, 300, 10);
			v.attachCamera(c);
		}
	}
}