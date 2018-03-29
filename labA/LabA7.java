package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter a number");
		int x = input.nextInt();    //input
		System.out.println(Integer.toBinaryString(x));
		
		int y = x << 21; //anything before bit #10 becomes 0
		y = y >>> 31;   //anything after bit #10 becomes 0
		System.out.println(Integer.toBinaryString(y));
		
		int z = x << 11; //anything before bit #20 becomes 0
		z = z >>> 31;   //anything after bit #20 becomes 0
		System.out.println(Integer.toBinaryString(z));
		
		int mask; //will be used when referring to the #10 bit
		
		if(y == 0){
			
			mask = Integer.parseInt("1111111111101111111111111111111",2); //all but bit #20 = 1
			x = x & mask;  // forcing 0 into bit#20	
			
		}//if y ==0
		else{
			
			mask = Integer.parseInt("00000000000100000000000000000000",2); //all but bit #20 = 0
			x = x | mask;  // forcing 1 into bit#20	
			
		}//if y == 1
		
		System.out.println(Integer.toBinaryString(x));
		
		
		
       if(z == 0){
			
			mask = 1024;
			mask = ~mask; //all but bit #10 = 1
			x = x & mask;  // forcing 0 into bit#10	
			
		}//if x ==0
		else{
			
			mask = 1024; //all but bit #10 = 0
			x = x | mask;  // forcing 1 into bit#20	
			
		}//if x == 1
		
       System.out.println(Integer.toBinaryString(x));
	}


}

