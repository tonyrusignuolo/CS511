/*
	I pledge my honor that I have abided by the Stevens Honor System.
	Anthony Rusignuolo
*/

import java.util.*;

public class AssignmentOne 
{
	public static List<Integer> lprimes(List<Integer[]> intervals)
	{
		if (intervals == null) return null;
		
		List<Thread> threads = new ArrayList<Thread>();
		List<PrimeFinder> primeFinders = new ArrayList<PrimeFinder>();
		List<Integer> primesList = new ArrayList<Integer>();
		
		for (Integer[] interval : intervals)
		{
			PrimeFinder primeFinder = new PrimeFinder(interval[0], interval[1]);
			primeFinders.add(primeFinder);
			Thread thread_i = new Thread(primeFinder);
			thread_i.start();
			threads.add(thread_i);
		}
		for (Thread t : threads)
		{
			try
			{
				t.join();
			}
			catch (InterruptedException err)
			{
				err.printStackTrace();
			}
		}
		for (PrimeFinder primeFinder : primeFinders)
		{
			primesList.addAll(primeFinder.getPrimesList());
		}
		return primesList;
	}

	public static void main(String[] args)
	{
		if (args.length <= 1)
		{
			System.out.println("Error: \nUsage: java AssignmentOne <start1> <end1> <Start2> <end2>...");
			return;
		}
		if ((args.length % 2) != 0)
		{
			System.out.println("Error: Uneven number of inputs. Please provide inputes in groups of two.");
			return;
		}

		List<Integer[]> intervals = new ArrayList<Integer[]>();

		for (int i = 0; i < args.length - 1;)
		{
			Integer start = Integer.valueOf(args[i]);
			Integer end = Integer.valueOf(args[++i]);
			if (start > end)
			{
				System.out.println("Error: Interval is decreasing. Please use only increasing intervals.");
				return;
			}
			if (start < 2)
			{
				System.out.println("Error: All integers within the interval must be greater than 2");
				return;
			}
			Integer[] interval = {start, end};
			intervals.add(interval);
		}

		AssignmentOne A1 = new AssignmentOne();
		List<Integer> primesList = A1.lprimes(intervals);
		System.out.println(primesList);
	}
}