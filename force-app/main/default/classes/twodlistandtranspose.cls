public class twodlistandtranspose {
     public static void main() {
        List<List<Integer>> twodlist = new List<List<Integer>>();
        List<Integer> l1 = new List<Integer>{1,2,3};
        List<Integer> l2 = new List<Integer>{4,5,6};
        List<Integer> l3 = new List<Integer>{7,8,9};
        twodlist.add(l1);
        twodlist.add(l2);
        twodlist.add(l3);
        system.debug('Original list is: '+ twodlist);
        for(integer i=0; i<3; i++) {
            for(integer j=0; j<3; j++) {
                if(i < j) {
                    integer temp = twodlist[i][j];
                    twodlist[i][j] = twodlist[j][i];
                    twodlist[j][i] = temp;
                }
            }
        }
        system.debug('List after transpose is: '+ twodlist);
    }

}