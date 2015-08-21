import java.util.*;
import java.io.*;

public class TableMaker
{
	public static void main(String[] args) 
	{
		Scanner sc;
		PrintWriter writer; // = new PrintWriter("the-file-name.txt", "UTF-8");

		String fname;
		String guassString;
		String input;

		while (sc.hasNextLine())
		{
			input = sc.nextLine();

			int count = 0;
			for (String s: guassString.split("[ ]+"))
			{
				if (count == 0)
				{
					fname = s + ".txt";
					count++
				}
				else
				{
					guassString = s + " ";
				}
     		}

     		writer = new PrintWriter(fname);

     		writer.print(guassString);
     		write.close();
     		guassString = "";
     	}
	}
}