import ij.ImagePlus;
import java.util.Random;
import ij.plugin.filter.PlugInFilter;
import ij.process.ImageProcessor;

public class Draw_Frame implements PlugInFilter {

	ImageProcessor ip;

	public int setup(String arg, ImagePlus im) {
		return DOES_8G; // this plugin accepts 8-bit grayscale images
	}

	public void run(ImageProcessor ip) {
		this.ip = ip;

		int w = ip.getWidth();
		int h = ip.getHeight();

		draw(0, w, 0, 100);
		draw(1, 100, 0, h);
		draw(w - 100, w, 0, h);
		draw(0, w, h - 100, h);
	}

	public void draw(int inith, int finlh, int initw, int finlw) {
		for(int u = inith; u < finlh; u++){ 
			for (int v = initw; v < finlw; v++) {
				ip.putPixel(u, v, 0); // invert 
			}
		}	
	}
}