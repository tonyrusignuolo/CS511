/*
*	I pledge my honor that I have abided by the stevens honor system.
*	Henry Thomas
*
*/

import java.util.ArrayList;
import java.util.List;

public class AssignmentOne 
{
	public List<Integer> lprimes(List<Integer[]> intervals)
	{
		//error checking
		if(intervals==null)
			return null;

		List<Integer> primeList = new ArrayList<Integer>();
		List<Thread> threadList = new ArrayList<Thread>();
		List<PrimeFinder> primeFinders = new ArrayList<PrimeFinder>();

		//for each set of intervals...
		for(Integer[] set : intervals)
		{
			//create a new prime finder object, range_i
			PrimeFinder range_i = new PrimeFinder(set[0], set[1]);
			primeFinders.add(range_i);
			//create a new thread for that range
	        Thread thread_i = new Thread(range_i);
	        thread_i.start();
	        //add the thread to our thread list
	        threadList.add(thread_i);
		}
		
		//for each thread in our thread list...
		for(Thread t : threadList)
		{
			try 
			{
				t.join(); //attempt to join thread otherwise throw error
			} catch (InterruptedException err) {
				err.printStackTrace();
			}
		}
		
		//for each prime sequence p in our primefinders
		for(PrimeFinder p : primeFinders)
		{	
			//add it to our list of primes
			primeList.addAll(p.getPrimesList());
		}
		
		return primeList;
	}
	
	public static void main(String[] args) 
	{
		//Error checking... makes sure there are more than 2 arguments
		if(args.length <= 1)
		{
			System.out.println("Error: \nUsage: java AssignmentOne <start1> <end1> <start2> <end2>...");
			return;
		}
		
		if((args.length % 2) != 0)
		{
			System.out.println("Error: Please provide your input in sets of two. Run with no paramaters for usage.");
			return;
		}

		List<Integer[]> input = new ArrayList<Integer[]>();
		
		for(int i = 0; i < args.length - 1;)
		{
			Integer start = Integer.valueOf(args[i]);
			Integer end = Integer.valueOf(args[++i]);
			Integer[] pair = {start,end};

			if (start > end)
			{
				System.out.println("Error: Please use only increasing intervals.");
				return;
			}
			
			//adds each pair to our input list
			input.add(pair);
		}
		
		//Putting everything together
		AssignmentOne ass1 = new AssignmentOne(); //teehee
		List<Integer> listOfPrimes = ass1.lprimes(input);
		System.out.println(" List of primes:\n" + listOfPrimes);
	}

}