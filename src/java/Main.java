import java.util.*;

import static java.lang.System.exit;

public class Main {

    private static Collection collection;
    private static Random random = new Random();
    private static final int DEFAULT_COUNT = 10000;

    public static void showUsage() {
        System.err.println(
                "Usage: STRUCTURE OPERATION COUNT\n\n"
                + "Structure:\n"
                + "    0 => ArrayList\n"
                + "    1 => LinkedList\n"
                + "    2 => HashSet\n\n"
                + "Operation:\n"
                + "    0 => Add\n"
                + "    1 => Contains\n"
                + "    2 => Remove\n\n"
                + "Count: the number of time to run the operation.\n"
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
            c.contains(i);
        }
    }

    public static void remove(Collection c, int size) {
        for (int i = 0; i < size; i++) {
            c.remove(i);
        }
    }

    public static void main(String[] args) {
        if (args.length < 3) {
            showUsage();
        }

        int size = Integer.parseInt(args[2]);

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
