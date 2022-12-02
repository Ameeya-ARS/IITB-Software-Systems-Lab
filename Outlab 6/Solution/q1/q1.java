public class q1 {
  public static void main(String[] args) {
    int count = args.length;
    int sum = 0;
    int prod = 1;
    for(int i=0;i<count;i++){
            sum += Integer.parseInt(args[i]);
            prod *= Integer.parseInt(args[i]);
    }
    System.out.println(count+","+sum+","+prod);
  }
}
