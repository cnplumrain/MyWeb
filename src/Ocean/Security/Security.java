package Ocean.Security;

import java.util.Random;

public class Security {
	public static String Encode(String str){
		Random random= new Random();
		int ranInt=random.nextInt(26);
		char chr1=ranInt>13?(char)(ranInt+65):(char)(ranInt+97);
		ranInt=random.nextInt(26);
		char chr2=ranInt>13?(char)(ranInt+65):(char)(ranInt+97);
		return chr1+str+chr2;
	}
	public static String Decode(String str){
		return str.substring(1,str.length()-2);
	}
}
