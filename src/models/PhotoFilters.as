package models
{
	import spark.filters.ColorMatrixFilter;
	import flash.filters.ConvolutionFilter;
	
	public class PhotoFilters
	{
		private static var colorMatrix:Array = [0,1,0,0,0,
			                                    0,0,1,0,0,
			                                    1,0,0,0,0,
			                                    0,0,0,1,0];
		public static var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter(colorMatrix);
		
		private static var convolutionMatrix:Array = [0, 20, 0,
			                                          20, -80, 20,
			                                          0, 20, 0];
		public static var convolutionFilter:ConvolutionFilter = new ConvolutionFilter(3, 3, convolutionMatrix, 10);
		
		public function PhotoFilters()
		{
		}
	}
}