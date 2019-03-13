import java.util.*;

public class PrimeFinder implements Runnable
{
	private Integer start;
	private Integer end;
	private List<Integer> primes;

	/* Constructs a PrimeFinder */
	public PrimeFinder(Integer startNum, Integer endNum)
	{
		this.start = startNum;
		this.end = endNum;
		this.primes = new ArrayList<Integer>();
	}

	/* Returns the value of the attribute 'primes' */
	public List<Integer> getPrimesList()
	{
		return this.primes;
	}

	/* Determines whether the argument is prime or not */
	public Boolean isPrime(int s)
	{
		if (s <= 1) return false;
		boolean output = true;
		for (int i = 2; i <= Math.floor((s/2)); ++i)
		{
			if ((s % i) == 0)
			{
				output = false;
				break;
			}
		}
		return output;
	}

	/* Adds all primes in [this.start, this.end) to the attribute 'primes' */
	public void run()
	{
		for (int s = this.start; s < this.end; ++s)
		{
			if (isPrime(s)) primes.add(s);
		}
	}
}