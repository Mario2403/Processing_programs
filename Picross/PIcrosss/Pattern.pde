class Pattern {  
  boolean[][] draw;
  ArrayList<ArrayList<Integer>> rowNumbers;
  ArrayList<ArrayList<Integer>> colNumbers;

  public Pattern() {

    draw= new boolean[10][10];
    rowNumbers= new ArrayList();
    colNumbers= new ArrayList();

for (int i=0; i< draw.length; i++) {
      draw[i][0]=true;
      draw[0][i]=true;
      draw[draw.length-1-i][draw.length-1]=true;
      draw[draw.length-1][draw.length-1-i]=true;  
}
      draw[3][2]=true;
      draw[3][3]=true;
      draw[6][2]=true;
      draw[6][2]=true;
      
      draw[2][5]=true;
      draw[3][6]=true;
      draw[3][6]=true;
      draw[4][6]=true;
      draw[5][6]=true;
      draw[6][6]=true;
      draw[7][5]=true;

    count();

    
  }

  void count() {
    for (int i=0; i< draw.length; i++) {
      rowNumbers.add(countRow(i));
    }
    for (int j=0; j<draw[0].length; j++) {
      colNumbers.add(countColumn(j));
    }
  }


  ArrayList<Integer> countRow( int index) {
    ArrayList<Integer> sum = new ArrayList<Integer>(); 
    int cont =0;
    if (this.draw[0][index]) cont=1;

    for (int i=1; i < this.draw.length; i++) {
      if (this.draw[i][index]) { 
        cont++;
      } else if (cont!=0) {
        sum.add(cont);
        cont=0;
      }
    }
    if(cont>0) sum.add(cont);
    return sum;
  }


  ArrayList<Integer> countColumn( int index) {

    ArrayList<Integer> sum = new ArrayList<Integer>(); 
    int cont =0;
    if (this.draw[index][0]) cont=1;
    for (int i=1; i<this.draw.length; i++) {
      if (this.draw[index][i]) {
        cont++;
      } else if (cont!=0) {
        sum.add(cont);
        cont=0;
      }
    }
    if(cont>0) sum.add(cont);
    return sum;
  }
}