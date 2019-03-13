package HW2;

import java.util.Random;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import AssignmentTwo.ApparatusType;
import AssignmentTwo.WeightPlateSize;

public class Gym implements Runnable {
    private static final int gymSize = 30;
    private static final int gymRegisteredClients = 100;
    private Map<WeightPlateSize, Integer> noOfWeightPlates; // [(10kg, 75), (5kg, 90), (3kg, 110)]
    private Map<ApparatusType, Integer> noOfApparatuses;   
    private Set<Client> clients;
    private ExecutorService executor;
    // various semaphores, apparently associated with the apparatuses and weightPlates
    private ArrayList<Semaphore> weightPlateSemaphores;
    private ArrayList<Semaphore> apparatusSemaphores;
    private Random random = new Random();

    public Gym() {
        this.noOfWeightPlates = WeightPlateSize.gymHelper();
        this.noOfApparatuses = ApparatusType.gymHelper();
        this.clients = createClientsList();
        this.executor = Executors.newFixedThreadPool(gymSize);
        this.weightPlateSemaphores = createWeightPlateSemaphores(noOfWeightPlates);
        this.apparatusSemaphores = createApparatusSemaphores(noOfApparatuses);
    }

    public Set<Client> createClientsList() {
        Set<Client> clients = new HashSet<Client>();
        for (int i = 0; i < gymRegisteredClients; i++) {
            clients.add(Client.generateRandom(i + 1));
        }
        return clients;
    }

    public ArrayList<Semaphore> createWeightPlateSemaphores(Map<WeightPlateSize, Integer> noOfWeightPlates) {
        ArrayList<Semaphore> weightPlateSemaphores = new ArrayList<Semaphore>();
        for (int n : noOfWeightPlates.values()) {
            weightPlateSemaphores.add(new Semaphore(n));
        }
        return weightPlateSemaphores;
    }

    public ArrayList<Semaphore> createApparatusSemaphores(Map<ApparatusType, Integer> noOfApparatuses) {
        ArrayList<Semaphore> apparatusSemaphores = new ArrayList<Semaphore>();
        for (int n : noOfApparatuses.values()) {
            apparatusSemaphores.add(new Semaphore(n));
        }
        return apparatusSemaphores;
    }
    
    public void run() {
        for (Client client : clients) {
            executor.execute(new Runnable() {
                public void run(){
                    client.performRoutine(weightPlateSemaphores, apparatusSemaphores);
                }
            });
        }
        executor.shutdown();

        // Integer id = random.nextInt(gymRegisteredClients);
        // clients.add(id);
        // Client client new Client.generateRandom(id);
        // client.performRoutine(weightPlateSemaphores, apparatusSemaphores);
    }
}