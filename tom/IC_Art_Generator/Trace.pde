class Trace
{
  //PVector Pos;
  PVector Spur[];
  int Trace_Max_Length;
  int Current_Length;
  Grid grid;
  
  
  Trace(PVector Pos, int TML)
  {
    this.Trace_Max_Length = TML;
    Spur = new PVector[Trace_Max_Length];
    for(PVector i : Spur)
    {
      i = new PVector(Pos.x, Pos.y);
    }
    Current_Length = 0;
    
    //Just to be safe
    this.grid = new Grid(0, 0);
  }
  
  //Eingabe eines Referenzgrids für klasseninterne Berechnungen
  void setRefGrid(int Grid_Dense, int Grid_Size)
  {
    this.grid.setGridParameter(Grid_Dense, Grid_Size);
  }
  
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
