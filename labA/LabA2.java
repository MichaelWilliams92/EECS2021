package labA;

	import java.util.Scanner;
	import java.lang.*;

	public class LabA2 {

		public static void main(String[] args) {
			// TODO Auto-generated method stub

			Scanner input = new Scanner(System.in);
			
			System.out.println("Enter a number");
			int a = input.nextInt();    //input
			
		    String s = Integer.toHexString(a);     //s = hex value
			System.out.println(s);
			
			int p = Integer.reverse(a);       //reverses argument
			String q = Integer.toHexString(p);//changes reverse to hex
			System.out.println(q);
			
			int l = Integer.reverseBytes(a);
			String g = Integer.toHexString(l); //reverseBytes, then convert it to hex
			System.out.println(g);
		}


	}
	
