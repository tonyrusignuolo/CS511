/*
	I pledge my honor that I have abided by the Stevens Honor System.
	Anthony Rusignuolo
*/

package HW2;

// Start simulation
public class AssignmentTwo {
    public static void main(String[] args) {
        Thread thread = new Thread(new Gym());
        thread.start();
        try {
            thread.join();
        }
        catch (InterruptedException e) {
            // TODO auto generated catch block
            e.printStackTrace();
        }
    }
}