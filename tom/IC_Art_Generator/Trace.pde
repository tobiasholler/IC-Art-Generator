class Trace
{
  //PVector Pos;
  PVector Spur[];
  //PVector Base_Direction;
  //Oben  :  0,  1
  //Unten :  0, -1
  //Links : -1,  0
  //Rechts:  1,  0
  int trace_max_length;
  int current_length;
  int trace_num;
  Grid grid;
  
  
  Trace(PVector Pos, int TML, int trace_num)
  {
    this.trace_max_length = TML;
    Spur = new PVector[trace_max_length];
    for(PVector i : Spur){ i = new PVector(Pos.x, Pos.y); }
    current_length = 0;
    this.trace_num = trace_num;
    
    //Just to be safe
    this.grid = new Grid(0, 0);
  }
  
  //Eingabe eines Referenzgrids für klasseninterne Berechnungen
  void setRefGrid(int Grid_Dense, int Grid_Size)
  {
    this.grid.setGridParameter(Grid_Dense, Grid_Size);
  }
  
  int getTraceNumber(){ return trace_num; }
  
  void show()
  {
    for(int i = 0; i < Spur.length-1; i++)
    {
      line(Spur[i].x, Spur[i].y, Spur[i+1].x, Spur[i+1].y);
    }
  }
  
  void genTrace()
  {
  }
}
