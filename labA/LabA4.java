package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter a number");
		int x = input.nextInt();    //input
		
		System.out.println(Integer.toBinaryString(x));
		
		int z = x << 2; // logical left shift
		System.out.println(z);
		System.out.println(Integer.toBinaryString(z));
		 z = x >>> 2; // logical right shift
		System.out.println(z);
		System.out.println(Integer.toBinaryString(z));
		 z = x >> 2; // arithmetic right shift 
		 System.out.println(z);
		 System.out.println(Integer.toBinaryString(z));
	}


}

