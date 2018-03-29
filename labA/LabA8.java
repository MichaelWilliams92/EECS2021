package labA;

import java.util.Scanner;
import java.lang.*;

public class LabA8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter a number");
		int x = input.nextInt();    //input
		System.out.println(Integer.toBinaryString(x));
		
		int z = 1 + ~x;
		System.out.println(z);
		System.out.println(Integer.toBinaryString(z));
	}


}
