import java.util.ArrayList;
import java.util.List;

public class PrimeFinder implements Runnable
{
	private Integer start;
	private Integer end;
	private List <Integer> primes;
	
	// Constructor for PrimeFinder
	public PrimeFinder(Integer startNum, Integer endNum)
	{
		this.start = startNum;
		this.end = endNum;
		this.primes = new ArrayList<Integer>();
	}
	
	public List <Integer> getPrimesList()
	{
		return this.primes;
	}
	
	public boolean isPrime(int n)
	{
		//excluding negative numbers
		if(n<=1)
			return false;
		
		boolean val = true;
		for(int i = 2; i < n; ++i)
		{
			if((n%i) == 0)
			{
				val = false;
				break;
			}
		}
		
		return val;
	}
	
	public void run()
	{
		for(int n = this.start; n<=this.end; ++n)
		{
			if(isPrime(n))
				primes.add(n);
		}
	}
}