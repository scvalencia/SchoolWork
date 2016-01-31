import ij.ImagePlus;
import ij.plugin.filter.PlugInFilter;
import ij.process.ImageProcessor;

public class Vertical_Reflection implements PlugInFilter { 
	public int setup (String arg, ImagePlus im) {
		return DOES_8G; // this plugin accepts 8-bit grayscale images
	}

	public void run (ImageProcessor ip) { 
		int rows = ip.getWidth();
		int cols = ip.getHeight();

		int half = rows / 2;

		int i = half;
		while(i < rows) {
			int j = 0;
			while(j < cols) {
				int a = ip.getPixel(rows - i, j);
				ip.putPixel(i, j, a);
				j++;
			}
			i++;
		}
	}
}