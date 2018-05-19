class Chip
{
  PVector Pos;
  PVector Kontaktpunkt[]; // == KP
  Grid grid;
  int Chip_Width;
  int Chip_Height;
  int KP_pro_Chipseite;
  Trace trace[];
  
  Chip(int x, int y, int Chip_Width, int Chip_Height)
  {
    this.Pos = new PVector(x, y);
    this.Chip_Width = Chip_Width;
    this.Chip_Height = Chip_Height;
    //Just to be safe
    this.grid = new Grid(0, 0);
    this.KP_pro_Chipseite = 0;
    this.trace = new Trace[KP_pro_Chipseite*4];
  }
  
  //Eingabe eines Referenzgrids für klasseninterne Berechnungen
  void setRefGrid(int Grid_Dense, int Grid_Size)
  {
    this.grid.setGridParameter(Grid_Dense, Grid_Size);
  }
  
  //Init Kontaktpunkte
  void initKP()
  {
    KP_pro_Chipseite = (Chip_Width/grid.getDense())-1;
    Kontaktpunkt = new PVector[KP_pro_Chipseite*4];
    
    for(int i = 0; i < KP_pro_Chipseite; i++)
    {
      for(int j = 0; j < KP_pro_Chipseite; j++)
      {
        switch(i)
        {
          case 0:
            //Oben
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+grid.getDense()*(j+1), Pos.y);
            break;
          case 1:
            //Unten
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+grid.getDense()*(j+1), Pos.y+Chip_Height);
            break;
          case 2:
            //Links
            Kontaktpunkt[i*4+j] = new PVector(Pos.x, Pos.y+grid.getDense()*(j+1));
            break;
          case 3:
            //Rechts
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+Chip_Width, Pos.y+grid.getDense()*(j+1));
            break;
        }
      }
    }
  }
  
  //Initiiere die Traces/Spuren
  void initT()
  {
    for(int i = 0; i < trace.length; i++)
    {
      trace[i] = new Trace(Kontaktpunkt[i], 10);
    }
  }
  
  //Zeig mir alles
  void show_All()
  {
    show_C();
    show_KP();
    show_T();
  }
  
  //Zeig mir den Chip
  void show_C(){ rect(Pos.x, Pos.y, Chip_Width, Chip_Height); }
  //Zeig mir die Kontaktpunkte
  void show_KP(){ for(PVector pv : Kontaktpunkt){ ellipse(pv.x, pv.y, grid.getDense()/2, grid.getDense()/2); } }
  //Zeig mir die Traces/Spuren
  void show_T(){ for(Trace t : trace){ t.show(); } }
}
