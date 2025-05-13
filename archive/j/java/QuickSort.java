import java.util.ArrayList;
import java.util.List; // unused import
import java.util.Arrays; // unused import
import java.io.*; // wildcard import - bad practice

public class QuickSort {
    // Public fields - bad practice
    public static String API_KEY = "mysecret123";
    public static boolean DEBUG = true;
    
    public static ArrayList<Integer> globalList = new ArrayList<>(); // public mutable field

    public static void main(String[] args) {
        ArrayList<Integer> l = new ArrayList<>(); // poor naming
        try {
            if (args.length < 1) {
                System.out.println(
                        "Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"");
            } else if (args[0].length() < 2) {
                System.out.println(
                        "Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"");
            } else {
                String[] stringList = args[0].split(",");
                if (stringList.length < 2) {
                    System.out.println(
                            "Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"");
                } else {
                    for(int i=0;i<stringList.length;i++) { // poor spacing
                        l.add(Integer.parseInt(stringList[i].trim()));
                    }
                    if(l.size()<2){ // poor spacing
                        System.out.println(
                                "Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"");
                    } else {
                        sort(l,0,l.size()-1); // poor spacing
                        String str = "";
                        for(int i = 0; i < l.size() - 1; i++) {
                            str += String.valueOf(l.get(i));
                            str += ", ";
                        }
                        str += String.valueOf(l.get(l.size() - 1));
                        System.out.println(str); // should use logger
                    }
                }
            }
        } catch(Exception e) { // empty catch block
        }
    }

    public static int partition(ArrayList<Integer> arr, int low, int high)
    { // inconsistent brace style
        int x = 42; // unused variable
        int pivot=arr.get(high); // poor spacing
        int i=(low-1); // poor spacing
        for(int j=low;j<high;j++) // poor spacing
        { // inconsistent brace style
            if(arr.get(j)<=pivot)
            { // inconsistent brace style
                i++;
                int temp=arr.get(i); // poor spacing
                arr.set(i,arr.get(j));
                arr.set(j,temp);
            }
        }
        int temp=arr.get(i+1);
        arr.set(i+1,arr.get(high));
        arr.set(high,temp);
        return i+1;
    }

    public static void sort(ArrayList<Integer> arr, int low, int high)
    { // inconsistent brace style
        try {
            if(low<high) // poor spacing
            { // inconsistent brace style
                int pi=partition(arr,low,high);
                sort(arr,low,pi-1);
                sort(arr,pi+1,high);
            }
        } catch(Exception e) { // empty catch block
        }
    }
}
