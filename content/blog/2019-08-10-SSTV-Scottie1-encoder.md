---
layout: post
published: true
title: SSTV Scottie 1 Encoder explanation
date: 2019-08-09  # La fecha va con la forma YYYY-MM-DD
tags: [
  "SSTV",
  "Scottie 1",
  "Arduino",
  "SSTV Encoder",
  "SSTV Scottie 1 Encoder",
  "Radioadición",
  "C"
]
categorias: [
  "SSTV",
  "Proyecto",
  "Radioafición"
]
image: /blog/2019-08-10/BBC-Test.jpg
---

Slow-scan television (SSTV) is a method for picture transmission used by amateur radio operators to transmit and receive images. SSTV uses analog frequency modulation, in which every different value of brightness in the image gets a different audio frequency. In other words, the signal frequency shifts up or down to designate brighter or darker pixels, respectively. Color is achieved by sending the brightness of each color component separately.

This post is a simple guide of **how to generate SSTV Scottie 1**. This encoder **will be a part of our future project in RadioClub EIT** consisting of an SSTV Encoder with an Arduino, to transmit pictures from the sky by radio.

![Sample model](/blog/2019-08-10/BBC-Test.jpg)


Scottie 1 sample output:

<audio src="https://www.sigidwiki.com/images/8/80/Scottie_1.mp3" controls="" preload="none" width="300"></audio>

<br>

For creating this encoder, first we need to read the specification of this codification. Next lines will be a simple summary [from barberdsp.com (Dayton SSTV forum, 20 May 2000)](http://www.barberdsp.com/downloads/Dayton%20Paper.pdf).

---

## SCOTTIE 1 MODE

### Properties

<br>

| Property | Value |
| --- | --- |
| VIS CODE | 60d (0111100) |
| COLOR MODE | RGB(1500-2300Hz) |
| SCAN SEQUENCE | Gren, Blue, Red |
| Number of lines | 256 |
| Picture dimensions | 320x256 px |
| Transmission time | 109.6 s |
| Color scan time per line | 138.2440 ms |
| Color scan time per pixel| 0.4320 ms |

<br>

### Timing sequence

<br>

| # | Desc | Time[ms] | Frequency[Hz] |
|---|---|---|---|
| 1 | "Starting" sync pulse (first line only!) | 9.0 | 1200 |
| 2 | Separator pulse | 1.5 | 1500 |
| 3 | Green scan | | |
| 4 | Separator pulse | 1.5 | 1500 |
| 5 | Blue scan |  | |
| 6 | Sync pulse | 9.0 | 1200 |
| 7 | Sync porch | 1.5 | 1500 |
| 8 | Red scan | | |

<br>

### Scottie 1 Calibration header with VIS code

<br>

| Identity | Frequency[Hz] | Time[ms] |
|---|---|---|
| Leader tone | 1900 | 300 |
| Break  | 1200 | 10 |
| Leader tone | 1900 | 300 |
| VIS start bit | 1200 | 30 |
| VIS CODE Bit 0  - 1100Hz = "1",  1300Hz = "0" | 1300 | 30 |
| VIS CODE Bit 1 | 1300 | 30 |
| VIS CODE Bit 2 | 1100 | 30 |
| VIS CODE Bit 3 | 1100 | 30 |
| VIS CODE Bit 4 | 1100 | 30 |
| VIS CODE Bit 5 | 1100 | 30 |
| VIS CODE Bit 6 | 1300 | 30 |
| Parity  -  Even = 1300Hz, Odd = 1100Hz | 1300 | 30 |
| VIS stop bit | 1200 | 30 |

<br>

---

### Simple encoder example

This code is a part of an Arduino Project. It's very ilustrative of how Scottie 1 SSTV is generated.

In this example, `myFile` its an stream in which are stored in binary the pixels of the picture in the form *RedByteGreenByteBlueByte*. Each pixel  are encoded with a 24-bit RGB.

```C

//Methods prototypes
void transmit(int freq, int duration);  // Generate a sinus signal with the given freq and time
void myFile.read(); // Return the next byte of a stream (myFile)

/** VOX TONE (OPTIONAL) **/
transmit(1900, 100);
transmit(1500, 100);
transmit(1900, 100);
transmit(1500, 100);
transmit(2300, 100);
transmit(1500, 100);
transmit(2300, 100);
transmit(1500, 100);

/** CALIBRATION HEADER **/

transmit(1900, 300);
transmit(1200, 10);
transmit(1900, 300);
transmit(1200, 30);
transmit(1300, 30);    // 0
transmit(1300, 30);    // 0
transmit(1100, 30);    // 1
transmit(1100, 30);    // 1
transmit(1100, 30);    // 1
transmit(1100, 30);    // 1
transmit(1300, 30);    // 0
transmit(1300, 30);    // Even parity
transmit(1200, 30);    // VIS stop bit

/** STARTING SYNC PULSO (FIRST LINE ONLY)  **/

transmit(1200, 9);

/** TRANSMIT EACH LINE **/
while(myFile.available()){

  // Read line and store color values in the buffer
  for(uint16_t i = 0; i < 320; i++){
    buffR[i] = myFile.read(); // Read Next Byte
    buffG[i] = myFile.read();
    buffB[i] = myFile.read();
  }

  // Separator pulse
  transmit(1500, 1.5);

  // Green Scan
  for(uint16_t i = 0; i < 320; i++){
    transmit(1500 + 3.1372549 * buffG[i], 0.4320);    // .4320ms/pixel
  }

  // Separator Pulse
  transmit(1500, 1.5);

  // Blue Scan
  for(uint16_t i = 0; i < 320; i++){
    transmit(1500 + 3.1372549 * buffB[i], 0.4320);    // .4320ms/pixel
  }

  // Sync Pulse
  transmit(1200, 9);

  // Sync porch
  transmit(1500, 1.5);

  // Red Scan
  for(uint16_t i = 0; i < 320; i++){
    transmit(1500 + 3.1372549 * buffR[i], 0.4320);    // .4320ms/pixel
  }
}

```

<br>

That's all, hope you enjoy this old but not least codification.

acien101@debian:~$ EXIT
