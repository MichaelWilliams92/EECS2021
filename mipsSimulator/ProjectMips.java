/**
 * Name:  Michael Williams
 * Student ID:  211087798
 * Course:  EECS 2021
 * Course Instructor:  Muhktar Aebolaze 
 */

package MipsProject;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ProjectMips {
	
	static int register[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	                  //creates an array of 32 registers, all initialized at 0
			
	static  int memory[] = new int[50];
	
	static Scanner input;
	
	
	/*
	 * main method/tester.  This main method focuses on taking the input from the user, and sending
	   each line over to another method to convert it to binary and execute instructions.
	  After that it is returned here and the registers are printed out.
	 * 
	 */
	public static void main(String [] args){
		
		//System.out.println(System.getProperty("user.dir"));
		
		
		Scanner x = new Scanner(System.in);
		System.out.println("Enter file name \nMake sure you include extension as well.");
		System.out.println("And make sure file is in directory " + System.getProperty("user.dir"));
		String fileName = x.nextLine();
		
		//The above will take a file from user, assuming it is in the requested format
		
	    int mode = 0;  //determines mode
	    int line = 0;  //used to distinguish first line from all others
	    
		
File file = new File(fileName); 
		
		try {
	       input = new Scanner(file);

	        while(input.hasNextLine()){                
	        	                                      
	        	
	        	if(line == 0){
	        		mode = input.nextInt();
	        		input.nextLine();
	        	    line ++;
	        	}//at first line take mode value for later
	        	
	        	else{
	        		
	        	    execute(input.nextLine());//will send Line over for steps 2 and 3
	        		
	        		if(mode == 1){
	        			
                        printReg();	        			
	        		
	        		}//at this point if mode = 1, print out all registers
	        	
	        	}// else loop
	   

	        }//while loop to traverse through file

	    } catch (FileNotFoundException e1) {
	            System.out.println("File not found.");
	    }//catch if file is not found
		
		//the try catch statement above will read the file, 1 line at a time 
		
		if(mode == 0){
		
			printReg();
			
		}//At this point if mode = 0, print out all registers, else do nothing.
		//System.out.println(mode);
		
		
	}//main
	
	
	/**
	 * execute will take the hex string sent from the user.  This method combines steps 2 and 3.
	It will decode the hex string into binary, and break the binary code into its instructions
	After that it will execute the said instructions.
	 * 
	 * @param hex
	 *         String to be taken and decoded for use in the instruction set below
	 */
	public static void execute(String hex){
	
	    String num = Long.toBinaryString(Integer.parseInt(hex, 16)); 
	    String mask = "00000000000000000000000000000000";
	    String binary = mask + num;  //binary now contains the binary, 32-bit version of hex.
	    binary = binary.substring(binary.length() - 32, binary.length());  // take the right-most 32 digits
	    
	    int op = Integer.parseInt(binary.substring(0, 6), 2);
	    int rs = Integer.parseInt(binary.substring(6, 11), 2);
	    int rt = Integer.parseInt(binary.substring(11, 16), 2);
	    int rd = Integer.parseInt(binary.substring(16, 21), 2);
	    int shamt = Integer.parseInt(binary.substring(21, 26), 2);
	    int funct = Integer.parseInt(binary.substring(26), 2);
	    int address = Integer.parseInt(binary.substring(16), 2);
	    
	    if( op == 0){
	    	
	    	
	    	if(funct == 0){
	    		
	    		register[rd] = register[rt] << shamt;
	    		
	    	}//if funct == sll
	    	
	    	else if(funct == 2){
	    		
	    		register[rd] = register[rt] >>> shamt;
	    		
	    	}//if funct == srl
	    	
	    	else if(funct == 33){
	    		
	    		register[rd] = register[rs] + register[rt];
	    		
	    	}//if funct == addu
	    	
	    	else if(funct == 32){
	    		
	    		register[rd] = register[rs] + register[rt];
	    	//	System.out.println("add");
	    		
	    	}//if funct == add
	    	
	    	else if(funct == 36){
	    		
	    		register[rd] = register[rs] & register[rt];
	    	//	System.out.println("and");
	    		
	    	}//if funct == and
	    	
	    	else if(funct == 39){
	    		
	    		register[rd] = ~(register[rs] | register[rt]);
	    	//	System.out.println("nor");
	    		
	    	}//if funct == nor
	    	
	    	else if(funct == 42){
	    		
	    		int x;
	    		
	    		if(register[rs] < register[rt]){x = 1;}
	    		else{x = 0;}
	    			 
	    		register[rd] = x;
	    	//	System.out.println("slt");
	    		
	    	}//if funct == slt
	    	
	    	else if(funct == 43){
	    		
	            int x;
	    		
	    		if(register[rs] < register[rt]){x = 1;}
	    		else{x = 0;}
	    			 
	    		register[rd] = x;
	    		
	    	//	System.out.println("sltu");
	    		
	    	}//if funct == sltu
	    	
	    	else if(funct == 12){
	    		
	    		System.out.println("Program ended by syscall");
	    		System.out.println();
	    		
	    		while(input.hasNextLine()){
	    			input.nextLine();
	    		}//go through the rest of the code, doing nothing.  Ie, dont let any other commands follow
	    		
	    		//stop everything at this point
	    		return;
	    		
	    	}//if syscall
	    	
	    	else{
	    		
	    		System.out.println("funct value in " + hex + "\nwas not recognized.  No action will be done");
	    		
	    	}//if funct code is not recognized
	    	
	    	
	    }//if op == 0
	    
	    else if(op == 9){
	    	
	    	register[rt] = register[rs] + address;
	    	
	    //	System.out.println("addiu");
	    	
	    }//if op is addiu
	    
	    else if(op == 10){
	    	
	    	int x;
    		
    		if(register[rs] < address){x = 1;}
    		else{x = 0;}
    			 
    		register[rt] = x;
	    	
	    //	System.out.println("slti");
	    	
	    }// if op is slti
	    
	    else if(op == 15){
	    	
	    	register[rt] = (address << 16) | 0;
	    	
	    	
	    //	System.out.println("lui");
	    	
	    }//if op is lui
	    
	    else if(op == 32){
	    	
	    	
            int x = address + rs;
	    	
	    	if(x > memory.length - 1){
	    	int[] mem2=new int[memory.length + x]; 
	    	for(int i = 0; i < memory.length; i++){
	    		mem2[i] = memory[i];
	    	}//put all members of memory into mem2
	    	
	    	memory = mem2;
	    	} //if memory array is too small, make it bigger
	    	
	    	register[rt] = memory[x];
	  //  	System.out.println("lb");
	    	
	    }//if op is lb
	    
	    else if(op == 35){
	    	
	    	int x = address + rs;
	    	
	    	if(x > memory.length - 1){
	    	int[] mem2=new int[memory.length + x]; 
	    	for(int i = 0; i < memory.length; i++){
	    		mem2[i] = memory[i];
	    	}//put all members of memory into mem2
	    	
	    	memory = mem2;
	    	} //if memory array is too small, make it bigger
	    	
	    	register[rt] = memory[x];
	        
	    //	System.out.println("lw");
	    	
	    }// if op is lw/  Does not account for loading individual byte locations
	    
	    else if(op == 36){
	    	
	    	
           int x = address + rs;
	    	
	    	if(x > memory.length - 1){
	    	int[] mem2=new int[memory.length + x]; 
	    	for(int i = 0; i < memory.length; i++){
	    		mem2[i] = memory[i];
	    	}//put all members of memory into mem2
	    	
	    	memory = mem2;
	    	} //if memory array is too small, make it bigger
	    	
	    	register[rt] = memory[x];
	   // 	System.out.println("lbu");
	    	
	    }// op is lbu
	    
	    else if(op == 40){
	    	
	    	
            int x = address + register[rs];
	    	
	    	if(x > memory.length - 1){
	    	int[] mem2=new int[memory.length + x]; 
	    	for(int i = 0; i < memory.length; i++){
	    		mem2[i] = memory[i];
	    	}//put all members of memory into mem2
	    	
	    	memory = mem2;
	    	} //if memory array is too small, make it bigger
	    	
	    	memory[x] = register[rt];
	    	
	    }//if op is save byte
	    
	    else if(op == 43){
	    	
	    	
            int x = address + rs;
	    	
	    	if(x > memory.length - 1){
	    	int[] mem2=new int[memory.length + x]; 
	    	for(int i = 0; i < memory.length; i++){
	    		mem2[i] = memory[i];
	    	}//put all members of memory into mem2
	    	
	    	memory = mem2;
	    	} //if memory array is too small, make it bigger
	    	
	    	memory[x] = register[rt];
	    //	System.out.println("sw");
	    	
	    }//if op is sw
	    
	    else{
	    	
	    	System.out.println("The op value in " + hex + "\nwas not recognized.  No action will be performed");
	    	
	    }//if op is not recongnized
	    
		
		
	}
	
	public static void printReg(){
		
		String reg[] = new String[32];
		
		for(int i = 0; i < 32; i ++){
			
			reg[i] = Integer.toHexString(register[i]);
			
			while(reg[i].length() < 8)
				reg[i] = "0" + reg[i];
			
		}
		
		
		System.out.print("$0:0x" + (reg[0]) + "  ");
		System.out.print("$1:0x" + (reg[1]) + "  ");
		System.out.print("$2:0x" + (reg[2]) + "  ");
		System.out.print("$3:0x" + (reg[3]) + "  ");
		System.out.println();
		
		System.out.print("$4:0x" + (reg[4]) + "  ");
		System.out.print("$5:0x" + (reg[5]) + "  ");
		System.out.print("$6:0x" + (reg[6]) + "  ");
		System.out.print("$7:0x" + (reg[7]) + "  ");
		System.out.println();
		
		System.out.print("$8:0x" + (reg[8]) + "  ");
		System.out.print("$9:0x" + (reg[9]) + "  ");
		System.out.print("$10:0x" + (reg[10]) + "  ");
		System.out.print("$11:0x" + (reg[11]) + "  ");
		System.out.println();
		
		System.out.print("$12:0x" + (reg[12]) + "  ");
		System.out.print("$13:0x" + (reg[13]) + "  ");
		System.out.print("$14:0x" + (reg[14]) + "  ");
		System.out.print("$15:0x" + (reg[15]) + "  ");
		System.out.println();
		
		System.out.print("$16:0x" + (reg[16]) + "  ");
		System.out.print("$17:0x" + (reg[17]) + "  ");
		System.out.print("$18:0x" + (reg[18]) + "  ");
		System.out.print("$19:0x" + (reg[19]) + "  ");
		System.out.println();
		
		System.out.print("$20:0x" + (reg[20]) + "  ");
		System.out.print("$21:0x" + (reg[21]) + "  ");
		System.out.print("$22:0x" + (reg[22]) + "  ");
		System.out.print("$23:0x" + (reg[23]) + "  ");
		System.out.println();
		
		System.out.print("$24:0x" + (reg[24]) + "  ");
		System.out.print("$25:0x" + (reg[25]) + "  ");
		System.out.print("$26:0x" + (reg[26]) + "  ");
		System.out.print("$27:0x" + (reg[27]) + "  ");
		System.out.println();
		
		System.out.print("$28:0x" + (reg[28]) + "  ");
		System.out.print("$29:0x" + (reg[29]) + "  ");
		System.out.print("$30:0x" + (reg[30]) + "  ");
		System.out.print("$31:0x" + (reg[31]) + "  ");
		System.out.println();
		
		System.out.println("========================================");
	
	}//prints all registers

}//MIPS CLASS
