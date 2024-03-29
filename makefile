all :  ov5642_capture ov5642_4cams_capture
INCLUDE1 = -I./ArduCAM -I./
INCLUDE2 =-I./ -I./ArduCAM
objects = ArduCAM.o arducam_arch_raspberrypi.o

ov5642_capture : $(objects) arducam_ov5642_capture.o
	g++ -o ov5642_capture $(objects) arducam_ov5642_capture.o -lwiringPi -Wall

ov5642_4cams_capture : $(objects) arducam_ov5642_4cams_capture.o
	g++ -o ov5642_4cams_capture $(objects) arducam_ov5642_4cams_capture.o -lwiringPi -Wall

ArduCAM.o : ArduCAM.cpp
	g++ $(INCLUDE1) -c ArduCAM.cpp
arducam_arch_raspberrypi.o : arducam_arch_raspberrypi.c
	g++ $(INCLUDE2) -c arducam_arch_raspberrypi.c


arducam_ov5642_capture.o : arducam_ov5642_capture.cpp
	g++ $(INCLUDE2) -c arducam_ov5642_capture.cpp

arducam_ov5642_4cams_capture.o : arducam_ov5642_4cams_capture.cpp
	g++ $(INCLUDE2) -c arducam_ov5642_4cams_capture.cpp

clean :
	rm -f  ov5642_capture ov5642_4cams_capture $(objects) *.o
