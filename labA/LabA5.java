package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter a number");
		int x = input.nextInt();    //input
		
		int z = x << 21; // make bit #10 the MSb
		z = z >>> 31; // make bit #10 the LSb 
		System.out.println(Integer.toBinaryString(z));
		
		int mask = 1024;
		int y = x & mask;
		y = y >> 10; 
		System.out.println(Integer.toBinaryString(y));
	}


}

