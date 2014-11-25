#!/bin/sh

note() { whiptail --title "NOTE" --msgbox "USE ctrl+c TO END DEMO(s)" 8 0
}

echo "Welcome To DEMO_PI v1"

cd /opt/vc/src/hello_pi #change directory to demo directory

if [ ! -f hello_audio/hello_audio.bin ]; then #check if demos have been built
  ./rebuild.sh
fi

if (whiptail --title "Advance Options" --yesno "Do You Want To Enable Advance Options?" 8 0) then
    ADV=$?
else
    ADV=$?
fi

# Add trap for Ctrl-C
trap echo INT
while true; do
if [ $ADV -eq 1 ]; then
  CHOICE=$(whiptail --title "Menu example" --menu "Choose an option" 20 0 16 \
  "1" "Hello World" \
  "2" "Audio Demo" \
  "3" "Font Demo" \
  "4" "Video Demo" \
  "5" "2D Graphic" \
  "6" "Mondelbrot Fractal (Move the Mouse around)" \
  "7" "3D CUBE" \
  "8" "3D Video CUBE" \
  "9" "3D Teapot (Yeah! Its a freakin teapot)" \
  "EXIT" "" \
  3>&1 1>&2  2>&3)
else
  CHOICE=$(whiptail --title "Menu example" --menu "Choose an option" 20 0 16 \
  "1" "Hello World" \
  "2" "Audio Demo" \
  "3" "Font Demo" \
  "4" "Video Demo" \
  "5" "2D Graphic" \
  "6" "Mondelbrot Fractal (Move the Mouse around)" \
  "7" "3D CUBE" \
  "8" "3D Video CUBE" \
  "9" "3D Teapot (Yeah! Its a freakin teapot)" \
  "10" "Dispmanx" \
  "11" "Encode" \
  "12" "FFT" \
  "13" "JPEG" \
  "EXIT" "" \
  3>&1 1>&2  2>&3)

fi

case "$CHOICE" in
 1) cd hello_world; ./hello_world.bin; echo "wait for 10s"; sleep 10; cd ..;;
 2) note; cd hello_audio; ./hello_audio.bin; cd ..;;
 3) note; cd hello_font; ./hello_font.bin; cd ..;;
 4) cd hello_video; ./hello_video.bin test.h264; cd ..;;
 5) note; cd hello_tiger; ./hello_tiger.bin; cd ..;;
 6) note; cd hello_triangle2; ./hello_triangle2.bin; cd ..;;
 7) note; cd hello_triangle; ./hello_triangle.bin; cd ..;;
 8) note; cd hello_videocube; ./hello_videocube.bin; cd ..;;
 9) note; cd hello_teapot; ./hello_teapot.bin; cd ..;;
 10) cd hello_dispmanx; ./hello_dispmanx.bin; cd ..;;
 11) cd hello_encode; ./hello_encode.bin; cd ..;;
 12) cd hello_fft; ./hello_fft.bin; cd ..;;
 13) cd hello_jpeg; ./hello_jpeg.bin; cd ..;;
 "EXIT") exit 0;;
esac
done
