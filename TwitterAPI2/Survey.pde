class Survey {
  int[]obj=new int[4];//アンケート対象
  int count=1;
  Survey() {
    init();
  }
  void init() {
    for (int i=0; i<4; i++) {
      obj[i]=0;
    }
  }
  void count(String s) {
    int p1=s.indexOf("1");
    int p2=s.indexOf("2");
    int p3=s.indexOf("3");
    int p4=s.indexOf("4");
    if (p1!=-1) {
      obj[0]++;
      count++;
    }
    if (p2!=-1) {
      obj[1]++;
      count++;
    }
    if (p3!=-1) {
      obj[2]++;
      count++;
    }
    if (p4!=-1) {
      obj[3]++;
      count++;
    }
  }
 void display(int wid, int hei, int a, int b, int c, int d) {
    obj[0]=a;
    obj[1]=b;
    obj[2]=c;
    obj[3]=d;
    for (int i=1; i<=4; i++) {
      fill(255,0,0);
      rect(10+wid, 10+hei*i, obj[i-1]*width/2*(float)(1.00/(a+b+c+d)), hei);
      text(obj[i-1], 900, 10+hei*i+40);
      fill(0);
      text(i,10+wid-70,10+hei*i+40);
    }
  }
}