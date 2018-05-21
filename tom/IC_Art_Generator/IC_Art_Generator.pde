int grid_ref_dense;
Chip chip;
Grid grid;
TraceControlGrid trace_control_grid;

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  noLoop();
  
  grid_ref_dense = 16;
  grid = new Grid(grid_ref_dense, width/grid_ref_dense);
  chip = new Chip(grid.getDense()*25, grid.getDense()*25, grid.getDense()*5, grid.getDense()*5, grid);
  trace_control_grid = new TraceControlGrid(grid);
}

void draw()
{
  background(255);
  
  chip.show_All();
  grid.show();
  trace_control_grid.show();
}
