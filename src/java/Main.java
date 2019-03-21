import java.util.*;

import static java.lang.System.exit;

public class Main {

    private static Collection collection;
    private static Random random = new Random();
    private static final int DEFAULT_COUNT = 10000;

    public static void showUsage() {
        System.err.println(
                "Usage: INTERFACE OPERATION SIZE\n\n" +
                "Interface: \n" +
                "\t0 => ArrayList \n" +
                "\t1 => LinkedList \n" +
                "\t2 => HashSet \n\n" +
                "Operation:\n" +
                "\t0 => Add\n" +
                "\t1 => Contains\n" +
                "\t2 => Remove"
        );
        exit(1);
    }

    public static Collection feed(Collection c, int size) {
        for (int i = 0; i < size; i++) {
            c.add(random.nextInt());
        }
        return c;
    }

    public static void contains(Collection c, int size) {
        for (int i = 0; i < size; i++) {
            c.contains(random.nextInt());
        }
    }

    public static void remove(Collection c, int size) {
        for (int i = 0; i < size; i++) {
            c.remove(random.nextInt());
        }
    }

    public static void main(String[] args) {
        if (args.length < 3) {
            showUsage();
        }

        switch (args[0]) {
            case "0":
                collection = new ArrayList();
                break;
            case "1":
                collection = new LinkedList();
                break;
            case "2":
                collection = new HashSet();
                break;
            default:
                showUsage();
                return;
        }

        int size = Integer.parseInt(args[2]);

        switch (args[1]) {
            case "0":
                feed(collection, size);
                break;
            case "1":
                contains(feed(collection, DEFAULT_COUNT), size);
                break;
            case "2":
                remove(feed(collection, DEFAULT_COUNT), size);
                break;
            default:
                showUsage();
        }
    }
}
