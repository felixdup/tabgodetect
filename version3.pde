import gab.opencv.*;
import java.util.ArrayList;
import java.util.List;
import java.awt.Rectangle;

PImage src;
OpenCV opencv;
float value = 0;
DetectionCube maDetect;
int x = 1500;
int y =500;
int pipette =1;

int bouge =1;
void setup() {
  src = loadImage("10.jpg"); 
  size(2000, 900);
  maDetect = new DetectionCube(src);
}

void draw() {
  scale(0.5);
  image(src, 0, 0);
  if (bouge >0) {
    x = mouseX*2 ;
    y = mouseY *2;
  }
  value+=0.0;


  for (Point monBlob : maDetect.mesPoints) {
    stroke(255, 0, 0);
    strokeWeight(3);
    noFill();

    //circle(monBlob.pointMoyen.x, monBlob.pointMoyen.y, 16);


    for (Cube monCube : maDetect.mesCubes) {
      monCube.dessineCube();
    }

    if (maDetect.mesCubes.size()>0) {
      //println("cube n:",value);
      //maDetect.mesCubes.get((int)value).dessineCube();
      //maDetect.mesCubes.get((int)value).diagonalePerpendiculaire();
      //maDetect.mesCubes.get((int)value).printPos();
      //maDetect.mesCubes.get(value).dessineCercle();
      //maDetect.mesCubes.get((int)value).dessineCubeComplet();
    }
  }

  if (pipette <0) {
    dessin();
  }
}
void dess2() {
  int decal = 3;


  int a =0;
  int b =0;
  int taille = 80;
  int d =1800;
  int s =0;

  for (int xrelatif = x-taille; xrelatif<x+taille+1; xrelatif++) {
    b=100;
    for (int yrelatif = y-taille; yrelatif<y+taille+1; yrelatif++) {
      if ( xrelatif >= 0 && yrelatif >= 0 ) {
        int loc = xrelatif + yrelatif*src.width;  
        
        noStroke();
        if (isNearCouleur(color(79, 124, 170), loc, src)||isNearCouleur(color(68, 101, 126), loc, src)) {
          //fill(0,0,255);
         // strokeWeight(5);
          //stroke(0, 0, 255);
        }
        if (brightness(src.pixels[loc]) < 180) {
          fill(0,0,0);
        } else {
          fill(255,255,255);
        }
        if (xrelatif == x && yrelatif == y) {
          stroke(0, 255, 0);
          rect(x-taille/2, y-taille/2, taille, taille);
        }
        rect(d+a, b, decal, decal);
        
        /*
        fill(src.pixels[loc]);
        
        if (isNearCouleur(color(79, 124, 170), loc, src)||isNearCouleur(color(68, 101, 126), loc, src)) {
          //fill(0,0,255);
          strokeWeight(5);
          stroke(0, 0, 255);
          
          float doa = calculScore(xrelatif,yrelatif,color(68, 101, 126),src);

        if (doa>calculScore(xrelatif,yrelatif,color(79, 124, 170),src)) {
          doa = calculScore(xrelatif,yrelatif,color(79, 124, 170),src);
        }
            String er = ""+doa;
           fill(255,255,255);
           textSize(25);
           text( er, a+d, b+decal);
          
        }*/
        //String t = "" +(int)red(src.pixels[loc])+":"+(int)green(src.pixels[loc])+":"+(int)blue(src.pixels[loc]);
/*
        float score = distanceCouleur(color(68, 101, 126), loc, src);

        if (score>distanceCouleur(color(79, 124, 170), loc, src)) {
          score = distanceCouleur(color(79, 124, 170), loc, src);
        }
        String t = ""+(int)score ;
        fill(0, 0, 0);
        textSize(25);
        text(t, a+d, b+decal);*/
      }
      b += decal;
    }
    a += decal;
  }
  noFill();
  stroke(0, 255, 0);
  rect(d, 100, a, a);
  
  
  //text(er, 100, a+200);
}






void dessin() {
  int decal = 75;


  int a =0;
  int b =0;
  int taille = 8;
  int d =1800;
  int s =0;

  for (int xrelatif = x-taille; xrelatif<x+taille+1; xrelatif++) {
    b=100;
    for (int yrelatif = y-taille; yrelatif<y+taille+1; yrelatif++) {
      if ( xrelatif >= 0 && yrelatif >= 0 ) {
        int loc = xrelatif + yrelatif*src.width;  
        fill(src.pixels[loc]);
        noStroke();
        if (isNearCouleur(color(79, 124, 170), loc, src)||isNearCouleur(color(68, 101, 126), loc, src)) {
          //fill(0,0,255);
          strokeWeight(5);
          stroke(0, 0, 255);
        }
        if (brightness(src.pixels[loc]) < 180) {
          //fill(0,0,0);
        } else {
          //fill(255,255,255);
        }



        if (xrelatif == x && yrelatif == y) {
          stroke(0, 255, 0);
          rect(x-taille/2, y-taille/2, taille, taille);
        }
        rect(d+a, b, decal, decal);

        //String t = "" +(int)red(src.pixels[loc])+":"+(int)green(src.pixels[loc])+":"+(int)blue(src.pixels[loc]);

        float score = distanceCouleur(color(68, 101, 126), loc, src);

        if (score>distanceCouleur(color(79, 124, 170), loc, src)) {
          score = distanceCouleur(color(79, 124, 170), loc, src);
        }
        String t = ""+(int)score ;
        fill(0, 0, 0);
        textSize(25);
        text(t, a+d, b+decal);
      }
      b += decal;
    }
    a += decal;
  }
  noFill();
  stroke(0, 255, 0);
  rect(d, 100, a, a);
  
  float doa = calculScore(x,y,color(68, 101, 126),src);

        if (doa>calculScore(x,y,color(79, 124, 170),src)) {
          doa = calculScore(x,y,color(79, 124, 170),src);
        }
  String er = "Centré sur le pixel x:"+x+" y:"+y+" le score de zone vaut :"+doa;
  text(er, 100, a+200);
}




void keyPressed() {
  if (maDetect.mesCubes.size()>0) {
    value = (value+1)%maDetect.mesCubes.size();
  }

  if (key == 'p') {
    pipette = pipette * -1;
  }
}

void mouseClicked() { 

  bouge = bouge *-1;
}


boolean isNearCouleur(color couleurCible, int loc, PImage monImage) {
  boolean redTest = abs(red(couleurCible) - red(monImage.pixels[loc])) <20;
  boolean greenTest = abs(green(couleurCible) - green(monImage.pixels[loc])) <10;
  boolean blueTest = abs(blue(couleurCible) - blue(monImage.pixels[loc])) <20;

  return redTest && greenTest && blueTest;
}

float distanceCouleur(color colorTrack, int loc, PImage monImage) {
  return abs(red(monImage.pixels[loc])-red(colorTrack))+ abs(green(monImage.pixels[loc])-green(colorTrack)) +abs(blue(monImage.pixels[loc])-blue(colorTrack));
}

float calculScore(int x, int y, color couleurCible, PImage monImage) {

  int taille = 8;
  int s =0;
  for (int xrelatif = x-taille; xrelatif<x+taille+1; xrelatif++) {
    for (int yrelatif = y-taille; yrelatif<y+taille+1; yrelatif++) {
      if ( xrelatif >= 0 && yrelatif >= 0 ) {
        int loc = xrelatif + yrelatif*monImage.width;  

        s+= distanceCouleur(couleurCible, loc, monImage);
      }
    }
  }

  return s /((taille*2+1)*(taille*2+1));
}
