class Chip
{
  PVector Pos;
  PVector Kontaktpunkt[]; // == KP
  int Grid_Dense;
  int Grid_Size;
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
    this.Grid_Dense = 0;
    this.Grid_Size = 0;
    this.KP_pro_Chipseite = 0;
  }
  
  //Eingabe eines Referenzgrids für klasseninterne Berechnungen
  void setRefGrid(int Grid_Dense, int Grid_Size)
  {
    this.Grid_Dense = Grid_Dense;
    this.Grid_Size = Grid_Size;
  }
  
  //Init Kontaktpunkte
  void initKP()
  {
    KP_pro_Chipseite = (Chip_Width/Grid_Dense)-1;
    Kontaktpunkt = new PVector[KP_pro_Chipseite*4];
    
    for(int i = 0; i < KP_pro_Chipseite; i++)
    {
      for(int j = 0; j < KP_pro_Chipseite; j++)
      {
        switch(i)
        {
          case 0:
            //Oben
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+Grid_Dense*(j+1), Pos.y);
            break;
          case 1:
            //Unten
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+Grid_Dense*(j+1), Pos.y+Chip_Height);
            break;
          case 2:
            //Links
            Kontaktpunkt[i*4+j] = new PVector(Pos.x, Pos.y+Grid_Dense*(j+1));
            break;
          case 3:
            //Rechts
            Kontaktpunkt[i*4+j] = new PVector(Pos.x+Chip_Width, Pos.y+Grid_Dense*(j+1));
            break;
        }
      }
    }
  }
  
  void show()
  {
    rect(Pos.x, Pos.y, Chip_Width, Chip_Height);
    //println(Kontaktpunkt.length);
  }
  
  void show_KP()
  {
    /*
    for(int i = 0; i < Kontaktpunkt.length; i++)
    {
      ellipse(Kontaktpunkt[i].x, Kontaktpunkt[i].y, Grid_Dense/2, Grid_Dense/2);
    }
    */
    
    for(PVector i : Kontaktpunkt)
    {
      ellipse(i.x, i.y, Grid_Dense/2, Grid_Dense/2);
    }
  }
}
