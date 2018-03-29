package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter x:");
		int x = input.nextInt();
		
		System.out.println("Enter y:");
		int y = input.nextInt();
	
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(y));    //print x and y in binary
		
		int z = x & y;// and
		System.out.println(Integer.toBinaryString(z));
		
		 z = x | y; // or
		 System.out.println(Integer.toBinaryString(z));
		 
		 z = x ^ y; // xor
		 System.out.println(Integer.toBinaryString(z));
		 
		 z = ~x; // not
		 System.out.println(Integer.toBinaryString(z));
	}


}

