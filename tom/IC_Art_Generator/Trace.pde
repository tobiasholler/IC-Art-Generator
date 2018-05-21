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
  
  
  Trace(PVector Pos, int TML, int trace_num, Grid grid)
  {
    this.trace_max_length = TML;
    Spur = new PVector[TML];
    
    for(int i = 0; i < Spur.length; i++)
    {
      Spur[i] = new PVector(Pos.x, Pos.y);
    }
    
    this.current_length = 0;
    this.trace_num = trace_num;
    this.grid = new Grid(grid);
  }
  
  int getTraceNumber(){ return trace_num; }
  
  void genTrace()
  {
  }
  
  void show()
  {
    for(int i = 0; i < Spur.length-1; i++)
    {
      line(Spur[i].x, Spur[i].y, Spur[i+1].x, Spur[i+1].y);
    }
  }
}
