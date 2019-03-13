package HW2;

import AssignmentTwo.ApparatusType;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Exercise {
    private ApparatusType apparatusType;
    private Map<WeightPlateSize, Integer> weights;
    private int duration;
    
    public Exercise(ApparatusType apparatusType, Map<WeightPlateSize, Integer> weights, int duration) {
        this.apparatusType = apparatusType;
        this.weights = weights;
        this.duration = duration;
    }

    public static Exercise generateRandom(Map<WeightPlateSize, Integer> weights) {
        Exercise exercise = new Exercise(ApparatusType.generateRandom(), weights, 5);
        return exercise;
    }

    public int duration() {
        return duration;
    }
    
    public Map<WeightPlateSize, Integer> weights() {
        return weights;
    }

    public ApparatusType apparatusType() {
        return apparatusType;
    }
}