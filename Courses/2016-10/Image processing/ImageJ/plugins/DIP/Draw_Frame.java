import ij.ImagePlus;
import java.util.Random;
import ij.plugin.filter.PlugInFilter;
import ij.process.ImageProcessor;

public class Draw_Frame implements PlugInFilter {

	ImageProcessor ip;
	static final int FRAME_WIDE = 100;

	public int setup(String arg, ImagePlus im) {
		return DOES_8G; // this plugin accepts 8-bit grayscale images
	}

	public void run(ImageProcessor ip) {
		this.ip = ip;

		int w = ip.getWidth();
		int h = ip.getHeight();

		draw(0, w, 0, FRAME_WIDE);
		draw(0, FRAME_WIDE, 0, h);
		draw(w - FRAME_WIDE, w, 0, h);
		draw(0, w, h - FRAME_WIDE, h);
	}

	public void draw(int inith, int finlh, int initw, int finlw) {
		for(int u = inith; u < finlh; u++)
			for (int v = initw; v < finlw; v++)
				ip.putPixel(u, v, 0);	
	}
}