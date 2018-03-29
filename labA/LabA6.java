package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter a number");
		int x = input.nextInt();    //input
		System.out.println(Integer.toBinaryString(x));  //print x in binary
		
		int mask = 1024;  //bit #10 = 1
		int mask2 = 2048;  //bit #11 = 1
		
		int y = x | mask;
		System.out.println(Integer.toBinaryString(y));  //print y with bit#10 = 1
		
		int z = ~mask2;  //everybit will be 1, bit #11 = 0
		z = y & z;       
		System.out.println(Integer.toBinaryString(z)); //print z with bit#11 = 0 and bit#10 = 1
		
		
		
	}


}

