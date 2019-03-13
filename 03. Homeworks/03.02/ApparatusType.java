package HW2;

import java.util.Map;
import java.util.HashMap;
import java.util.Random;

 // 5 of each
public enum ApparatusType {
    LegPressMachine, Barbell, HackSquatMachine, LegExtensionMachine, 
    LegCurlMachine, LatPulldoownMachine, PeckMachine, CableCrossOverMachine;

    private static ApparatusType[] apparatuses = ApparatusType.values();
    private static int noOfApparatuses = apparatuses.length;
    private static Random random = new Random();

    public static ApparatusType generateRandom() {
        return apparatuses[random.nextInt(noOfApparatuses)];
    }

    public static Map<ApparatusType, Integer> gymHelper() {
        Map<ApparatusType, Integer> noOfApparatuses0 = new HashMap<ApparatusType, Integer>();
        for (int i = 0; i < noOfApparatuses; i++) {
            noOfApparatuses0.put(apparatuses[i], 5);
        }
        return noOfApparatuses0;
    }

    public int index() {
        for (int i = 0; i < noOfApparatuses; i++) {
            if (this == apparatuses[i]) {
                return i;
            }
        }
        return -1;
    }
}