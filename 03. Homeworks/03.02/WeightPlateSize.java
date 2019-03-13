package HW2;

import java.util.Random;
import java.util.Map;
import java.util.HashMap;

public enum WeightPlateSize {
    Small3kg, Medium5kg, Large10kg;

    // should be between 0 and 10 plates per weight size, total of all plates must be greater than 0
    private static final int maxNoOfWeights = 10;
    private static WeightPlateSize[] weightPlateSizes = WeightPlateSize.values();
    private static int noOfWeightPlateSizes = weightPlateSizes.length;
    private static Random random = new Random();

    public static Map<WeightPlateSize, Integer> generateRandom() {
        Map<WeightPlateSize, Integer> weights = new HashMap<WeightPlateSize, Integer>();
        int totWeights = 0;
        for (int i = 0; i < noOfWeightPlateSizes; i++) {
            int noOfWeights = random.nextInt(maxNoOfWeights);
            totWeights += noOfWeights;
            weights.put(weightPlateSizes[i], noOfWeights);
        }
        if (totWeights == 0) {
            weights.replace(weightPlateSizes[0], 1);
        }
        return weights;
    }

    public static Map<WeightPlateSize, Integer> gymHelper() {
        Map<WeightPlateSize, Integer> weights = new HashMap<WeightPlateSize, Integer>();
        weights.put(weightPlateSizes[0], 75);
        weights.put(weightPlateSizes[1], 90);
        weights.put(weightPlateSizes[2], 110);
        return weights;
    }

    public int index() {
        for (int i = 0; i < noOfWeightPlateSizes; i++) {
            if (this == weightPlateSizes[i]) {
                return i;
            }
        }
        return -1;
    }
}