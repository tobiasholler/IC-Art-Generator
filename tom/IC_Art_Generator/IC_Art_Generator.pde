int grid_ref_dense;
Chip chip;
Grid grid;
TraceControlGrid tcg; //trace_control_grid

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  //noLoop();
  
  grid_ref_dense = 25;
  grid = new Grid(grid_ref_dense, width/grid_ref_dense);
  tcg = new TraceControlGrid(grid);
  chip = new Chip(tcg.getDense()*10, tcg.getDense()*15, tcg.getDense()*5, tcg.getDense()*5, grid, tcg);
}

void draw()
{
  background(255);
  
  chip.show_All();
  grid.show();
  tcg.show();
}
