package HW2;

import AssignmentTwo.Exercise;
import AssignmentTwo.WeightPlateSize;
import java.util.Map;
import java.util.HashMap;
import java.util.Random;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;

public class Client {
    private int id;
    private ArrayList<Exercise> routine;
    private final int maxExercises = 20;
    private final int minExercises = 15;
    private static Random random = new Random();
    

    public Client(int id) {
        this.id = id;
        this.routine = createRoutine();
    }

    public static Client generateRandom(int id) {
        Client client = new Client(id);
        return client;
    }

    public ArrayList<Exercise> createRoutine() {
        Integer noOfExercises = random.nextInt(maxExercises - minExercises + 1) + minExercises;
        ArrayList<Exercise> routine0 = new ArrayList<Exercise>();
        for (int i = 0; i < noOfExercises; i++) {
            Map<WeightPlateSize, Integer> weights = WeightPlateSize.generateRandom();
            Exercise exercise = Exercise.generateRandom(weights);
            routine0.add(exercise);
        }
        return routine0;
    }

    public void performRoutine(ArrayList<Semaphore> weightPlateSemaphores, ArrayList<Semaphore> apparatusSemaphores) {
        for (Exercise exercise : routine){
            // System.out.println("Performing routine");
            int duration = exercise.duration();
            Map<WeightPlateSize, Integer> weights = exercise.weights();
            ApparatusType apparatusType = exercise.apparatusType();
            try {
                // System.out.println("Acquiring apparatus");
                apparatusSemaphores.get(apparatusType.index()).acquire();
                for (WeightPlateSize weight : weights.keySet()) {
                    // System.out.println("Acquiring weight");
                    weightPlateSemaphores.get(weight.index()).acquire();
                }
                while (duration > 0) {
                    duration--;
                }
                // System.out.println("Releasing apparatus");
                apparatusSemaphores.get(apparatusType.index()).release();
                for (WeightPlateSize weight : weights.keySet()) {
                    // System.out.println("Releasing weight");
                    weightPlateSemaphores.get(weight.index()).release();
                }
                System.out.println("Client " + this.id + " is exercising on the " + exercise.apparatusType().toString() + " with weights " + exercise.weights().toString());
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
            // System.out.println("Ending routine");
        }
    }
}