On branch vicon_listener_dev
Your branch is up to date with 'origin/vicon_listener_dev'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   src/cache/39041F30.json
	new file:   src/cache/9FA714B3.json
	deleted:    src/webots_pkg/pre_launch/calibrate_lh_config.py
	new file:   src/webots_pkg/pre_launch/write_lh_config.py
	new file:   src/webots_pkg/test/hardware/cache/39041F30.json
	new file:   src/webots_pkg/test/hardware/cache/9FA714B3.json
	modified:   src/webots_pkg/test/hardware/test_cf_lighthouse_configuration.py
	new file:   src/webots_pkg/test/software/cache/39041F30.json
	new file:   src/webots_pkg/test/software/cache/9FA714B3.json
	modified:   src/webots_pkg/test/software/test_lighthouse_classes.py
	modified:   src/webots_pkg/test/vicon/test_vicon_listener.zsh
	modified:   src/webots_pkg/webots_pkg/lighthouse_classes.py

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   .gitignore
	deleted:    src/webots_pkg/test/hardware/cache/39041F30.json
	deleted:    src/webots_pkg/test/hardware/cache/9FA714B3.json
	deleted:    src/webots_pkg/test/software/cache/39041F30.json
	deleted:    src/webots_pkg/test/software/cache/4D09B1EC.json
	deleted:    src/webots_pkg/test/software/cache/9FA714B3.json
	deleted:    src/webots_pkg/test/software/cache/C6165696.json

Changes to be committed:
diff --git c/src/cache/39041F30.json i/src/cache/39041F30.json
new file mode 100644
index 0000000..ea9e30f
--- /dev/null
+++ i/src/cache/39041F30.json
@@ -0,0 +1,4463 @@
+{
+  "activeMarker": {
+    "btSns": {
+      "__class__": "LogTocElement",
+      "ident": 0,
+      "group": "activeMarker",
+      "name": "btSns",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "i2cOk": {
+      "__class__": "LogTocElement",
+      "ident": 1,
+      "group": "activeMarker",
+      "name": "i2cOk",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "motion": {
+    "motion": {
+      "__class__": "LogTocElement",
+      "ident": 2,
+      "group": "motion",
+      "name": "motion",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "deltaX": {
+      "__class__": "LogTocElement",
+      "ident": 3,
+      "group": "motion",
+      "name": "deltaX",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "deltaY": {
+      "__class__": "LogTocElement",
+      "ident": 4,
+      "group": "motion",
+      "name": "deltaY",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "shutter": {
+      "__class__": "LogTocElement",
+      "ident": 5,
+      "group": "motion",
+      "name": "shutter",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "maxRaw": {
+      "__class__": "LogTocElement",
+      "ident": 6,
+      "group": "motion",
+      "name": "maxRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "minRaw": {
+      "__class__": "LogTocElement",
+      "ident": 7,
+      "group": "motion",
+      "name": "minRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Rawsum": {
+      "__class__": "LogTocElement",
+      "ident": 8,
+      "group": "motion",
+      "name": "Rawsum",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "outlierCount": {
+      "__class__": "LogTocElement",
+      "ident": 9,
+      "group": "motion",
+      "name": "outlierCount",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "squal": {
+      "__class__": "LogTocElement",
+      "ident": 10,
+      "group": "motion",
+      "name": "squal",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "std": {
+      "__class__": "LogTocElement",
+      "ident": 11,
+      "group": "motion",
+      "name": "std",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ring": {
+    "fadeTime": {
+      "__class__": "LogTocElement",
+      "ident": 12,
+      "group": "ring",
+      "name": "fadeTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "loco": {
+    "mode": {
+      "__class__": "LogTocElement",
+      "ident": 13,
+      "group": "loco",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "spiWr": {
+      "__class__": "LogTocElement",
+      "ident": 14,
+      "group": "loco",
+      "name": "spiWr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiRe": {
+      "__class__": "LogTocElement",
+      "ident": 15,
+      "group": "loco",
+      "name": "spiRe",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ranging": {
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 16,
+      "group": "ranging",
+      "name": "state",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "distance0": {
+      "__class__": "LogTocElement",
+      "ident": 17,
+      "group": "ranging",
+      "name": "distance0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance1": {
+      "__class__": "LogTocElement",
+      "ident": 18,
+      "group": "ranging",
+      "name": "distance1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance2": {
+      "__class__": "LogTocElement",
+      "ident": 19,
+      "group": "ranging",
+      "name": "distance2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance3": {
+      "__class__": "LogTocElement",
+      "ident": 20,
+      "group": "ranging",
+      "name": "distance3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance4": {
+      "__class__": "LogTocElement",
+      "ident": 21,
+      "group": "ranging",
+      "name": "distance4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance5": {
+      "__class__": "LogTocElement",
+      "ident": 22,
+      "group": "ranging",
+      "name": "distance5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance6": {
+      "__class__": "LogTocElement",
+      "ident": 23,
+      "group": "ranging",
+      "name": "distance6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance7": {
+      "__class__": "LogTocElement",
+      "ident": 24,
+      "group": "ranging",
+      "name": "distance7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure0": {
+      "__class__": "LogTocElement",
+      "ident": 25,
+      "group": "ranging",
+      "name": "pressure0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure1": {
+      "__class__": "LogTocElement",
+      "ident": 26,
+      "group": "ranging",
+      "name": "pressure1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure2": {
+      "__class__": "LogTocElement",
+      "ident": 27,
+      "group": "ranging",
+      "name": "pressure2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure3": {
+      "__class__": "LogTocElement",
+      "ident": 28,
+      "group": "ranging",
+      "name": "pressure3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure4": {
+      "__class__": "LogTocElement",
+      "ident": 29,
+      "group": "ranging",
+      "name": "pressure4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure5": {
+      "__class__": "LogTocElement",
+      "ident": 30,
+      "group": "ranging",
+      "name": "pressure5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure6": {
+      "__class__": "LogTocElement",
+      "ident": 31,
+      "group": "ranging",
+      "name": "pressure6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure7": {
+      "__class__": "LogTocElement",
+      "ident": 32,
+      "group": "ranging",
+      "name": "pressure7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "tdoa2": {
+    "d7-0": {
+      "__class__": "LogTocElement",
+      "ident": 33,
+      "group": "tdoa2",
+      "name": "d7-0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d0-1": {
+      "__class__": "LogTocElement",
+      "ident": 34,
+      "group": "tdoa2",
+      "name": "d0-1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d1-2": {
+      "__class__": "LogTocElement",
+      "ident": 35,
+      "group": "tdoa2",
+      "name": "d1-2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d2-3": {
+      "__class__": "LogTocElement",
+      "ident": 36,
+      "group": "tdoa2",
+      "name": "d2-3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d3-4": {
+      "__class__": "LogTocElement",
+      "ident": 37,
+      "group": "tdoa2",
+      "name": "d3-4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d4-5": {
+      "__class__": "LogTocElement",
+      "ident": 38,
+      "group": "tdoa2",
+      "name": "d4-5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d5-6": {
+      "__class__": "LogTocElement",
+      "ident": 39,
+      "group": "tdoa2",
+      "name": "d5-6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d6-7": {
+      "__class__": "LogTocElement",
+      "ident": 40,
+      "group": "tdoa2",
+      "name": "d6-7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc0": {
+      "__class__": "LogTocElement",
+      "ident": 41,
+      "group": "tdoa2",
+      "name": "cc0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc1": {
+      "__class__": "LogTocElement",
+      "ident": 42,
+      "group": "tdoa2",
+      "name": "cc1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc2": {
+      "__class__": "LogTocElement",
+      "ident": 43,
+      "group": "tdoa2",
+      "name": "cc2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc3": {
+      "__class__": "LogTocElement",
+      "ident": 44,
+      "group": "tdoa2",
+      "name": "cc3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc4": {
+      "__class__": "LogTocElement",
+      "ident": 45,
+      "group": "tdoa2",
+      "name": "cc4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc5": {
+      "__class__": "LogTocElement",
+      "ident": 46,
+      "group": "tdoa2",
+      "name": "cc5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc6": {
+      "__class__": "LogTocElement",
+      "ident": 47,
+      "group": "tdoa2",
+      "name": "cc6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc7": {
+      "__class__": "LogTocElement",
+      "ident": 48,
+      "group": "tdoa2",
+      "name": "cc7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "dist7-0": {
+      "__class__": "LogTocElement",
+      "ident": 49,
+      "group": "tdoa2",
+      "name": "dist7-0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist0-1": {
+      "__class__": "LogTocElement",
+      "ident": 50,
+      "group": "tdoa2",
+      "name": "dist0-1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist1-2": {
+      "__class__": "LogTocElement",
+      "ident": 51,
+      "group": "tdoa2",
+      "name": "dist1-2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist2-3": {
+      "__class__": "LogTocElement",
+      "ident": 52,
+      "group": "tdoa2",
+      "name": "dist2-3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist3-4": {
+      "__class__": "LogTocElement",
+      "ident": 53,
+      "group": "tdoa2",
+      "name": "dist3-4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist4-5": {
+      "__class__": "LogTocElement",
+      "ident": 54,
+      "group": "tdoa2",
+      "name": "dist4-5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist5-6": {
+      "__class__": "LogTocElement",
+      "ident": 55,
+      "group": "tdoa2",
+      "name": "dist5-6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist6-7": {
+      "__class__": "LogTocElement",
+      "ident": 56,
+      "group": "tdoa2",
+      "name": "dist6-7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "twr": {
+    "rangingSuccessRate0": {
+      "__class__": "LogTocElement",
+      "ident": 57,
+      "group": "twr",
+      "name": "rangingSuccessRate0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec0": {
+      "__class__": "LogTocElement",
+      "ident": 58,
+      "group": "twr",
+      "name": "rangingPerSec0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate1": {
+      "__class__": "LogTocElement",
+      "ident": 59,
+      "group": "twr",
+      "name": "rangingSuccessRate1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec1": {
+      "__class__": "LogTocElement",
+      "ident": 60,
+      "group": "twr",
+      "name": "rangingPerSec1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate2": {
+      "__class__": "LogTocElement",
+      "ident": 61,
+      "group": "twr",
+      "name": "rangingSuccessRate2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec2": {
+      "__class__": "LogTocElement",
+      "ident": 62,
+      "group": "twr",
+      "name": "rangingPerSec2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate3": {
+      "__class__": "LogTocElement",
+      "ident": 63,
+      "group": "twr",
+      "name": "rangingSuccessRate3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec3": {
+      "__class__": "LogTocElement",
+      "ident": 64,
+      "group": "twr",
+      "name": "rangingPerSec3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate4": {
+      "__class__": "LogTocElement",
+      "ident": 65,
+      "group": "twr",
+      "name": "rangingSuccessRate4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec4": {
+      "__class__": "LogTocElement",
+      "ident": 66,
+      "group": "twr",
+      "name": "rangingPerSec4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate5": {
+      "__class__": "LogTocElement",
+      "ident": 67,
+      "group": "twr",
+      "name": "rangingSuccessRate5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec5": {
+      "__class__": "LogTocElement",
+      "ident": 68,
+      "group": "twr",
+      "name": "rangingPerSec5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "oa": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 69,
+      "group": "oa",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 70,
+      "group": "oa",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 71,
+      "group": "oa",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 72,
+      "group": "oa",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 73,
+      "group": "oa",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "usd": {
+    "spiWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 74,
+      "group": "usd",
+      "name": "spiWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiReBps": {
+      "__class__": "LogTocElement",
+      "ident": 75,
+      "group": "usd",
+      "name": "spiReBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "fatWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 76,
+      "group": "usd",
+      "name": "fatWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "motor": {
+    "m1": {
+      "__class__": "LogTocElement",
+      "ident": 77,
+      "group": "motor",
+      "name": "m1",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m2": {
+      "__class__": "LogTocElement",
+      "ident": 78,
+      "group": "motor",
+      "name": "m2",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m3": {
+      "__class__": "LogTocElement",
+      "ident": 79,
+      "group": "motor",
+      "name": "m3",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m4": {
+      "__class__": "LogTocElement",
+      "ident": 80,
+      "group": "motor",
+      "name": "m4",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m1req": {
+      "__class__": "LogTocElement",
+      "ident": 81,
+      "group": "motor",
+      "name": "m1req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m2req": {
+      "__class__": "LogTocElement",
+      "ident": 82,
+      "group": "motor",
+      "name": "m2req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m3req": {
+      "__class__": "LogTocElement",
+      "ident": 83,
+      "group": "motor",
+      "name": "m3req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m4req": {
+      "__class__": "LogTocElement",
+      "ident": 84,
+      "group": "motor",
+      "name": "m4req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "pm": {
+    "vbat": {
+      "__class__": "LogTocElement",
+      "ident": 85,
+      "group": "pm",
+      "name": "vbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 86,
+      "group": "pm",
+      "name": "vbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extVbat": {
+      "__class__": "LogTocElement",
+      "ident": 87,
+      "group": "pm",
+      "name": "extVbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "extVbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 88,
+      "group": "pm",
+      "name": "extVbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extCurr": {
+      "__class__": "LogTocElement",
+      "ident": 89,
+      "group": "pm",
+      "name": "extCurr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "chargeCurrent": {
+      "__class__": "LogTocElement",
+      "ident": 90,
+      "group": "pm",
+      "name": "chargeCurrent",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 91,
+      "group": "pm",
+      "name": "state",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "batteryLevel": {
+      "__class__": "LogTocElement",
+      "ident": 92,
+      "group": "pm",
+      "name": "batteryLevel",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "radio": {
+    "rssi": {
+      "__class__": "LogTocElement",
+      "ident": 93,
+      "group": "radio",
+      "name": "rssi",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isConnected": {
+      "__class__": "LogTocElement",
+      "ident": 94,
+      "group": "radio",
+      "name": "isConnected",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "gyro": {
+    "xRaw": {
+      "__class__": "LogTocElement",
+      "ident": 95,
+      "group": "gyro",
+      "name": "xRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "yRaw": {
+      "__class__": "LogTocElement",
+      "ident": 96,
+      "group": "gyro",
+      "name": "yRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "zRaw": {
+      "__class__": "LogTocElement",
+      "ident": 97,
+      "group": "gyro",
+      "name": "zRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "xVariance": {
+      "__class__": "LogTocElement",
+      "ident": 98,
+      "group": "gyro",
+      "name": "xVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yVariance": {
+      "__class__": "LogTocElement",
+      "ident": 99,
+      "group": "gyro",
+      "name": "yVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVariance": {
+      "__class__": "LogTocElement",
+      "ident": 100,
+      "group": "gyro",
+      "name": "zVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 101,
+      "group": "gyro",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 102,
+      "group": "gyro",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 103,
+      "group": "gyro",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "colAv": {
+    "latency": {
+      "__class__": "LogTocElement",
+      "ident": 104,
+      "group": "colAv",
+      "name": "latency",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "ext_pos": {
+    "X": {
+      "__class__": "LogTocElement",
+      "ident": 105,
+      "group": "ext_pos",
+      "name": "X",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Y": {
+      "__class__": "LogTocElement",
+      "ident": 106,
+      "group": "ext_pos",
+      "name": "Y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Z": {
+      "__class__": "LogTocElement",
+      "ident": 107,
+      "group": "ext_pos",
+      "name": "Z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrv": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 108,
+      "group": "locSrv",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 109,
+      "group": "locSrv",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 110,
+      "group": "locSrv",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 111,
+      "group": "locSrv",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 112,
+      "group": "locSrv",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 113,
+      "group": "locSrv",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 114,
+      "group": "locSrv",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrvZ": {
+    "tick": {
+      "__class__": "LogTocElement",
+      "ident": 115,
+      "group": "locSrvZ",
+      "name": "tick",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "crtp": {
+    "rxRate": {
+      "__class__": "LogTocElement",
+      "ident": 116,
+      "group": "crtp",
+      "name": "rxRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "txRate": {
+      "__class__": "LogTocElement",
+      "ident": 117,
+      "group": "crtp",
+      "name": "txRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "extrx": {
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 118,
+      "group": "extrx",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 119,
+      "group": "extrx",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 120,
+      "group": "extrx",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 121,
+      "group": "extrx",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 122,
+      "group": "extrx",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 123,
+      "group": "extrx",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVel": {
+      "__class__": "LogTocElement",
+      "ident": 124,
+      "group": "extrx",
+      "name": "zVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "AltHold": {
+      "__class__": "LogTocElement",
+      "ident": 125,
+      "group": "extrx",
+      "name": "AltHold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Arm": {
+      "__class__": "LogTocElement",
+      "ident": 126,
+      "group": "extrx",
+      "name": "Arm",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "extrx_raw": {
+    "ch0": {
+      "__class__": "LogTocElement",
+      "ident": 127,
+      "group": "extrx_raw",
+      "name": "ch0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch1": {
+      "__class__": "LogTocElement",
+      "ident": 128,
+      "group": "extrx_raw",
+      "name": "ch1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch2": {
+      "__class__": "LogTocElement",
+      "ident": 129,
+      "group": "extrx_raw",
+      "name": "ch2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch3": {
+      "__class__": "LogTocElement",
+      "ident": 130,
+      "group": "extrx_raw",
+      "name": "ch3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch4": {
+      "__class__": "LogTocElement",
+      "ident": 131,
+      "group": "extrx_raw",
+      "name": "ch4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch5": {
+      "__class__": "LogTocElement",
+      "ident": 132,
+      "group": "extrx_raw",
+      "name": "ch5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch6": {
+      "__class__": "LogTocElement",
+      "ident": 133,
+      "group": "extrx_raw",
+      "name": "ch6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch7": {
+      "__class__": "LogTocElement",
+      "ident": 134,
+      "group": "extrx_raw",
+      "name": "ch7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "health": {
+    "motorVarXM1": {
+      "__class__": "LogTocElement",
+      "ident": 135,
+      "group": "health",
+      "name": "motorVarXM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM1": {
+      "__class__": "LogTocElement",
+      "ident": 136,
+      "group": "health",
+      "name": "motorVarYM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM2": {
+      "__class__": "LogTocElement",
+      "ident": 137,
+      "group": "health",
+      "name": "motorVarXM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM2": {
+      "__class__": "LogTocElement",
+      "ident": 138,
+      "group": "health",
+      "name": "motorVarYM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM3": {
+      "__class__": "LogTocElement",
+      "ident": 139,
+      "group": "health",
+      "name": "motorVarXM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM3": {
+      "__class__": "LogTocElement",
+      "ident": 140,
+      "group": "health",
+      "name": "motorVarYM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM4": {
+      "__class__": "LogTocElement",
+      "ident": 141,
+      "group": "health",
+      "name": "motorVarXM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM4": {
+      "__class__": "LogTocElement",
+      "ident": 142,
+      "group": "health",
+      "name": "motorVarYM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorPass": {
+      "__class__": "LogTocElement",
+      "ident": 143,
+      "group": "health",
+      "name": "motorPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "batterySag": {
+      "__class__": "LogTocElement",
+      "ident": 144,
+      "group": "health",
+      "name": "batterySag",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "batteryPass": {
+      "__class__": "LogTocElement",
+      "ident": 145,
+      "group": "health",
+      "name": "batteryPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "motorTestCount": {
+      "__class__": "LogTocElement",
+      "ident": 146,
+      "group": "health",
+      "name": "motorTestCount",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "memTst": {
+    "errCntW": {
+      "__class__": "LogTocElement",
+      "ident": 147,
+      "group": "memTst",
+      "name": "errCntW",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "range": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 148,
+      "group": "range",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 149,
+      "group": "range",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 150,
+      "group": "range",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 151,
+      "group": "range",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 152,
+      "group": "range",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "zrange": {
+      "__class__": "LogTocElement",
+      "ident": 153,
+      "group": "range",
+      "name": "zrange",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "sensfusion6": {
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 154,
+      "group": "sensfusion6",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 155,
+      "group": "sensfusion6",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 156,
+      "group": "sensfusion6",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 157,
+      "group": "sensfusion6",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityX": {
+      "__class__": "LogTocElement",
+      "ident": 158,
+      "group": "sensfusion6",
+      "name": "gravityX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityY": {
+      "__class__": "LogTocElement",
+      "ident": 159,
+      "group": "sensfusion6",
+      "name": "gravityY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityZ": {
+      "__class__": "LogTocElement",
+      "ident": 160,
+      "group": "sensfusion6",
+      "name": "gravityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accZbase": {
+      "__class__": "LogTocElement",
+      "ident": 161,
+      "group": "sensfusion6",
+      "name": "accZbase",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "isInit": {
+      "__class__": "LogTocElement",
+      "ident": 162,
+      "group": "sensfusion6",
+      "name": "isInit",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isCalibrated": {
+      "__class__": "LogTocElement",
+      "ident": 163,
+      "group": "sensfusion6",
+      "name": "isCalibrated",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "acc": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 164,
+      "group": "acc",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 165,
+      "group": "acc",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 166,
+      "group": "acc",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "baro": {
+    "asl": {
+      "__class__": "LogTocElement",
+      "ident": 167,
+      "group": "baro",
+      "name": "asl",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "temp": {
+      "__class__": "LogTocElement",
+      "ident": 168,
+      "group": "baro",
+      "name": "temp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure": {
+      "__class__": "LogTocElement",
+      "ident": 169,
+      "group": "baro",
+      "name": "pressure",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "controller": {
+    "ctr_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 170,
+      "group": "controller",
+      "name": "ctr_yaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 171,
+      "group": "controller",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 172,
+      "group": "controller",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 173,
+      "group": "controller",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 174,
+      "group": "controller",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 175,
+      "group": "controller",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 176,
+      "group": "controller",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 177,
+      "group": "controller",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 178,
+      "group": "controller",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "actuatorThrust": {
+      "__class__": "LogTocElement",
+      "ident": 179,
+      "group": "controller",
+      "name": "actuatorThrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 180,
+      "group": "controller",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 181,
+      "group": "controller",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 182,
+      "group": "controller",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 183,
+      "group": "controller",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 184,
+      "group": "controller",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 185,
+      "group": "controller",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltarget": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 186,
+      "group": "ctrltarget",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 187,
+      "group": "ctrltarget",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 188,
+      "group": "ctrltarget",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 189,
+      "group": "ctrltarget",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 190,
+      "group": "ctrltarget",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 191,
+      "group": "ctrltarget",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 192,
+      "group": "ctrltarget",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 193,
+      "group": "ctrltarget",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 194,
+      "group": "ctrltarget",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 195,
+      "group": "ctrltarget",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 196,
+      "group": "ctrltarget",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 197,
+      "group": "ctrltarget",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltargetZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 198,
+      "group": "ctrltargetZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 199,
+      "group": "ctrltargetZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 200,
+      "group": "ctrltargetZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 201,
+      "group": "ctrltargetZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 202,
+      "group": "ctrltargetZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 203,
+      "group": "ctrltargetZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 204,
+      "group": "ctrltargetZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 205,
+      "group": "ctrltargetZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 206,
+      "group": "ctrltargetZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "mag": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 207,
+      "group": "mag",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 208,
+      "group": "mag",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 209,
+      "group": "mag",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stabilizer": {
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 210,
+      "group": "stabilizer",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 211,
+      "group": "stabilizer",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 212,
+      "group": "stabilizer",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 213,
+      "group": "stabilizer",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtStab": {
+      "__class__": "LogTocElement",
+      "ident": 214,
+      "group": "stabilizer",
+      "name": "rtStab",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "intToOut": {
+      "__class__": "LogTocElement",
+      "ident": 215,
+      "group": "stabilizer",
+      "name": "intToOut",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "stateEstimate": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 216,
+      "group": "stateEstimate",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 217,
+      "group": "stateEstimate",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 218,
+      "group": "stateEstimate",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 219,
+      "group": "stateEstimate",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 220,
+      "group": "stateEstimate",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 221,
+      "group": "stateEstimate",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 222,
+      "group": "stateEstimate",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 223,
+      "group": "stateEstimate",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 224,
+      "group": "stateEstimate",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 225,
+      "group": "stateEstimate",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 226,
+      "group": "stateEstimate",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 227,
+      "group": "stateEstimate",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 228,
+      "group": "stateEstimate",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 229,
+      "group": "stateEstimate",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 230,
+      "group": "stateEstimate",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 231,
+      "group": "stateEstimate",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stateEstimateZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 232,
+      "group": "stateEstimateZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 233,
+      "group": "stateEstimateZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 234,
+      "group": "stateEstimateZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 235,
+      "group": "stateEstimateZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 236,
+      "group": "stateEstimateZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 237,
+      "group": "stateEstimateZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 238,
+      "group": "stateEstimateZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 239,
+      "group": "stateEstimateZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 240,
+      "group": "stateEstimateZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "quat": {
+      "__class__": "LogTocElement",
+      "ident": 241,
+      "group": "stateEstimateZ",
+      "name": "quat",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "rateRoll": {
+      "__class__": "LogTocElement",
+      "ident": 242,
+      "group": "stateEstimateZ",
+      "name": "rateRoll",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ratePitch": {
+      "__class__": "LogTocElement",
+      "ident": 243,
+      "group": "stateEstimateZ",
+      "name": "ratePitch",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "rateYaw": {
+      "__class__": "LogTocElement",
+      "ident": 244,
+      "group": "stateEstimateZ",
+      "name": "rateYaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "sys": {
+    "canfly": {
+      "__class__": "LogTocElement",
+      "ident": 245,
+      "group": "sys",
+      "name": "canfly",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isFlying": {
+      "__class__": "LogTocElement",
+      "ident": 246,
+      "group": "sys",
+      "name": "isFlying",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isTumbled": {
+      "__class__": "LogTocElement",
+      "ident": 247,
+      "group": "sys",
+      "name": "isTumbled",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "armed": {
+      "__class__": "LogTocElement",
+      "ident": 248,
+      "group": "sys",
+      "name": "armed",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "testLogParam": {
+      "__class__": "LogTocElement",
+      "ident": 249,
+      "group": "sys",
+      "name": "testLogParam",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    }
+  },
+  "tdoaEngine": {
+    "stRx": {
+      "__class__": "LogTocElement",
+      "ident": 250,
+      "group": "tdoaEngine",
+      "name": "stRx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stEst": {
+      "__class__": "LogTocElement",
+      "ident": 251,
+      "group": "tdoaEngine",
+      "name": "stEst",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stTime": {
+      "__class__": "LogTocElement",
+      "ident": 252,
+      "group": "tdoaEngine",
+      "name": "stTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stFound": {
+      "__class__": "LogTocElement",
+      "ident": 253,
+      "group": "tdoaEngine",
+      "name": "stFound",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stCc": {
+      "__class__": "LogTocElement",
+      "ident": 254,
+      "group": "tdoaEngine",
+      "name": "stCc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stHit": {
+      "__class__": "LogTocElement",
+      "ident": 255,
+      "group": "tdoaEngine",
+      "name": "stHit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stMiss": {
+      "__class__": "LogTocElement",
+      "ident": 256,
+      "group": "tdoaEngine",
+      "name": "stMiss",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc": {
+      "__class__": "LogTocElement",
+      "ident": 257,
+      "group": "tdoaEngine",
+      "name": "cc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "tof": {
+      "__class__": "LogTocElement",
+      "ident": 258,
+      "group": "tdoaEngine",
+      "name": "tof",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "tdoa": {
+      "__class__": "LogTocElement",
+      "ident": 259,
+      "group": "tdoaEngine",
+      "name": "tdoa",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman_pred": {
+    "predNX": {
+      "__class__": "LogTocElement",
+      "ident": 260,
+      "group": "kalman_pred",
+      "name": "predNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "predNY": {
+      "__class__": "LogTocElement",
+      "ident": 261,
+      "group": "kalman_pred",
+      "name": "predNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNX": {
+      "__class__": "LogTocElement",
+      "ident": 262,
+      "group": "kalman_pred",
+      "name": "measNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNY": {
+      "__class__": "LogTocElement",
+      "ident": 263,
+      "group": "kalman_pred",
+      "name": "measNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "lighthouse": {
+    "validAngles": {
+      "__class__": "LogTocElement",
+      "ident": 264,
+      "group": "lighthouse",
+      "name": "validAngles",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rawAngle0x": {
+      "__class__": "LogTocElement",
+      "ident": 265,
+      "group": "lighthouse",
+      "name": "rawAngle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0y": {
+      "__class__": "LogTocElement",
+      "ident": 266,
+      "group": "lighthouse",
+      "name": "rawAngle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1x": {
+      "__class__": "LogTocElement",
+      "ident": 267,
+      "group": "lighthouse",
+      "name": "rawAngle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1y": {
+      "__class__": "LogTocElement",
+      "ident": 268,
+      "group": "lighthouse",
+      "name": "rawAngle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x": {
+      "__class__": "LogTocElement",
+      "ident": 269,
+      "group": "lighthouse",
+      "name": "angle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y": {
+      "__class__": "LogTocElement",
+      "ident": 270,
+      "group": "lighthouse",
+      "name": "angle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x": {
+      "__class__": "LogTocElement",
+      "ident": 271,
+      "group": "lighthouse",
+      "name": "angle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y": {
+      "__class__": "LogTocElement",
+      "ident": 272,
+      "group": "lighthouse",
+      "name": "angle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_1": {
+      "__class__": "LogTocElement",
+      "ident": 273,
+      "group": "lighthouse",
+      "name": "angle0x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_1": {
+      "__class__": "LogTocElement",
+      "ident": 274,
+      "group": "lighthouse",
+      "name": "angle0y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_1": {
+      "__class__": "LogTocElement",
+      "ident": 275,
+      "group": "lighthouse",
+      "name": "angle1x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_1": {
+      "__class__": "LogTocElement",
+      "ident": 276,
+      "group": "lighthouse",
+      "name": "angle1y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_2": {
+      "__class__": "LogTocElement",
+      "ident": 277,
+      "group": "lighthouse",
+      "name": "angle0x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_2": {
+      "__class__": "LogTocElement",
+      "ident": 278,
+      "group": "lighthouse",
+      "name": "angle0y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_2": {
+      "__class__": "LogTocElement",
+      "ident": 279,
+      "group": "lighthouse",
+      "name": "angle1x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_2": {
+      "__class__": "LogTocElement",
+      "ident": 280,
+      "group": "lighthouse",
+      "name": "angle1y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_3": {
+      "__class__": "LogTocElement",
+      "ident": 281,
+      "group": "lighthouse",
+      "name": "angle0x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_3": {
+      "__class__": "LogTocElement",
+      "ident": 282,
+      "group": "lighthouse",
+      "name": "angle0y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_3": {
+      "__class__": "LogTocElement",
+      "ident": 283,
+      "group": "lighthouse",
+      "name": "angle1x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_3": {
+      "__class__": "LogTocElement",
+      "ident": 284,
+      "group": "lighthouse",
+      "name": "angle1y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 285,
+      "group": "lighthouse",
+      "name": "rawAngle0xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 286,
+      "group": "lighthouse",
+      "name": "rawAngle0ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 287,
+      "group": "lighthouse",
+      "name": "rawAngle1xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 288,
+      "group": "lighthouse",
+      "name": "rawAngle1ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 289,
+      "group": "lighthouse",
+      "name": "angle0x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 290,
+      "group": "lighthouse",
+      "name": "angle0y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 291,
+      "group": "lighthouse",
+      "name": "angle1x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 292,
+      "group": "lighthouse",
+      "name": "angle1y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "width0": {
+      "__class__": "LogTocElement",
+      "ident": 293,
+      "group": "lighthouse",
+      "name": "width0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width1": {
+      "__class__": "LogTocElement",
+      "ident": 294,
+      "group": "lighthouse",
+      "name": "width1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width2": {
+      "__class__": "LogTocElement",
+      "ident": 295,
+      "group": "lighthouse",
+      "name": "width2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width3": {
+      "__class__": "LogTocElement",
+      "ident": 296,
+      "group": "lighthouse",
+      "name": "width3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "comSync": {
+      "__class__": "LogTocElement",
+      "ident": 297,
+      "group": "lighthouse",
+      "name": "comSync",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "bsAvailable": {
+      "__class__": "LogTocElement",
+      "ident": 298,
+      "group": "lighthouse",
+      "name": "bsAvailable",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsReceive": {
+      "__class__": "LogTocElement",
+      "ident": 299,
+      "group": "lighthouse",
+      "name": "bsReceive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsActive": {
+      "__class__": "LogTocElement",
+      "ident": 300,
+      "group": "lighthouse",
+      "name": "bsActive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalUd": {
+      "__class__": "LogTocElement",
+      "ident": 301,
+      "group": "lighthouse",
+      "name": "bsCalUd",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalCon": {
+      "__class__": "LogTocElement",
+      "ident": 302,
+      "group": "lighthouse",
+      "name": "bsCalCon",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "status": {
+      "__class__": "LogTocElement",
+      "ident": 303,
+      "group": "lighthouse",
+      "name": "status",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "posRt": {
+      "__class__": "LogTocElement",
+      "ident": 304,
+      "group": "lighthouse",
+      "name": "posRt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs0Rt": {
+      "__class__": "LogTocElement",
+      "ident": 305,
+      "group": "lighthouse",
+      "name": "estBs0Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs1Rt": {
+      "__class__": "LogTocElement",
+      "ident": 306,
+      "group": "lighthouse",
+      "name": "estBs1Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 307,
+      "group": "lighthouse",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 308,
+      "group": "lighthouse",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 309,
+      "group": "lighthouse",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "delta": {
+      "__class__": "LogTocElement",
+      "ident": 310,
+      "group": "lighthouse",
+      "name": "delta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bsGeoVal": {
+      "__class__": "LogTocElement",
+      "ident": 311,
+      "group": "lighthouse",
+      "name": "bsGeoVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalVal": {
+      "__class__": "LogTocElement",
+      "ident": 312,
+      "group": "lighthouse",
+      "name": "bsCalVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "disProb": {
+      "__class__": "LogTocElement",
+      "ident": 313,
+      "group": "lighthouse",
+      "name": "disProb",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_attitude": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 314,
+      "group": "pid_attitude",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 315,
+      "group": "pid_attitude",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 316,
+      "group": "pid_attitude",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 317,
+      "group": "pid_attitude",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 318,
+      "group": "pid_attitude",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 319,
+      "group": "pid_attitude",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 320,
+      "group": "pid_attitude",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 321,
+      "group": "pid_attitude",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 322,
+      "group": "pid_attitude",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 323,
+      "group": "pid_attitude",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 324,
+      "group": "pid_attitude",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 325,
+      "group": "pid_attitude",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_rate": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 326,
+      "group": "pid_rate",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 327,
+      "group": "pid_rate",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 328,
+      "group": "pid_rate",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 329,
+      "group": "pid_rate",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 330,
+      "group": "pid_rate",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 331,
+      "group": "pid_rate",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 332,
+      "group": "pid_rate",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 333,
+      "group": "pid_rate",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 334,
+      "group": "pid_rate",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 335,
+      "group": "pid_rate",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 336,
+      "group": "pid_rate",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 337,
+      "group": "pid_rate",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlINDI": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 338,
+      "group": "ctrlINDI",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 339,
+      "group": "ctrlINDI",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 340,
+      "group": "ctrlINDI",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 341,
+      "group": "ctrlINDI",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 342,
+      "group": "ctrlINDI",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 343,
+      "group": "ctrlINDI",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 344,
+      "group": "ctrlINDI",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_p": {
+      "__class__": "LogTocElement",
+      "ident": 345,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_q": {
+      "__class__": "LogTocElement",
+      "ident": 346,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_r": {
+      "__class__": "LogTocElement",
+      "ident": 347,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_p": {
+      "__class__": "LogTocElement",
+      "ident": 348,
+      "group": "ctrlINDI",
+      "name": "du_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_q": {
+      "__class__": "LogTocElement",
+      "ident": 349,
+      "group": "ctrlINDI",
+      "name": "du_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_r": {
+      "__class__": "LogTocElement",
+      "ident": 350,
+      "group": "ctrlINDI",
+      "name": "du_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_p": {
+      "__class__": "LogTocElement",
+      "ident": 351,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_q": {
+      "__class__": "LogTocElement",
+      "ident": 352,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_r": {
+      "__class__": "LogTocElement",
+      "ident": 353,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[0]": {
+      "__class__": "LogTocElement",
+      "ident": 354,
+      "group": "ctrlINDI",
+      "name": "rate_d[0]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[1]": {
+      "__class__": "LogTocElement",
+      "ident": 355,
+      "group": "ctrlINDI",
+      "name": "rate_d[1]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[2]": {
+      "__class__": "LogTocElement",
+      "ident": 356,
+      "group": "ctrlINDI",
+      "name": "rate_d[2]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_p": {
+      "__class__": "LogTocElement",
+      "ident": 357,
+      "group": "ctrlINDI",
+      "name": "uf_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_q": {
+      "__class__": "LogTocElement",
+      "ident": 358,
+      "group": "ctrlINDI",
+      "name": "uf_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_r": {
+      "__class__": "LogTocElement",
+      "ident": 359,
+      "group": "ctrlINDI",
+      "name": "uf_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_p": {
+      "__class__": "LogTocElement",
+      "ident": 360,
+      "group": "ctrlINDI",
+      "name": "Omega_f_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_q": {
+      "__class__": "LogTocElement",
+      "ident": 361,
+      "group": "ctrlINDI",
+      "name": "Omega_f_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_r": {
+      "__class__": "LogTocElement",
+      "ident": 362,
+      "group": "ctrlINDI",
+      "name": "Omega_f_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_p": {
+      "__class__": "LogTocElement",
+      "ident": 363,
+      "group": "ctrlINDI",
+      "name": "n_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_q": {
+      "__class__": "LogTocElement",
+      "ident": 364,
+      "group": "ctrlINDI",
+      "name": "n_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_r": {
+      "__class__": "LogTocElement",
+      "ident": 365,
+      "group": "ctrlINDI",
+      "name": "n_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlMel": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 366,
+      "group": "ctrlMel",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 367,
+      "group": "ctrlMel",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 368,
+      "group": "ctrlMel",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 369,
+      "group": "ctrlMel",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 370,
+      "group": "ctrlMel",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 371,
+      "group": "ctrlMel",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 372,
+      "group": "ctrlMel",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 373,
+      "group": "ctrlMel",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdx": {
+      "__class__": "LogTocElement",
+      "ident": 374,
+      "group": "ctrlMel",
+      "name": "zdx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdy": {
+      "__class__": "LogTocElement",
+      "ident": 375,
+      "group": "ctrlMel",
+      "name": "zdy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdz": {
+      "__class__": "LogTocElement",
+      "ident": 376,
+      "group": "ctrlMel",
+      "name": "zdz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_x": {
+      "__class__": "LogTocElement",
+      "ident": 377,
+      "group": "ctrlMel",
+      "name": "i_err_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_y": {
+      "__class__": "LogTocElement",
+      "ident": 378,
+      "group": "ctrlMel",
+      "name": "i_err_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_z": {
+      "__class__": "LogTocElement",
+      "ident": 379,
+      "group": "ctrlMel",
+      "name": "i_err_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtrlIndi": {
+    "posRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 380,
+      "group": "posCtrlIndi",
+      "name": "posRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 381,
+      "group": "posCtrlIndi",
+      "name": "posRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 382,
+      "group": "posCtrlIndi",
+      "name": "posRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_x": {
+      "__class__": "LogTocElement",
+      "ident": 383,
+      "group": "posCtrlIndi",
+      "name": "velS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_y": {
+      "__class__": "LogTocElement",
+      "ident": 384,
+      "group": "posCtrlIndi",
+      "name": "velS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_z": {
+      "__class__": "LogTocElement",
+      "ident": 385,
+      "group": "posCtrlIndi",
+      "name": "velS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 386,
+      "group": "posCtrlIndi",
+      "name": "velRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 387,
+      "group": "posCtrlIndi",
+      "name": "velRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 388,
+      "group": "posCtrlIndi",
+      "name": "velRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_roll": {
+      "__class__": "LogTocElement",
+      "ident": 389,
+      "group": "posCtrlIndi",
+      "name": "angS_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 390,
+      "group": "posCtrlIndi",
+      "name": "angS_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 391,
+      "group": "posCtrlIndi",
+      "name": "angS_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_roll": {
+      "__class__": "LogTocElement",
+      "ident": 392,
+      "group": "posCtrlIndi",
+      "name": "angF_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 393,
+      "group": "posCtrlIndi",
+      "name": "angF_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 394,
+      "group": "posCtrlIndi",
+      "name": "angF_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 395,
+      "group": "posCtrlIndi",
+      "name": "accRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 396,
+      "group": "posCtrlIndi",
+      "name": "accRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 397,
+      "group": "posCtrlIndi",
+      "name": "accRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_x": {
+      "__class__": "LogTocElement",
+      "ident": 398,
+      "group": "posCtrlIndi",
+      "name": "accS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_y": {
+      "__class__": "LogTocElement",
+      "ident": 399,
+      "group": "posCtrlIndi",
+      "name": "accS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_z": {
+      "__class__": "LogTocElement",
+      "ident": 400,
+      "group": "posCtrlIndi",
+      "name": "accS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_x": {
+      "__class__": "LogTocElement",
+      "ident": 401,
+      "group": "posCtrlIndi",
+      "name": "accF_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_y": {
+      "__class__": "LogTocElement",
+      "ident": 402,
+      "group": "posCtrlIndi",
+      "name": "accF_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_z": {
+      "__class__": "LogTocElement",
+      "ident": 403,
+      "group": "posCtrlIndi",
+      "name": "accF_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_x": {
+      "__class__": "LogTocElement",
+      "ident": 404,
+      "group": "posCtrlIndi",
+      "name": "accFT_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_y": {
+      "__class__": "LogTocElement",
+      "ident": 405,
+      "group": "posCtrlIndi",
+      "name": "accFT_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_z": {
+      "__class__": "LogTocElement",
+      "ident": 406,
+      "group": "posCtrlIndi",
+      "name": "accFT_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_x": {
+      "__class__": "LogTocElement",
+      "ident": 407,
+      "group": "posCtrlIndi",
+      "name": "accErr_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_y": {
+      "__class__": "LogTocElement",
+      "ident": 408,
+      "group": "posCtrlIndi",
+      "name": "accErr_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_z": {
+      "__class__": "LogTocElement",
+      "ident": 409,
+      "group": "posCtrlIndi",
+      "name": "accErr_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "phi_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 410,
+      "group": "posCtrlIndi",
+      "name": "phi_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "theta_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 411,
+      "group": "posCtrlIndi",
+      "name": "theta_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 412,
+      "group": "posCtrlIndi",
+      "name": "T_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner": {
+      "__class__": "LogTocElement",
+      "ident": 413,
+      "group": "posCtrlIndi",
+      "name": "T_inner",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner_f": {
+      "__class__": "LogTocElement",
+      "ident": 414,
+      "group": "posCtrlIndi",
+      "name": "T_inner_f",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_incremented": {
+      "__class__": "LogTocElement",
+      "ident": 415,
+      "group": "posCtrlIndi",
+      "name": "T_incremented",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_phi": {
+      "__class__": "LogTocElement",
+      "ident": 416,
+      "group": "posCtrlIndi",
+      "name": "cmd_phi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_theta": {
+      "__class__": "LogTocElement",
+      "ident": 417,
+      "group": "posCtrlIndi",
+      "name": "cmd_theta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtl": {
+    "targetVX": {
+      "__class__": "LogTocElement",
+      "ident": 418,
+      "group": "posCtl",
+      "name": "targetVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVY": {
+      "__class__": "LogTocElement",
+      "ident": 419,
+      "group": "posCtl",
+      "name": "targetVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVZ": {
+      "__class__": "LogTocElement",
+      "ident": 420,
+      "group": "posCtl",
+      "name": "targetVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetX": {
+      "__class__": "LogTocElement",
+      "ident": 421,
+      "group": "posCtl",
+      "name": "targetX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetY": {
+      "__class__": "LogTocElement",
+      "ident": 422,
+      "group": "posCtl",
+      "name": "targetY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetZ": {
+      "__class__": "LogTocElement",
+      "ident": 423,
+      "group": "posCtl",
+      "name": "targetZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVX": {
+      "__class__": "LogTocElement",
+      "ident": 424,
+      "group": "posCtl",
+      "name": "bodyVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVY": {
+      "__class__": "LogTocElement",
+      "ident": 425,
+      "group": "posCtl",
+      "name": "bodyVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyX": {
+      "__class__": "LogTocElement",
+      "ident": 426,
+      "group": "posCtl",
+      "name": "bodyX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyY": {
+      "__class__": "LogTocElement",
+      "ident": 427,
+      "group": "posCtl",
+      "name": "bodyY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xp": {
+      "__class__": "LogTocElement",
+      "ident": 428,
+      "group": "posCtl",
+      "name": "Xp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xi": {
+      "__class__": "LogTocElement",
+      "ident": 429,
+      "group": "posCtl",
+      "name": "Xi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xd": {
+      "__class__": "LogTocElement",
+      "ident": 430,
+      "group": "posCtl",
+      "name": "Xd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xff": {
+      "__class__": "LogTocElement",
+      "ident": 431,
+      "group": "posCtl",
+      "name": "Xff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yp": {
+      "__class__": "LogTocElement",
+      "ident": 432,
+      "group": "posCtl",
+      "name": "Yp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yi": {
+      "__class__": "LogTocElement",
+      "ident": 433,
+      "group": "posCtl",
+      "name": "Yi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yd": {
+      "__class__": "LogTocElement",
+      "ident": 434,
+      "group": "posCtl",
+      "name": "Yd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yff": {
+      "__class__": "LogTocElement",
+      "ident": 435,
+      "group": "posCtl",
+      "name": "Yff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zp": {
+      "__class__": "LogTocElement",
+      "ident": 436,
+      "group": "posCtl",
+      "name": "Zp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zi": {
+      "__class__": "LogTocElement",
+      "ident": 437,
+      "group": "posCtl",
+      "name": "Zi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zd": {
+      "__class__": "LogTocElement",
+      "ident": 438,
+      "group": "posCtl",
+      "name": "Zd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zff": {
+      "__class__": "LogTocElement",
+      "ident": 439,
+      "group": "posCtl",
+      "name": "Zff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXp": {
+      "__class__": "LogTocElement",
+      "ident": 440,
+      "group": "posCtl",
+      "name": "VXp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXi": {
+      "__class__": "LogTocElement",
+      "ident": 441,
+      "group": "posCtl",
+      "name": "VXi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXd": {
+      "__class__": "LogTocElement",
+      "ident": 442,
+      "group": "posCtl",
+      "name": "VXd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXff": {
+      "__class__": "LogTocElement",
+      "ident": 443,
+      "group": "posCtl",
+      "name": "VXff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYp": {
+      "__class__": "LogTocElement",
+      "ident": 444,
+      "group": "posCtl",
+      "name": "VYp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYi": {
+      "__class__": "LogTocElement",
+      "ident": 445,
+      "group": "posCtl",
+      "name": "VYi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYd": {
+      "__class__": "LogTocElement",
+      "ident": 446,
+      "group": "posCtl",
+      "name": "VYd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYff": {
+      "__class__": "LogTocElement",
+      "ident": 447,
+      "group": "posCtl",
+      "name": "VYff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZp": {
+      "__class__": "LogTocElement",
+      "ident": 448,
+      "group": "posCtl",
+      "name": "VZp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZi": {
+      "__class__": "LogTocElement",
+      "ident": 449,
+      "group": "posCtl",
+      "name": "VZi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZd": {
+      "__class__": "LogTocElement",
+      "ident": 450,
+      "group": "posCtl",
+      "name": "VZd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZff": {
+      "__class__": "LogTocElement",
+      "ident": 451,
+      "group": "posCtl",
+      "name": "VZff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman": {
+    "stateX": {
+      "__class__": "LogTocElement",
+      "ident": 452,
+      "group": "kalman",
+      "name": "stateX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateY": {
+      "__class__": "LogTocElement",
+      "ident": 453,
+      "group": "kalman",
+      "name": "stateY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateZ": {
+      "__class__": "LogTocElement",
+      "ident": 454,
+      "group": "kalman",
+      "name": "stateZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePX": {
+      "__class__": "LogTocElement",
+      "ident": 455,
+      "group": "kalman",
+      "name": "statePX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePY": {
+      "__class__": "LogTocElement",
+      "ident": 456,
+      "group": "kalman",
+      "name": "statePY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePZ": {
+      "__class__": "LogTocElement",
+      "ident": 457,
+      "group": "kalman",
+      "name": "statePZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD0": {
+      "__class__": "LogTocElement",
+      "ident": 458,
+      "group": "kalman",
+      "name": "stateD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD1": {
+      "__class__": "LogTocElement",
+      "ident": 459,
+      "group": "kalman",
+      "name": "stateD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD2": {
+      "__class__": "LogTocElement",
+      "ident": 460,
+      "group": "kalman",
+      "name": "stateD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varX": {
+      "__class__": "LogTocElement",
+      "ident": 461,
+      "group": "kalman",
+      "name": "varX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varY": {
+      "__class__": "LogTocElement",
+      "ident": 462,
+      "group": "kalman",
+      "name": "varY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varZ": {
+      "__class__": "LogTocElement",
+      "ident": 463,
+      "group": "kalman",
+      "name": "varZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPX": {
+      "__class__": "LogTocElement",
+      "ident": 464,
+      "group": "kalman",
+      "name": "varPX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPY": {
+      "__class__": "LogTocElement",
+      "ident": 465,
+      "group": "kalman",
+      "name": "varPY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPZ": {
+      "__class__": "LogTocElement",
+      "ident": 466,
+      "group": "kalman",
+      "name": "varPZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD0": {
+      "__class__": "LogTocElement",
+      "ident": 467,
+      "group": "kalman",
+      "name": "varD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD1": {
+      "__class__": "LogTocElement",
+      "ident": 468,
+      "group": "kalman",
+      "name": "varD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD2": {
+      "__class__": "LogTocElement",
+      "ident": 469,
+      "group": "kalman",
+      "name": "varD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q0": {
+      "__class__": "LogTocElement",
+      "ident": 470,
+      "group": "kalman",
+      "name": "q0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q1": {
+      "__class__": "LogTocElement",
+      "ident": 471,
+      "group": "kalman",
+      "name": "q1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q2": {
+      "__class__": "LogTocElement",
+      "ident": 472,
+      "group": "kalman",
+      "name": "q2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q3": {
+      "__class__": "LogTocElement",
+      "ident": 473,
+      "group": "kalman",
+      "name": "q3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtUpdate": {
+      "__class__": "LogTocElement",
+      "ident": 474,
+      "group": "kalman",
+      "name": "rtUpdate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtPred": {
+      "__class__": "LogTocElement",
+      "ident": 475,
+      "group": "kalman",
+      "name": "rtPred",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtFinal": {
+      "__class__": "LogTocElement",
+      "ident": 476,
+      "group": "kalman",
+      "name": "rtFinal",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "outlierf": {
+    "lhWin": {
+      "__class__": "LogTocElement",
+      "ident": 477,
+      "group": "outlierf",
+      "name": "lhWin",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "estimator": {
+    "rtApnd": {
+      "__class__": "LogTocElement",
+      "ident": 478,
+      "group": "estimator",
+      "name": "rtApnd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtRej": {
+      "__class__": "LogTocElement",
+      "ident": 479,
+      "group": "estimator",
+      "name": "rtRej",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posEstAlt": {
+    "estimatedZ": {
+      "__class__": "LogTocElement",
+      "ident": 480,
+      "group": "posEstAlt",
+      "name": "estimatedZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estVZ": {
+      "__class__": "LogTocElement",
+      "ident": 481,
+      "group": "posEstAlt",
+      "name": "estVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velocityZ": {
+      "__class__": "LogTocElement",
+      "ident": 482,
+      "group": "posEstAlt",
+      "name": "velocityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "DTR_P2P": {
+    "rx_state": {
+      "__class__": "LogTocElement",
+      "ident": 483,
+      "group": "DTR_P2P",
+      "name": "rx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "tx_state": {
+      "__class__": "LogTocElement",
+      "ident": 484,
+      "group": "DTR_P2P",
+      "name": "tx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  }
+}
\ No newline at end of file
diff --git c/src/cache/9FA714B3.json i/src/cache/9FA714B3.json
new file mode 100644
index 0000000..3c86bf4
diff --git c/src/webots_pkg/pre_launch/calibrate_lh_config.py i/src/webots_pkg/pre_launch/calibrate_lh_config.py
deleted file mode 100644
index 636aefc..0000000
--- c/src/webots_pkg/pre_launch/calibrate_lh_config.py
+++ /dev/null
@@ -1,11 +0,0 @@
-import os
-import sys
-import tf_transformations
-import rclpy
-sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
-from webots_pkg.lighthouse_node import LighthousePose
-
-
-# TODO: waiting_on_tests: Write lh configuration to crazyflie
-
-
diff --git c/src/webots_pkg/pre_launch/write_lh_config.py i/src/webots_pkg/pre_launch/write_lh_config.py
new file mode 100644
index 0000000..f19e853
--- /dev/null
+++ i/src/webots_pkg/pre_launch/write_lh_config.py
@@ -0,0 +1,94 @@
+#                     ____  _            __          __                                            
+#    ____ ___  __  __/ / /_(_)________  / /_  ____  / /_   ______      ______ __________ ___  _____
+#   / __ `__ \/ / / / / __/ / ___/ __ \/ __ \/ __ \/ __/  / ___/ | /| / / __ `/ ___/ __ `__ \/ ___/
+#  / / / / / / /_/ / / /_/ / /  / /_/ / /_/ / /_/ / /_   (__  )| |/ |/ / /_/ / /  / / / / / (__  ) 
+# /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
+
+"""
+This file is used to write the lighthouse rotation matrices and starting position origins to the Crazyflie embedded memory 
+Usage: python3 write_lh_config.py
+
+Author: Will Graham
+"""
+
+
+
+import os
+import sys
+import argparse
+import pytest
+
+sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
+from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
+from cflib.crazyflie import Crazyflie
+
+import cflib.crtp
+from cflib.crazyflie.mem import LighthouseBsGeometry
+from cflib.utils import uri_helper
+import tf_transformations
+import rclpy
+sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
+from webots_pkg.lighthouse_node import LighthousePose
+
+# ...
+
+Z_OFFSET = 1.0  # Define the z offset value here
+
+# ...
+
+
+
+
+def parse_arguments():
+    parser = argparse.ArgumentParser(description='Process integer pairs and save them into lists.')
+    
+    parser.add_argument('-uri', type=str, help='URI of the Crazyflie to connect to', required=True)
+    parser.add_argument('-0', '--bs0', nargs=2, type=int, required=True, help='First pair of integers')
+    parser.add_argument('-1', '--bs1', nargs=2, type=int, required=True, help='Second pair of integers')
+    parser.add_argument('-2', '--bs2', nargs=2, type=int, required=False, help='Third pair of integers', default=None)
+    parser.add_argument('-3', '--bs3', nargs=2, type=int, required=False, help='Fourth pair of integers', default=None)
+
+    args = parser.parse_args()
+
+    # Convert ints to floats
+    args.bs0 = [float(x) for x in args.bs0]
+    args.bs1 = [float(x) for x in args.bs1]
+    if args.bs2 is not None:
+        args.bs2 = [float(x) for x in args.bs2]
+    if args.bs3 is not None:
+        args.bs3 = [float(x) for x in args.bs3]
+    
+    # Append z offset to all existing lists in args variable
+    args.bs0.append(Z_OFFSET)
+    args.bs1.append(Z_OFFSET)
+    if args.bs2 is not None:
+        args.bs2.append(Z_OFFSET)
+    if args.bs3 is not None:
+        args.bs3.append(Z_OFFSET)
+
+    return args
+
+def main():
+    args = parse_arguments()
+
+    cflib.crtp.init_drivers(args.uri)
+
+    geo_dict = {}
+    
+    for i, bs in enumerate([args.bs0, args.bs1, args.bs2, args.bs3]):
+        if bs is None:
+            continue
+        bs_geo = LighthouseBsGeometry()
+        bs_geo.origin = bs
+        bs_geo.rotation_matrix = [
+            [0.0, -1.0, 0.0],
+            [1.0, 0.0, 0.0],
+            [0.0, 0.0, 1.0],]
+        bs_geo.valid = True
+        geo_dict = {i: bs_geo}
+        WriteLHGeoMem(args.uri, geo_dict)
+    
+
+
+if __name__ == '__main__':
+    main()
\ No newline at end of file
diff --git c/src/webots_pkg/test/hardware/cache/39041F30.json i/src/webots_pkg/test/hardware/cache/39041F30.json
new file mode 100644
index 0000000..ea9e30f
--- /dev/null
+++ i/src/webots_pkg/test/hardware/cache/39041F30.json
@@ -0,0 +1,4463 @@
+{
+  "activeMarker": {
+    "btSns": {
+      "__class__": "LogTocElement",
+      "ident": 0,
+      "group": "activeMarker",
+      "name": "btSns",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "i2cOk": {
+      "__class__": "LogTocElement",
+      "ident": 1,
+      "group": "activeMarker",
+      "name": "i2cOk",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "motion": {
+    "motion": {
+      "__class__": "LogTocElement",
+      "ident": 2,
+      "group": "motion",
+      "name": "motion",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "deltaX": {
+      "__class__": "LogTocElement",
+      "ident": 3,
+      "group": "motion",
+      "name": "deltaX",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "deltaY": {
+      "__class__": "LogTocElement",
+      "ident": 4,
+      "group": "motion",
+      "name": "deltaY",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "shutter": {
+      "__class__": "LogTocElement",
+      "ident": 5,
+      "group": "motion",
+      "name": "shutter",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "maxRaw": {
+      "__class__": "LogTocElement",
+      "ident": 6,
+      "group": "motion",
+      "name": "maxRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "minRaw": {
+      "__class__": "LogTocElement",
+      "ident": 7,
+      "group": "motion",
+      "name": "minRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Rawsum": {
+      "__class__": "LogTocElement",
+      "ident": 8,
+      "group": "motion",
+      "name": "Rawsum",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "outlierCount": {
+      "__class__": "LogTocElement",
+      "ident": 9,
+      "group": "motion",
+      "name": "outlierCount",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "squal": {
+      "__class__": "LogTocElement",
+      "ident": 10,
+      "group": "motion",
+      "name": "squal",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "std": {
+      "__class__": "LogTocElement",
+      "ident": 11,
+      "group": "motion",
+      "name": "std",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ring": {
+    "fadeTime": {
+      "__class__": "LogTocElement",
+      "ident": 12,
+      "group": "ring",
+      "name": "fadeTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "loco": {
+    "mode": {
+      "__class__": "LogTocElement",
+      "ident": 13,
+      "group": "loco",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "spiWr": {
+      "__class__": "LogTocElement",
+      "ident": 14,
+      "group": "loco",
+      "name": "spiWr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiRe": {
+      "__class__": "LogTocElement",
+      "ident": 15,
+      "group": "loco",
+      "name": "spiRe",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ranging": {
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 16,
+      "group": "ranging",
+      "name": "state",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "distance0": {
+      "__class__": "LogTocElement",
+      "ident": 17,
+      "group": "ranging",
+      "name": "distance0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance1": {
+      "__class__": "LogTocElement",
+      "ident": 18,
+      "group": "ranging",
+      "name": "distance1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance2": {
+      "__class__": "LogTocElement",
+      "ident": 19,
+      "group": "ranging",
+      "name": "distance2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance3": {
+      "__class__": "LogTocElement",
+      "ident": 20,
+      "group": "ranging",
+      "name": "distance3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance4": {
+      "__class__": "LogTocElement",
+      "ident": 21,
+      "group": "ranging",
+      "name": "distance4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance5": {
+      "__class__": "LogTocElement",
+      "ident": 22,
+      "group": "ranging",
+      "name": "distance5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance6": {
+      "__class__": "LogTocElement",
+      "ident": 23,
+      "group": "ranging",
+      "name": "distance6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance7": {
+      "__class__": "LogTocElement",
+      "ident": 24,
+      "group": "ranging",
+      "name": "distance7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure0": {
+      "__class__": "LogTocElement",
+      "ident": 25,
+      "group": "ranging",
+      "name": "pressure0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure1": {
+      "__class__": "LogTocElement",
+      "ident": 26,
+      "group": "ranging",
+      "name": "pressure1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure2": {
+      "__class__": "LogTocElement",
+      "ident": 27,
+      "group": "ranging",
+      "name": "pressure2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure3": {
+      "__class__": "LogTocElement",
+      "ident": 28,
+      "group": "ranging",
+      "name": "pressure3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure4": {
+      "__class__": "LogTocElement",
+      "ident": 29,
+      "group": "ranging",
+      "name": "pressure4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure5": {
+      "__class__": "LogTocElement",
+      "ident": 30,
+      "group": "ranging",
+      "name": "pressure5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure6": {
+      "__class__": "LogTocElement",
+      "ident": 31,
+      "group": "ranging",
+      "name": "pressure6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure7": {
+      "__class__": "LogTocElement",
+      "ident": 32,
+      "group": "ranging",
+      "name": "pressure7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "tdoa2": {
+    "d7-0": {
+      "__class__": "LogTocElement",
+      "ident": 33,
+      "group": "tdoa2",
+      "name": "d7-0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d0-1": {
+      "__class__": "LogTocElement",
+      "ident": 34,
+      "group": "tdoa2",
+      "name": "d0-1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d1-2": {
+      "__class__": "LogTocElement",
+      "ident": 35,
+      "group": "tdoa2",
+      "name": "d1-2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d2-3": {
+      "__class__": "LogTocElement",
+      "ident": 36,
+      "group": "tdoa2",
+      "name": "d2-3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d3-4": {
+      "__class__": "LogTocElement",
+      "ident": 37,
+      "group": "tdoa2",
+      "name": "d3-4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d4-5": {
+      "__class__": "LogTocElement",
+      "ident": 38,
+      "group": "tdoa2",
+      "name": "d4-5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d5-6": {
+      "__class__": "LogTocElement",
+      "ident": 39,
+      "group": "tdoa2",
+      "name": "d5-6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d6-7": {
+      "__class__": "LogTocElement",
+      "ident": 40,
+      "group": "tdoa2",
+      "name": "d6-7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc0": {
+      "__class__": "LogTocElement",
+      "ident": 41,
+      "group": "tdoa2",
+      "name": "cc0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc1": {
+      "__class__": "LogTocElement",
+      "ident": 42,
+      "group": "tdoa2",
+      "name": "cc1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc2": {
+      "__class__": "LogTocElement",
+      "ident": 43,
+      "group": "tdoa2",
+      "name": "cc2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc3": {
+      "__class__": "LogTocElement",
+      "ident": 44,
+      "group": "tdoa2",
+      "name": "cc3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc4": {
+      "__class__": "LogTocElement",
+      "ident": 45,
+      "group": "tdoa2",
+      "name": "cc4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc5": {
+      "__class__": "LogTocElement",
+      "ident": 46,
+      "group": "tdoa2",
+      "name": "cc5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc6": {
+      "__class__": "LogTocElement",
+      "ident": 47,
+      "group": "tdoa2",
+      "name": "cc6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc7": {
+      "__class__": "LogTocElement",
+      "ident": 48,
+      "group": "tdoa2",
+      "name": "cc7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "dist7-0": {
+      "__class__": "LogTocElement",
+      "ident": 49,
+      "group": "tdoa2",
+      "name": "dist7-0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist0-1": {
+      "__class__": "LogTocElement",
+      "ident": 50,
+      "group": "tdoa2",
+      "name": "dist0-1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist1-2": {
+      "__class__": "LogTocElement",
+      "ident": 51,
+      "group": "tdoa2",
+      "name": "dist1-2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist2-3": {
+      "__class__": "LogTocElement",
+      "ident": 52,
+      "group": "tdoa2",
+      "name": "dist2-3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist3-4": {
+      "__class__": "LogTocElement",
+      "ident": 53,
+      "group": "tdoa2",
+      "name": "dist3-4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist4-5": {
+      "__class__": "LogTocElement",
+      "ident": 54,
+      "group": "tdoa2",
+      "name": "dist4-5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist5-6": {
+      "__class__": "LogTocElement",
+      "ident": 55,
+      "group": "tdoa2",
+      "name": "dist5-6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist6-7": {
+      "__class__": "LogTocElement",
+      "ident": 56,
+      "group": "tdoa2",
+      "name": "dist6-7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "twr": {
+    "rangingSuccessRate0": {
+      "__class__": "LogTocElement",
+      "ident": 57,
+      "group": "twr",
+      "name": "rangingSuccessRate0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec0": {
+      "__class__": "LogTocElement",
+      "ident": 58,
+      "group": "twr",
+      "name": "rangingPerSec0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate1": {
+      "__class__": "LogTocElement",
+      "ident": 59,
+      "group": "twr",
+      "name": "rangingSuccessRate1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec1": {
+      "__class__": "LogTocElement",
+      "ident": 60,
+      "group": "twr",
+      "name": "rangingPerSec1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate2": {
+      "__class__": "LogTocElement",
+      "ident": 61,
+      "group": "twr",
+      "name": "rangingSuccessRate2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec2": {
+      "__class__": "LogTocElement",
+      "ident": 62,
+      "group": "twr",
+      "name": "rangingPerSec2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate3": {
+      "__class__": "LogTocElement",
+      "ident": 63,
+      "group": "twr",
+      "name": "rangingSuccessRate3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec3": {
+      "__class__": "LogTocElement",
+      "ident": 64,
+      "group": "twr",
+      "name": "rangingPerSec3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate4": {
+      "__class__": "LogTocElement",
+      "ident": 65,
+      "group": "twr",
+      "name": "rangingSuccessRate4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec4": {
+      "__class__": "LogTocElement",
+      "ident": 66,
+      "group": "twr",
+      "name": "rangingPerSec4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate5": {
+      "__class__": "LogTocElement",
+      "ident": 67,
+      "group": "twr",
+      "name": "rangingSuccessRate5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec5": {
+      "__class__": "LogTocElement",
+      "ident": 68,
+      "group": "twr",
+      "name": "rangingPerSec5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "oa": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 69,
+      "group": "oa",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 70,
+      "group": "oa",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 71,
+      "group": "oa",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 72,
+      "group": "oa",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 73,
+      "group": "oa",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "usd": {
+    "spiWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 74,
+      "group": "usd",
+      "name": "spiWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiReBps": {
+      "__class__": "LogTocElement",
+      "ident": 75,
+      "group": "usd",
+      "name": "spiReBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "fatWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 76,
+      "group": "usd",
+      "name": "fatWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "motor": {
+    "m1": {
+      "__class__": "LogTocElement",
+      "ident": 77,
+      "group": "motor",
+      "name": "m1",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m2": {
+      "__class__": "LogTocElement",
+      "ident": 78,
+      "group": "motor",
+      "name": "m2",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m3": {
+      "__class__": "LogTocElement",
+      "ident": 79,
+      "group": "motor",
+      "name": "m3",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m4": {
+      "__class__": "LogTocElement",
+      "ident": 80,
+      "group": "motor",
+      "name": "m4",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m1req": {
+      "__class__": "LogTocElement",
+      "ident": 81,
+      "group": "motor",
+      "name": "m1req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m2req": {
+      "__class__": "LogTocElement",
+      "ident": 82,
+      "group": "motor",
+      "name": "m2req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m3req": {
+      "__class__": "LogTocElement",
+      "ident": 83,
+      "group": "motor",
+      "name": "m3req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m4req": {
+      "__class__": "LogTocElement",
+      "ident": 84,
+      "group": "motor",
+      "name": "m4req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "pm": {
+    "vbat": {
+      "__class__": "LogTocElement",
+      "ident": 85,
+      "group": "pm",
+      "name": "vbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 86,
+      "group": "pm",
+      "name": "vbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extVbat": {
+      "__class__": "LogTocElement",
+      "ident": 87,
+      "group": "pm",
+      "name": "extVbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "extVbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 88,
+      "group": "pm",
+      "name": "extVbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extCurr": {
+      "__class__": "LogTocElement",
+      "ident": 89,
+      "group": "pm",
+      "name": "extCurr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "chargeCurrent": {
+      "__class__": "LogTocElement",
+      "ident": 90,
+      "group": "pm",
+      "name": "chargeCurrent",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 91,
+      "group": "pm",
+      "name": "state",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "batteryLevel": {
+      "__class__": "LogTocElement",
+      "ident": 92,
+      "group": "pm",
+      "name": "batteryLevel",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "radio": {
+    "rssi": {
+      "__class__": "LogTocElement",
+      "ident": 93,
+      "group": "radio",
+      "name": "rssi",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isConnected": {
+      "__class__": "LogTocElement",
+      "ident": 94,
+      "group": "radio",
+      "name": "isConnected",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "gyro": {
+    "xRaw": {
+      "__class__": "LogTocElement",
+      "ident": 95,
+      "group": "gyro",
+      "name": "xRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "yRaw": {
+      "__class__": "LogTocElement",
+      "ident": 96,
+      "group": "gyro",
+      "name": "yRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "zRaw": {
+      "__class__": "LogTocElement",
+      "ident": 97,
+      "group": "gyro",
+      "name": "zRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "xVariance": {
+      "__class__": "LogTocElement",
+      "ident": 98,
+      "group": "gyro",
+      "name": "xVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yVariance": {
+      "__class__": "LogTocElement",
+      "ident": 99,
+      "group": "gyro",
+      "name": "yVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVariance": {
+      "__class__": "LogTocElement",
+      "ident": 100,
+      "group": "gyro",
+      "name": "zVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 101,
+      "group": "gyro",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 102,
+      "group": "gyro",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 103,
+      "group": "gyro",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "colAv": {
+    "latency": {
+      "__class__": "LogTocElement",
+      "ident": 104,
+      "group": "colAv",
+      "name": "latency",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "ext_pos": {
+    "X": {
+      "__class__": "LogTocElement",
+      "ident": 105,
+      "group": "ext_pos",
+      "name": "X",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Y": {
+      "__class__": "LogTocElement",
+      "ident": 106,
+      "group": "ext_pos",
+      "name": "Y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Z": {
+      "__class__": "LogTocElement",
+      "ident": 107,
+      "group": "ext_pos",
+      "name": "Z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrv": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 108,
+      "group": "locSrv",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 109,
+      "group": "locSrv",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 110,
+      "group": "locSrv",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 111,
+      "group": "locSrv",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 112,
+      "group": "locSrv",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 113,
+      "group": "locSrv",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 114,
+      "group": "locSrv",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrvZ": {
+    "tick": {
+      "__class__": "LogTocElement",
+      "ident": 115,
+      "group": "locSrvZ",
+      "name": "tick",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "crtp": {
+    "rxRate": {
+      "__class__": "LogTocElement",
+      "ident": 116,
+      "group": "crtp",
+      "name": "rxRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "txRate": {
+      "__class__": "LogTocElement",
+      "ident": 117,
+      "group": "crtp",
+      "name": "txRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "extrx": {
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 118,
+      "group": "extrx",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 119,
+      "group": "extrx",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 120,
+      "group": "extrx",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 121,
+      "group": "extrx",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 122,
+      "group": "extrx",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 123,
+      "group": "extrx",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVel": {
+      "__class__": "LogTocElement",
+      "ident": 124,
+      "group": "extrx",
+      "name": "zVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "AltHold": {
+      "__class__": "LogTocElement",
+      "ident": 125,
+      "group": "extrx",
+      "name": "AltHold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Arm": {
+      "__class__": "LogTocElement",
+      "ident": 126,
+      "group": "extrx",
+      "name": "Arm",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "extrx_raw": {
+    "ch0": {
+      "__class__": "LogTocElement",
+      "ident": 127,
+      "group": "extrx_raw",
+      "name": "ch0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch1": {
+      "__class__": "LogTocElement",
+      "ident": 128,
+      "group": "extrx_raw",
+      "name": "ch1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch2": {
+      "__class__": "LogTocElement",
+      "ident": 129,
+      "group": "extrx_raw",
+      "name": "ch2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch3": {
+      "__class__": "LogTocElement",
+      "ident": 130,
+      "group": "extrx_raw",
+      "name": "ch3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch4": {
+      "__class__": "LogTocElement",
+      "ident": 131,
+      "group": "extrx_raw",
+      "name": "ch4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch5": {
+      "__class__": "LogTocElement",
+      "ident": 132,
+      "group": "extrx_raw",
+      "name": "ch5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch6": {
+      "__class__": "LogTocElement",
+      "ident": 133,
+      "group": "extrx_raw",
+      "name": "ch6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch7": {
+      "__class__": "LogTocElement",
+      "ident": 134,
+      "group": "extrx_raw",
+      "name": "ch7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "health": {
+    "motorVarXM1": {
+      "__class__": "LogTocElement",
+      "ident": 135,
+      "group": "health",
+      "name": "motorVarXM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM1": {
+      "__class__": "LogTocElement",
+      "ident": 136,
+      "group": "health",
+      "name": "motorVarYM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM2": {
+      "__class__": "LogTocElement",
+      "ident": 137,
+      "group": "health",
+      "name": "motorVarXM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM2": {
+      "__class__": "LogTocElement",
+      "ident": 138,
+      "group": "health",
+      "name": "motorVarYM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM3": {
+      "__class__": "LogTocElement",
+      "ident": 139,
+      "group": "health",
+      "name": "motorVarXM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM3": {
+      "__class__": "LogTocElement",
+      "ident": 140,
+      "group": "health",
+      "name": "motorVarYM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM4": {
+      "__class__": "LogTocElement",
+      "ident": 141,
+      "group": "health",
+      "name": "motorVarXM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM4": {
+      "__class__": "LogTocElement",
+      "ident": 142,
+      "group": "health",
+      "name": "motorVarYM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorPass": {
+      "__class__": "LogTocElement",
+      "ident": 143,
+      "group": "health",
+      "name": "motorPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "batterySag": {
+      "__class__": "LogTocElement",
+      "ident": 144,
+      "group": "health",
+      "name": "batterySag",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "batteryPass": {
+      "__class__": "LogTocElement",
+      "ident": 145,
+      "group": "health",
+      "name": "batteryPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "motorTestCount": {
+      "__class__": "LogTocElement",
+      "ident": 146,
+      "group": "health",
+      "name": "motorTestCount",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "memTst": {
+    "errCntW": {
+      "__class__": "LogTocElement",
+      "ident": 147,
+      "group": "memTst",
+      "name": "errCntW",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "range": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 148,
+      "group": "range",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 149,
+      "group": "range",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 150,
+      "group": "range",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 151,
+      "group": "range",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 152,
+      "group": "range",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "zrange": {
+      "__class__": "LogTocElement",
+      "ident": 153,
+      "group": "range",
+      "name": "zrange",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "sensfusion6": {
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 154,
+      "group": "sensfusion6",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 155,
+      "group": "sensfusion6",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 156,
+      "group": "sensfusion6",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 157,
+      "group": "sensfusion6",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityX": {
+      "__class__": "LogTocElement",
+      "ident": 158,
+      "group": "sensfusion6",
+      "name": "gravityX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityY": {
+      "__class__": "LogTocElement",
+      "ident": 159,
+      "group": "sensfusion6",
+      "name": "gravityY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityZ": {
+      "__class__": "LogTocElement",
+      "ident": 160,
+      "group": "sensfusion6",
+      "name": "gravityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accZbase": {
+      "__class__": "LogTocElement",
+      "ident": 161,
+      "group": "sensfusion6",
+      "name": "accZbase",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "isInit": {
+      "__class__": "LogTocElement",
+      "ident": 162,
+      "group": "sensfusion6",
+      "name": "isInit",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isCalibrated": {
+      "__class__": "LogTocElement",
+      "ident": 163,
+      "group": "sensfusion6",
+      "name": "isCalibrated",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "acc": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 164,
+      "group": "acc",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 165,
+      "group": "acc",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 166,
+      "group": "acc",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "baro": {
+    "asl": {
+      "__class__": "LogTocElement",
+      "ident": 167,
+      "group": "baro",
+      "name": "asl",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "temp": {
+      "__class__": "LogTocElement",
+      "ident": 168,
+      "group": "baro",
+      "name": "temp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure": {
+      "__class__": "LogTocElement",
+      "ident": 169,
+      "group": "baro",
+      "name": "pressure",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "controller": {
+    "ctr_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 170,
+      "group": "controller",
+      "name": "ctr_yaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 171,
+      "group": "controller",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 172,
+      "group": "controller",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 173,
+      "group": "controller",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 174,
+      "group": "controller",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 175,
+      "group": "controller",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 176,
+      "group": "controller",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 177,
+      "group": "controller",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 178,
+      "group": "controller",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "actuatorThrust": {
+      "__class__": "LogTocElement",
+      "ident": 179,
+      "group": "controller",
+      "name": "actuatorThrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 180,
+      "group": "controller",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 181,
+      "group": "controller",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 182,
+      "group": "controller",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 183,
+      "group": "controller",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 184,
+      "group": "controller",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 185,
+      "group": "controller",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltarget": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 186,
+      "group": "ctrltarget",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 187,
+      "group": "ctrltarget",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 188,
+      "group": "ctrltarget",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 189,
+      "group": "ctrltarget",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 190,
+      "group": "ctrltarget",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 191,
+      "group": "ctrltarget",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 192,
+      "group": "ctrltarget",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 193,
+      "group": "ctrltarget",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 194,
+      "group": "ctrltarget",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 195,
+      "group": "ctrltarget",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 196,
+      "group": "ctrltarget",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 197,
+      "group": "ctrltarget",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltargetZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 198,
+      "group": "ctrltargetZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 199,
+      "group": "ctrltargetZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 200,
+      "group": "ctrltargetZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 201,
+      "group": "ctrltargetZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 202,
+      "group": "ctrltargetZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 203,
+      "group": "ctrltargetZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 204,
+      "group": "ctrltargetZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 205,
+      "group": "ctrltargetZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 206,
+      "group": "ctrltargetZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "mag": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 207,
+      "group": "mag",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 208,
+      "group": "mag",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 209,
+      "group": "mag",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stabilizer": {
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 210,
+      "group": "stabilizer",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 211,
+      "group": "stabilizer",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 212,
+      "group": "stabilizer",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 213,
+      "group": "stabilizer",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtStab": {
+      "__class__": "LogTocElement",
+      "ident": 214,
+      "group": "stabilizer",
+      "name": "rtStab",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "intToOut": {
+      "__class__": "LogTocElement",
+      "ident": 215,
+      "group": "stabilizer",
+      "name": "intToOut",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "stateEstimate": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 216,
+      "group": "stateEstimate",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 217,
+      "group": "stateEstimate",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 218,
+      "group": "stateEstimate",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 219,
+      "group": "stateEstimate",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 220,
+      "group": "stateEstimate",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 221,
+      "group": "stateEstimate",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 222,
+      "group": "stateEstimate",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 223,
+      "group": "stateEstimate",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 224,
+      "group": "stateEstimate",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 225,
+      "group": "stateEstimate",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 226,
+      "group": "stateEstimate",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 227,
+      "group": "stateEstimate",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 228,
+      "group": "stateEstimate",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 229,
+      "group": "stateEstimate",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 230,
+      "group": "stateEstimate",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 231,
+      "group": "stateEstimate",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stateEstimateZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 232,
+      "group": "stateEstimateZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 233,
+      "group": "stateEstimateZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 234,
+      "group": "stateEstimateZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 235,
+      "group": "stateEstimateZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 236,
+      "group": "stateEstimateZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 237,
+      "group": "stateEstimateZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 238,
+      "group": "stateEstimateZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 239,
+      "group": "stateEstimateZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 240,
+      "group": "stateEstimateZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "quat": {
+      "__class__": "LogTocElement",
+      "ident": 241,
+      "group": "stateEstimateZ",
+      "name": "quat",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "rateRoll": {
+      "__class__": "LogTocElement",
+      "ident": 242,
+      "group": "stateEstimateZ",
+      "name": "rateRoll",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ratePitch": {
+      "__class__": "LogTocElement",
+      "ident": 243,
+      "group": "stateEstimateZ",
+      "name": "ratePitch",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "rateYaw": {
+      "__class__": "LogTocElement",
+      "ident": 244,
+      "group": "stateEstimateZ",
+      "name": "rateYaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "sys": {
+    "canfly": {
+      "__class__": "LogTocElement",
+      "ident": 245,
+      "group": "sys",
+      "name": "canfly",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isFlying": {
+      "__class__": "LogTocElement",
+      "ident": 246,
+      "group": "sys",
+      "name": "isFlying",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isTumbled": {
+      "__class__": "LogTocElement",
+      "ident": 247,
+      "group": "sys",
+      "name": "isTumbled",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "armed": {
+      "__class__": "LogTocElement",
+      "ident": 248,
+      "group": "sys",
+      "name": "armed",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "testLogParam": {
+      "__class__": "LogTocElement",
+      "ident": 249,
+      "group": "sys",
+      "name": "testLogParam",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    }
+  },
+  "tdoaEngine": {
+    "stRx": {
+      "__class__": "LogTocElement",
+      "ident": 250,
+      "group": "tdoaEngine",
+      "name": "stRx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stEst": {
+      "__class__": "LogTocElement",
+      "ident": 251,
+      "group": "tdoaEngine",
+      "name": "stEst",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stTime": {
+      "__class__": "LogTocElement",
+      "ident": 252,
+      "group": "tdoaEngine",
+      "name": "stTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stFound": {
+      "__class__": "LogTocElement",
+      "ident": 253,
+      "group": "tdoaEngine",
+      "name": "stFound",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stCc": {
+      "__class__": "LogTocElement",
+      "ident": 254,
+      "group": "tdoaEngine",
+      "name": "stCc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stHit": {
+      "__class__": "LogTocElement",
+      "ident": 255,
+      "group": "tdoaEngine",
+      "name": "stHit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stMiss": {
+      "__class__": "LogTocElement",
+      "ident": 256,
+      "group": "tdoaEngine",
+      "name": "stMiss",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc": {
+      "__class__": "LogTocElement",
+      "ident": 257,
+      "group": "tdoaEngine",
+      "name": "cc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "tof": {
+      "__class__": "LogTocElement",
+      "ident": 258,
+      "group": "tdoaEngine",
+      "name": "tof",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "tdoa": {
+      "__class__": "LogTocElement",
+      "ident": 259,
+      "group": "tdoaEngine",
+      "name": "tdoa",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman_pred": {
+    "predNX": {
+      "__class__": "LogTocElement",
+      "ident": 260,
+      "group": "kalman_pred",
+      "name": "predNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "predNY": {
+      "__class__": "LogTocElement",
+      "ident": 261,
+      "group": "kalman_pred",
+      "name": "predNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNX": {
+      "__class__": "LogTocElement",
+      "ident": 262,
+      "group": "kalman_pred",
+      "name": "measNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNY": {
+      "__class__": "LogTocElement",
+      "ident": 263,
+      "group": "kalman_pred",
+      "name": "measNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "lighthouse": {
+    "validAngles": {
+      "__class__": "LogTocElement",
+      "ident": 264,
+      "group": "lighthouse",
+      "name": "validAngles",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rawAngle0x": {
+      "__class__": "LogTocElement",
+      "ident": 265,
+      "group": "lighthouse",
+      "name": "rawAngle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0y": {
+      "__class__": "LogTocElement",
+      "ident": 266,
+      "group": "lighthouse",
+      "name": "rawAngle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1x": {
+      "__class__": "LogTocElement",
+      "ident": 267,
+      "group": "lighthouse",
+      "name": "rawAngle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1y": {
+      "__class__": "LogTocElement",
+      "ident": 268,
+      "group": "lighthouse",
+      "name": "rawAngle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x": {
+      "__class__": "LogTocElement",
+      "ident": 269,
+      "group": "lighthouse",
+      "name": "angle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y": {
+      "__class__": "LogTocElement",
+      "ident": 270,
+      "group": "lighthouse",
+      "name": "angle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x": {
+      "__class__": "LogTocElement",
+      "ident": 271,
+      "group": "lighthouse",
+      "name": "angle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y": {
+      "__class__": "LogTocElement",
+      "ident": 272,
+      "group": "lighthouse",
+      "name": "angle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_1": {
+      "__class__": "LogTocElement",
+      "ident": 273,
+      "group": "lighthouse",
+      "name": "angle0x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_1": {
+      "__class__": "LogTocElement",
+      "ident": 274,
+      "group": "lighthouse",
+      "name": "angle0y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_1": {
+      "__class__": "LogTocElement",
+      "ident": 275,
+      "group": "lighthouse",
+      "name": "angle1x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_1": {
+      "__class__": "LogTocElement",
+      "ident": 276,
+      "group": "lighthouse",
+      "name": "angle1y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_2": {
+      "__class__": "LogTocElement",
+      "ident": 277,
+      "group": "lighthouse",
+      "name": "angle0x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_2": {
+      "__class__": "LogTocElement",
+      "ident": 278,
+      "group": "lighthouse",
+      "name": "angle0y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_2": {
+      "__class__": "LogTocElement",
+      "ident": 279,
+      "group": "lighthouse",
+      "name": "angle1x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_2": {
+      "__class__": "LogTocElement",
+      "ident": 280,
+      "group": "lighthouse",
+      "name": "angle1y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_3": {
+      "__class__": "LogTocElement",
+      "ident": 281,
+      "group": "lighthouse",
+      "name": "angle0x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_3": {
+      "__class__": "LogTocElement",
+      "ident": 282,
+      "group": "lighthouse",
+      "name": "angle0y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_3": {
+      "__class__": "LogTocElement",
+      "ident": 283,
+      "group": "lighthouse",
+      "name": "angle1x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_3": {
+      "__class__": "LogTocElement",
+      "ident": 284,
+      "group": "lighthouse",
+      "name": "angle1y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 285,
+      "group": "lighthouse",
+      "name": "rawAngle0xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 286,
+      "group": "lighthouse",
+      "name": "rawAngle0ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 287,
+      "group": "lighthouse",
+      "name": "rawAngle1xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 288,
+      "group": "lighthouse",
+      "name": "rawAngle1ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 289,
+      "group": "lighthouse",
+      "name": "angle0x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 290,
+      "group": "lighthouse",
+      "name": "angle0y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 291,
+      "group": "lighthouse",
+      "name": "angle1x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 292,
+      "group": "lighthouse",
+      "name": "angle1y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "width0": {
+      "__class__": "LogTocElement",
+      "ident": 293,
+      "group": "lighthouse",
+      "name": "width0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width1": {
+      "__class__": "LogTocElement",
+      "ident": 294,
+      "group": "lighthouse",
+      "name": "width1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width2": {
+      "__class__": "LogTocElement",
+      "ident": 295,
+      "group": "lighthouse",
+      "name": "width2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width3": {
+      "__class__": "LogTocElement",
+      "ident": 296,
+      "group": "lighthouse",
+      "name": "width3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "comSync": {
+      "__class__": "LogTocElement",
+      "ident": 297,
+      "group": "lighthouse",
+      "name": "comSync",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "bsAvailable": {
+      "__class__": "LogTocElement",
+      "ident": 298,
+      "group": "lighthouse",
+      "name": "bsAvailable",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsReceive": {
+      "__class__": "LogTocElement",
+      "ident": 299,
+      "group": "lighthouse",
+      "name": "bsReceive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsActive": {
+      "__class__": "LogTocElement",
+      "ident": 300,
+      "group": "lighthouse",
+      "name": "bsActive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalUd": {
+      "__class__": "LogTocElement",
+      "ident": 301,
+      "group": "lighthouse",
+      "name": "bsCalUd",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalCon": {
+      "__class__": "LogTocElement",
+      "ident": 302,
+      "group": "lighthouse",
+      "name": "bsCalCon",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "status": {
+      "__class__": "LogTocElement",
+      "ident": 303,
+      "group": "lighthouse",
+      "name": "status",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "posRt": {
+      "__class__": "LogTocElement",
+      "ident": 304,
+      "group": "lighthouse",
+      "name": "posRt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs0Rt": {
+      "__class__": "LogTocElement",
+      "ident": 305,
+      "group": "lighthouse",
+      "name": "estBs0Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs1Rt": {
+      "__class__": "LogTocElement",
+      "ident": 306,
+      "group": "lighthouse",
+      "name": "estBs1Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 307,
+      "group": "lighthouse",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 308,
+      "group": "lighthouse",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 309,
+      "group": "lighthouse",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "delta": {
+      "__class__": "LogTocElement",
+      "ident": 310,
+      "group": "lighthouse",
+      "name": "delta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bsGeoVal": {
+      "__class__": "LogTocElement",
+      "ident": 311,
+      "group": "lighthouse",
+      "name": "bsGeoVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalVal": {
+      "__class__": "LogTocElement",
+      "ident": 312,
+      "group": "lighthouse",
+      "name": "bsCalVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "disProb": {
+      "__class__": "LogTocElement",
+      "ident": 313,
+      "group": "lighthouse",
+      "name": "disProb",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_attitude": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 314,
+      "group": "pid_attitude",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 315,
+      "group": "pid_attitude",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 316,
+      "group": "pid_attitude",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 317,
+      "group": "pid_attitude",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 318,
+      "group": "pid_attitude",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 319,
+      "group": "pid_attitude",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 320,
+      "group": "pid_attitude",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 321,
+      "group": "pid_attitude",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 322,
+      "group": "pid_attitude",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 323,
+      "group": "pid_attitude",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 324,
+      "group": "pid_attitude",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 325,
+      "group": "pid_attitude",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_rate": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 326,
+      "group": "pid_rate",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 327,
+      "group": "pid_rate",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 328,
+      "group": "pid_rate",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 329,
+      "group": "pid_rate",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 330,
+      "group": "pid_rate",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 331,
+      "group": "pid_rate",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 332,
+      "group": "pid_rate",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 333,
+      "group": "pid_rate",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 334,
+      "group": "pid_rate",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 335,
+      "group": "pid_rate",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 336,
+      "group": "pid_rate",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 337,
+      "group": "pid_rate",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlINDI": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 338,
+      "group": "ctrlINDI",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 339,
+      "group": "ctrlINDI",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 340,
+      "group": "ctrlINDI",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 341,
+      "group": "ctrlINDI",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 342,
+      "group": "ctrlINDI",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 343,
+      "group": "ctrlINDI",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 344,
+      "group": "ctrlINDI",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_p": {
+      "__class__": "LogTocElement",
+      "ident": 345,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_q": {
+      "__class__": "LogTocElement",
+      "ident": 346,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_r": {
+      "__class__": "LogTocElement",
+      "ident": 347,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_p": {
+      "__class__": "LogTocElement",
+      "ident": 348,
+      "group": "ctrlINDI",
+      "name": "du_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_q": {
+      "__class__": "LogTocElement",
+      "ident": 349,
+      "group": "ctrlINDI",
+      "name": "du_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_r": {
+      "__class__": "LogTocElement",
+      "ident": 350,
+      "group": "ctrlINDI",
+      "name": "du_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_p": {
+      "__class__": "LogTocElement",
+      "ident": 351,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_q": {
+      "__class__": "LogTocElement",
+      "ident": 352,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_r": {
+      "__class__": "LogTocElement",
+      "ident": 353,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[0]": {
+      "__class__": "LogTocElement",
+      "ident": 354,
+      "group": "ctrlINDI",
+      "name": "rate_d[0]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[1]": {
+      "__class__": "LogTocElement",
+      "ident": 355,
+      "group": "ctrlINDI",
+      "name": "rate_d[1]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[2]": {
+      "__class__": "LogTocElement",
+      "ident": 356,
+      "group": "ctrlINDI",
+      "name": "rate_d[2]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_p": {
+      "__class__": "LogTocElement",
+      "ident": 357,
+      "group": "ctrlINDI",
+      "name": "uf_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_q": {
+      "__class__": "LogTocElement",
+      "ident": 358,
+      "group": "ctrlINDI",
+      "name": "uf_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_r": {
+      "__class__": "LogTocElement",
+      "ident": 359,
+      "group": "ctrlINDI",
+      "name": "uf_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_p": {
+      "__class__": "LogTocElement",
+      "ident": 360,
+      "group": "ctrlINDI",
+      "name": "Omega_f_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_q": {
+      "__class__": "LogTocElement",
+      "ident": 361,
+      "group": "ctrlINDI",
+      "name": "Omega_f_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_r": {
+      "__class__": "LogTocElement",
+      "ident": 362,
+      "group": "ctrlINDI",
+      "name": "Omega_f_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_p": {
+      "__class__": "LogTocElement",
+      "ident": 363,
+      "group": "ctrlINDI",
+      "name": "n_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_q": {
+      "__class__": "LogTocElement",
+      "ident": 364,
+      "group": "ctrlINDI",
+      "name": "n_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_r": {
+      "__class__": "LogTocElement",
+      "ident": 365,
+      "group": "ctrlINDI",
+      "name": "n_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlMel": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 366,
+      "group": "ctrlMel",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 367,
+      "group": "ctrlMel",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 368,
+      "group": "ctrlMel",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 369,
+      "group": "ctrlMel",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 370,
+      "group": "ctrlMel",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 371,
+      "group": "ctrlMel",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 372,
+      "group": "ctrlMel",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 373,
+      "group": "ctrlMel",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdx": {
+      "__class__": "LogTocElement",
+      "ident": 374,
+      "group": "ctrlMel",
+      "name": "zdx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdy": {
+      "__class__": "LogTocElement",
+      "ident": 375,
+      "group": "ctrlMel",
+      "name": "zdy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdz": {
+      "__class__": "LogTocElement",
+      "ident": 376,
+      "group": "ctrlMel",
+      "name": "zdz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_x": {
+      "__class__": "LogTocElement",
+      "ident": 377,
+      "group": "ctrlMel",
+      "name": "i_err_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_y": {
+      "__class__": "LogTocElement",
+      "ident": 378,
+      "group": "ctrlMel",
+      "name": "i_err_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_z": {
+      "__class__": "LogTocElement",
+      "ident": 379,
+      "group": "ctrlMel",
+      "name": "i_err_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtrlIndi": {
+    "posRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 380,
+      "group": "posCtrlIndi",
+      "name": "posRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 381,
+      "group": "posCtrlIndi",
+      "name": "posRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 382,
+      "group": "posCtrlIndi",
+      "name": "posRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_x": {
+      "__class__": "LogTocElement",
+      "ident": 383,
+      "group": "posCtrlIndi",
+      "name": "velS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_y": {
+      "__class__": "LogTocElement",
+      "ident": 384,
+      "group": "posCtrlIndi",
+      "name": "velS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_z": {
+      "__class__": "LogTocElement",
+      "ident": 385,
+      "group": "posCtrlIndi",
+      "name": "velS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 386,
+      "group": "posCtrlIndi",
+      "name": "velRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 387,
+      "group": "posCtrlIndi",
+      "name": "velRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 388,
+      "group": "posCtrlIndi",
+      "name": "velRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_roll": {
+      "__class__": "LogTocElement",
+      "ident": 389,
+      "group": "posCtrlIndi",
+      "name": "angS_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 390,
+      "group": "posCtrlIndi",
+      "name": "angS_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 391,
+      "group": "posCtrlIndi",
+      "name": "angS_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_roll": {
+      "__class__": "LogTocElement",
+      "ident": 392,
+      "group": "posCtrlIndi",
+      "name": "angF_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 393,
+      "group": "posCtrlIndi",
+      "name": "angF_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 394,
+      "group": "posCtrlIndi",
+      "name": "angF_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 395,
+      "group": "posCtrlIndi",
+      "name": "accRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 396,
+      "group": "posCtrlIndi",
+      "name": "accRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 397,
+      "group": "posCtrlIndi",
+      "name": "accRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_x": {
+      "__class__": "LogTocElement",
+      "ident": 398,
+      "group": "posCtrlIndi",
+      "name": "accS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_y": {
+      "__class__": "LogTocElement",
+      "ident": 399,
+      "group": "posCtrlIndi",
+      "name": "accS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_z": {
+      "__class__": "LogTocElement",
+      "ident": 400,
+      "group": "posCtrlIndi",
+      "name": "accS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_x": {
+      "__class__": "LogTocElement",
+      "ident": 401,
+      "group": "posCtrlIndi",
+      "name": "accF_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_y": {
+      "__class__": "LogTocElement",
+      "ident": 402,
+      "group": "posCtrlIndi",
+      "name": "accF_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_z": {
+      "__class__": "LogTocElement",
+      "ident": 403,
+      "group": "posCtrlIndi",
+      "name": "accF_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_x": {
+      "__class__": "LogTocElement",
+      "ident": 404,
+      "group": "posCtrlIndi",
+      "name": "accFT_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_y": {
+      "__class__": "LogTocElement",
+      "ident": 405,
+      "group": "posCtrlIndi",
+      "name": "accFT_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_z": {
+      "__class__": "LogTocElement",
+      "ident": 406,
+      "group": "posCtrlIndi",
+      "name": "accFT_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_x": {
+      "__class__": "LogTocElement",
+      "ident": 407,
+      "group": "posCtrlIndi",
+      "name": "accErr_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_y": {
+      "__class__": "LogTocElement",
+      "ident": 408,
+      "group": "posCtrlIndi",
+      "name": "accErr_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_z": {
+      "__class__": "LogTocElement",
+      "ident": 409,
+      "group": "posCtrlIndi",
+      "name": "accErr_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "phi_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 410,
+      "group": "posCtrlIndi",
+      "name": "phi_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "theta_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 411,
+      "group": "posCtrlIndi",
+      "name": "theta_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 412,
+      "group": "posCtrlIndi",
+      "name": "T_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner": {
+      "__class__": "LogTocElement",
+      "ident": 413,
+      "group": "posCtrlIndi",
+      "name": "T_inner",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner_f": {
+      "__class__": "LogTocElement",
+      "ident": 414,
+      "group": "posCtrlIndi",
+      "name": "T_inner_f",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_incremented": {
+      "__class__": "LogTocElement",
+      "ident": 415,
+      "group": "posCtrlIndi",
+      "name": "T_incremented",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_phi": {
+      "__class__": "LogTocElement",
+      "ident": 416,
+      "group": "posCtrlIndi",
+      "name": "cmd_phi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_theta": {
+      "__class__": "LogTocElement",
+      "ident": 417,
+      "group": "posCtrlIndi",
+      "name": "cmd_theta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtl": {
+    "targetVX": {
+      "__class__": "LogTocElement",
+      "ident": 418,
+      "group": "posCtl",
+      "name": "targetVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVY": {
+      "__class__": "LogTocElement",
+      "ident": 419,
+      "group": "posCtl",
+      "name": "targetVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVZ": {
+      "__class__": "LogTocElement",
+      "ident": 420,
+      "group": "posCtl",
+      "name": "targetVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetX": {
+      "__class__": "LogTocElement",
+      "ident": 421,
+      "group": "posCtl",
+      "name": "targetX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetY": {
+      "__class__": "LogTocElement",
+      "ident": 422,
+      "group": "posCtl",
+      "name": "targetY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetZ": {
+      "__class__": "LogTocElement",
+      "ident": 423,
+      "group": "posCtl",
+      "name": "targetZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVX": {
+      "__class__": "LogTocElement",
+      "ident": 424,
+      "group": "posCtl",
+      "name": "bodyVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVY": {
+      "__class__": "LogTocElement",
+      "ident": 425,
+      "group": "posCtl",
+      "name": "bodyVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyX": {
+      "__class__": "LogTocElement",
+      "ident": 426,
+      "group": "posCtl",
+      "name": "bodyX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyY": {
+      "__class__": "LogTocElement",
+      "ident": 427,
+      "group": "posCtl",
+      "name": "bodyY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xp": {
+      "__class__": "LogTocElement",
+      "ident": 428,
+      "group": "posCtl",
+      "name": "Xp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xi": {
+      "__class__": "LogTocElement",
+      "ident": 429,
+      "group": "posCtl",
+      "name": "Xi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xd": {
+      "__class__": "LogTocElement",
+      "ident": 430,
+      "group": "posCtl",
+      "name": "Xd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xff": {
+      "__class__": "LogTocElement",
+      "ident": 431,
+      "group": "posCtl",
+      "name": "Xff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yp": {
+      "__class__": "LogTocElement",
+      "ident": 432,
+      "group": "posCtl",
+      "name": "Yp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yi": {
+      "__class__": "LogTocElement",
+      "ident": 433,
+      "group": "posCtl",
+      "name": "Yi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yd": {
+      "__class__": "LogTocElement",
+      "ident": 434,
+      "group": "posCtl",
+      "name": "Yd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yff": {
+      "__class__": "LogTocElement",
+      "ident": 435,
+      "group": "posCtl",
+      "name": "Yff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zp": {
+      "__class__": "LogTocElement",
+      "ident": 436,
+      "group": "posCtl",
+      "name": "Zp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zi": {
+      "__class__": "LogTocElement",
+      "ident": 437,
+      "group": "posCtl",
+      "name": "Zi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zd": {
+      "__class__": "LogTocElement",
+      "ident": 438,
+      "group": "posCtl",
+      "name": "Zd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zff": {
+      "__class__": "LogTocElement",
+      "ident": 439,
+      "group": "posCtl",
+      "name": "Zff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXp": {
+      "__class__": "LogTocElement",
+      "ident": 440,
+      "group": "posCtl",
+      "name": "VXp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXi": {
+      "__class__": "LogTocElement",
+      "ident": 441,
+      "group": "posCtl",
+      "name": "VXi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXd": {
+      "__class__": "LogTocElement",
+      "ident": 442,
+      "group": "posCtl",
+      "name": "VXd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXff": {
+      "__class__": "LogTocElement",
+      "ident": 443,
+      "group": "posCtl",
+      "name": "VXff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYp": {
+      "__class__": "LogTocElement",
+      "ident": 444,
+      "group": "posCtl",
+      "name": "VYp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYi": {
+      "__class__": "LogTocElement",
+      "ident": 445,
+      "group": "posCtl",
+      "name": "VYi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYd": {
+      "__class__": "LogTocElement",
+      "ident": 446,
+      "group": "posCtl",
+      "name": "VYd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYff": {
+      "__class__": "LogTocElement",
+      "ident": 447,
+      "group": "posCtl",
+      "name": "VYff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZp": {
+      "__class__": "LogTocElement",
+      "ident": 448,
+      "group": "posCtl",
+      "name": "VZp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZi": {
+      "__class__": "LogTocElement",
+      "ident": 449,
+      "group": "posCtl",
+      "name": "VZi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZd": {
+      "__class__": "LogTocElement",
+      "ident": 450,
+      "group": "posCtl",
+      "name": "VZd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZff": {
+      "__class__": "LogTocElement",
+      "ident": 451,
+      "group": "posCtl",
+      "name": "VZff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman": {
+    "stateX": {
+      "__class__": "LogTocElement",
+      "ident": 452,
+      "group": "kalman",
+      "name": "stateX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateY": {
+      "__class__": "LogTocElement",
+      "ident": 453,
+      "group": "kalman",
+      "name": "stateY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateZ": {
+      "__class__": "LogTocElement",
+      "ident": 454,
+      "group": "kalman",
+      "name": "stateZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePX": {
+      "__class__": "LogTocElement",
+      "ident": 455,
+      "group": "kalman",
+      "name": "statePX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePY": {
+      "__class__": "LogTocElement",
+      "ident": 456,
+      "group": "kalman",
+      "name": "statePY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePZ": {
+      "__class__": "LogTocElement",
+      "ident": 457,
+      "group": "kalman",
+      "name": "statePZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD0": {
+      "__class__": "LogTocElement",
+      "ident": 458,
+      "group": "kalman",
+      "name": "stateD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD1": {
+      "__class__": "LogTocElement",
+      "ident": 459,
+      "group": "kalman",
+      "name": "stateD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD2": {
+      "__class__": "LogTocElement",
+      "ident": 460,
+      "group": "kalman",
+      "name": "stateD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varX": {
+      "__class__": "LogTocElement",
+      "ident": 461,
+      "group": "kalman",
+      "name": "varX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varY": {
+      "__class__": "LogTocElement",
+      "ident": 462,
+      "group": "kalman",
+      "name": "varY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varZ": {
+      "__class__": "LogTocElement",
+      "ident": 463,
+      "group": "kalman",
+      "name": "varZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPX": {
+      "__class__": "LogTocElement",
+      "ident": 464,
+      "group": "kalman",
+      "name": "varPX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPY": {
+      "__class__": "LogTocElement",
+      "ident": 465,
+      "group": "kalman",
+      "name": "varPY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPZ": {
+      "__class__": "LogTocElement",
+      "ident": 466,
+      "group": "kalman",
+      "name": "varPZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD0": {
+      "__class__": "LogTocElement",
+      "ident": 467,
+      "group": "kalman",
+      "name": "varD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD1": {
+      "__class__": "LogTocElement",
+      "ident": 468,
+      "group": "kalman",
+      "name": "varD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD2": {
+      "__class__": "LogTocElement",
+      "ident": 469,
+      "group": "kalman",
+      "name": "varD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q0": {
+      "__class__": "LogTocElement",
+      "ident": 470,
+      "group": "kalman",
+      "name": "q0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q1": {
+      "__class__": "LogTocElement",
+      "ident": 471,
+      "group": "kalman",
+      "name": "q1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q2": {
+      "__class__": "LogTocElement",
+      "ident": 472,
+      "group": "kalman",
+      "name": "q2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q3": {
+      "__class__": "LogTocElement",
+      "ident": 473,
+      "group": "kalman",
+      "name": "q3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtUpdate": {
+      "__class__": "LogTocElement",
+      "ident": 474,
+      "group": "kalman",
+      "name": "rtUpdate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtPred": {
+      "__class__": "LogTocElement",
+      "ident": 475,
+      "group": "kalman",
+      "name": "rtPred",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtFinal": {
+      "__class__": "LogTocElement",
+      "ident": 476,
+      "group": "kalman",
+      "name": "rtFinal",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "outlierf": {
+    "lhWin": {
+      "__class__": "LogTocElement",
+      "ident": 477,
+      "group": "outlierf",
+      "name": "lhWin",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "estimator": {
+    "rtApnd": {
+      "__class__": "LogTocElement",
+      "ident": 478,
+      "group": "estimator",
+      "name": "rtApnd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtRej": {
+      "__class__": "LogTocElement",
+      "ident": 479,
+      "group": "estimator",
+      "name": "rtRej",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posEstAlt": {
+    "estimatedZ": {
+      "__class__": "LogTocElement",
+      "ident": 480,
+      "group": "posEstAlt",
+      "name": "estimatedZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estVZ": {
+      "__class__": "LogTocElement",
+      "ident": 481,
+      "group": "posEstAlt",
+      "name": "estVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velocityZ": {
+      "__class__": "LogTocElement",
+      "ident": 482,
+      "group": "posEstAlt",
+      "name": "velocityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "DTR_P2P": {
+    "rx_state": {
+      "__class__": "LogTocElement",
+      "ident": 483,
+      "group": "DTR_P2P",
+      "name": "rx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "tx_state": {
+      "__class__": "LogTocElement",
+      "ident": 484,
+      "group": "DTR_P2P",
+      "name": "tx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  }
+}
\ No newline at end of file
diff --git c/src/webots_pkg/test/hardware/cache/9FA714B3.json i/src/webots_pkg/test/hardware/cache/9FA714B3.json
new file mode 100644
index 0000000..3c86bf4
--- /dev/null
+++ i/src/webots_pkg/test/hardware/cache/9FA714B3.json
@@ -0,0 +1,2862 @@
+{
+  "activeMarker": {
+    "front": {
+      "__class__": "ParamTocElement",
+      "ident": 0,
+      "group": "activeMarker",
+      "name": "front",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "back": {
+      "__class__": "ParamTocElement",
+      "ident": 1,
+      "group": "activeMarker",
+      "name": "back",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "left": {
+      "__class__": "ParamTocElement",
+      "ident": 2,
+      "group": "activeMarker",
+      "name": "left",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "right": {
+      "__class__": "ParamTocElement",
+      "ident": 3,
+      "group": "activeMarker",
+      "name": "right",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "mode": {
+      "__class__": "ParamTocElement",
+      "ident": 4,
+      "group": "activeMarker",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "poll": {
+      "__class__": "ParamTocElement",
+      "ident": 5,
+      "group": "activeMarker",
+      "name": "poll",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "deck": {
+    "bcActiveMarker": {
+      "__class__": "ParamTocElement",
+      "ident": 6,
+      "group": "deck",
+      "name": "bcActiveMarker",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcAI": {
+      "__class__": "ParamTocElement",
+      "ident": 7,
+      "group": "deck",
+      "name": "bcAI",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcBuzzer": {
+      "__class__": "ParamTocElement",
+      "ident": 8,
+      "group": "deck",
+      "name": "bcBuzzer",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcFlow": {
+      "__class__": "ParamTocElement",
+      "ident": 9,
+      "group": "deck",
+      "name": "bcFlow",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcFlow2": {
+      "__class__": "ParamTocElement",
+      "ident": 10,
+      "group": "deck",
+      "name": "bcFlow2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLedRing": {
+      "__class__": "ParamTocElement",
+      "ident": 11,
+      "group": "deck",
+      "name": "bcLedRing",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLighthouse4": {
+      "__class__": "ParamTocElement",
+      "ident": 12,
+      "group": "deck",
+      "name": "bcLighthouse4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcDWM1000": {
+      "__class__": "ParamTocElement",
+      "ident": 13,
+      "group": "deck",
+      "name": "bcDWM1000",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLoco": {
+      "__class__": "ParamTocElement",
+      "ident": 14,
+      "group": "deck",
+      "name": "bcLoco",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcMultiranger": {
+      "__class__": "ParamTocElement",
+      "ident": 15,
+      "group": "deck",
+      "name": "bcMultiranger",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcOA": {
+      "__class__": "ParamTocElement",
+      "ident": 16,
+      "group": "deck",
+      "name": "bcOA",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcUSD": {
+      "__class__": "ParamTocElement",
+      "ident": 17,
+      "group": "deck",
+      "name": "bcUSD",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcZRanger": {
+      "__class__": "ParamTocElement",
+      "ident": 18,
+      "group": "deck",
+      "name": "bcZRanger",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcZRanger2": {
+      "__class__": "ParamTocElement",
+      "ident": 19,
+      "group": "deck",
+      "name": "bcZRanger2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "motion": {
+    "disable": {
+      "__class__": "ParamTocElement",
+      "ident": 20,
+      "group": "motion",
+      "name": "disable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "adaptive": {
+      "__class__": "ParamTocElement",
+      "ident": 21,
+      "group": "motion",
+      "name": "adaptive",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "flowStdFixed": {
+      "__class__": "ParamTocElement",
+      "ident": 22,
+      "group": "motion",
+      "name": "flowStdFixed",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "ring": {
+    "effect": {
+      "__class__": "ParamTocElement",
+      "ident": 23,
+      "group": "ring",
+      "name": "effect",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "neffect": {
+      "__class__": "ParamTocElement",
+      "ident": 24,
+      "group": "ring",
+      "name": "neffect",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "solidRed": {
+      "__class__": "ParamTocElement",
+      "ident": 25,
+      "group": "ring",
+      "name": "solidRed",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "solidGreen": {
+      "__class__": "ParamTocElement",
+      "ident": 26,
+      "group": "ring",
+      "name": "solidGreen",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "solidBlue": {
+      "__class__": "ParamTocElement",
+      "ident": 27,
+      "group": "ring",
+      "name": "solidBlue",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "headlightEnable": {
+      "__class__": "ParamTocElement",
+      "ident": 28,
+      "group": "ring",
+      "name": "headlightEnable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "emptyCharge": {
+      "__class__": "ParamTocElement",
+      "ident": 29,
+      "group": "ring",
+      "name": "emptyCharge",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "fullCharge": {
+      "__class__": "ParamTocElement",
+      "ident": 30,
+      "group": "ring",
+      "name": "fullCharge",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "fadeColor": {
+      "__class__": "ParamTocElement",
+      "ident": 31,
+      "group": "ring",
+      "name": "fadeColor",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0,
+      "extended": false
+    },
+    "fadeTime": {
+      "__class__": "ParamTocElement",
+      "ident": 32,
+      "group": "ring",
+      "name": "fadeTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "system": {
+    "highlight": {
+      "__class__": "ParamTocElement",
+      "ident": 33,
+      "group": "system",
+      "name": "highlight",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "storageStats": {
+      "__class__": "ParamTocElement",
+      "ident": 34,
+      "group": "system",
+      "name": "storageStats",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "storageReformat": {
+      "__class__": "ParamTocElement",
+      "ident": 35,
+      "group": "system",
+      "name": "storageReformat",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "taskDump": {
+      "__class__": "ParamTocElement",
+      "ident": 36,
+      "group": "system",
+      "name": "taskDump",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "selftestPassed": {
+      "__class__": "ParamTocElement",
+      "ident": 37,
+      "group": "system",
+      "name": "selftestPassed",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 1,
+      "extended": false
+    },
+    "forceArm": {
+      "__class__": "ParamTocElement",
+      "ident": 38,
+      "group": "system",
+      "name": "forceArm",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "assertInfo": {
+      "__class__": "ParamTocElement",
+      "ident": 39,
+      "group": "system",
+      "name": "assertInfo",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "testLogParam": {
+      "__class__": "ParamTocElement",
+      "ident": 40,
+      "group": "system",
+      "name": "testLogParam",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "loco": {
+    "mode": {
+      "__class__": "ParamTocElement",
+      "ident": 41,
+      "group": "loco",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "tdoa2": {
+    "stddev": {
+      "__class__": "ParamTocElement",
+      "ident": 42,
+      "group": "tdoa2",
+      "name": "stddev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "tdoa3": {
+    "stddev": {
+      "__class__": "ParamTocElement",
+      "ident": 43,
+      "group": "tdoa3",
+      "name": "stddev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "multiranger": {
+    "filterMask": {
+      "__class__": "ParamTocElement",
+      "ident": 44,
+      "group": "multiranger",
+      "name": "filterMask",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "usd": {
+    "canLog": {
+      "__class__": "ParamTocElement",
+      "ident": 45,
+      "group": "usd",
+      "name": "canLog",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "logging": {
+      "__class__": "ParamTocElement",
+      "ident": 46,
+      "group": "usd",
+      "name": "logging",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "led": {
+    "bitmask": {
+      "__class__": "ParamTocElement",
+      "ident": 47,
+      "group": "led",
+      "name": "bitmask",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "motorPowerSet": {
+    "enable": {
+      "__class__": "ParamTocElement",
+      "ident": 48,
+      "group": "motorPowerSet",
+      "name": "enable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "m1": {
+      "__class__": "ParamTocElement",
+      "ident": 49,
+      "group": "motorPowerSet",
+      "name": "m1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m2": {
+      "__class__": "ParamTocElement",
+      "ident": 50,
+      "group": "motorPowerSet",
+      "name": "m2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m3": {
+      "__class__": "ParamTocElement",
+      "ident": 51,
+      "group": "motorPowerSet",
+      "name": "m3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m4": {
+      "__class__": "ParamTocElement",
+      "ident": 52,
+      "group": "motorPowerSet",
+      "name": "m4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "pm": {
+    "lowVoltage": {
+      "__class__": "ParamTocElement",
+      "ident": 53,
+      "group": "pm",
+      "name": "lowVoltage",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "criticalLowVoltage": {
+      "__class__": "ParamTocElement",
+      "ident": 54,
+      "group": "pm",
+      "name": "criticalLowVoltage",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "imu_sensors": {
+    "BMP388": {
+      "__class__": "ParamTocElement",
+      "ident": 55,
+      "group": "imu_sensors",
+      "name": "BMP388",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "imuPhi": {
+      "__class__": "ParamTocElement",
+      "ident": 56,
+      "group": "imu_sensors",
+      "name": "imuPhi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuTheta": {
+      "__class__": "ParamTocElement",
+      "ident": 57,
+      "group": "imu_sensors",
+      "name": "imuTheta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuPsi": {
+      "__class__": "ParamTocElement",
+      "ident": 58,
+      "group": "imu_sensors",
+      "name": "imuPsi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "AK8963": {
+      "__class__": "ParamTocElement",
+      "ident": 59,
+      "group": "imu_sensors",
+      "name": "AK8963",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "LPS25H": {
+      "__class__": "ParamTocElement",
+      "ident": 60,
+      "group": "imu_sensors",
+      "name": "LPS25H",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "imu_tests": {
+    "MPU6500": {
+      "__class__": "ParamTocElement",
+      "ident": 61,
+      "group": "imu_tests",
+      "name": "MPU6500",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "AK8963": {
+      "__class__": "ParamTocElement",
+      "ident": 62,
+      "group": "imu_tests",
+      "name": "AK8963",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "LPS25H": {
+      "__class__": "ParamTocElement",
+      "ident": 63,
+      "group": "imu_tests",
+      "name": "LPS25H",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "imuPhi": {
+      "__class__": "ParamTocElement",
+      "ident": 64,
+      "group": "imu_tests",
+      "name": "imuPhi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuTheta": {
+      "__class__": "ParamTocElement",
+      "ident": 65,
+      "group": "imu_tests",
+      "name": "imuTheta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuPsi": {
+      "__class__": "ParamTocElement",
+      "ident": 66,
+      "group": "imu_tests",
+      "name": "imuPsi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "syslink": {
+    "probe": {
+      "__class__": "ParamTocElement",
+      "ident": 67,
+      "group": "syslink",
+      "name": "probe",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "usec": {
+    "reset": {
+      "__class__": "ParamTocElement",
+      "ident": 68,
+      "group": "usec",
+      "name": "reset",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "colAv": {
+    "enable": {
+      "__class__": "ParamTocElement",
+      "ident": 69,
+      "group": "colAv",
+      "name": "enable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidX": {
+      "__class__": "ParamTocElement",
+      "ident": 70,
+      "group": "colAv",
+      "name": "ellipsoidX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidY": {
+      "__class__": "ParamTocElement",
+      "ident": 71,
+      "group": "colAv",
+      "name": "ellipsoidY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidZ": {
+      "__class__": "ParamTocElement",
+      "ident": 72,
+      "group": "colAv",
+      "name": "ellipsoidZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinX": {
+      "__class__": "ParamTocElement",
+      "ident": 73,
+      "group": "colAv",
+      "name": "bboxMinX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinY": {
+      "__class__": "ParamTocElement",
+      "ident": 74,
+      "group": "colAv",
+      "name": "bboxMinY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinZ": {
+      "__class__": "ParamTocElement",
+      "ident": 75,
+      "group": "colAv",
+      "name": "bboxMinZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxX": {
+      "__class__": "ParamTocElement",
+      "ident": 76,
+      "group": "colAv",
+      "name": "bboxMaxX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxY": {
+      "__class__": "ParamTocElement",
+      "ident": 77,
+      "group": "colAv",
+      "name": "bboxMaxY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxZ": {
+      "__class__": "ParamTocElement",
+      "ident": 78,
+      "group": "colAv",
+      "name": "bboxMaxZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "horizon": {
+      "__class__": "ParamTocElement",
+      "ident": 79,
+      "group": "colAv",
+      "name": "horizon",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxSpeed": {
+      "__class__": "ParamTocElement",
+      "ident": 80,
+      "group": "colAv",
+      "name": "maxSpeed",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "sidestepThrsh": {
+      "__class__": "ParamTocElement",
+      "ident": 81,
+      "group": "colAv",
+      "name": "sidestepThrsh",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxPeerLocAge": {
+      "__class__": "ParamTocElement",
+      "ident": 82,
+      "group": "colAv",
+      "name": "maxPeerLocAge",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0,
+      "extended": false
+    },
+    "vorTol": {
+      "__class__": "ParamTocElement",
+      "ident": 83,
+      "group": "colAv",
+      "name": "vorTol",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "vorIters": {
+      "__class__": "ParamTocElement",
+      "ident": 84,
+      "group": "colAv",
+      "name": "vorIters",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "commander": {
+    "enHighLevel": {
+      "__class__": "ParamTocElement",
+      "ident": 85,
+      "group": "commander",
+      "name": "enHighLevel",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "cppm": {
+    "rateRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 86,
+      "group": "cppm",
+      "name": "rateRoll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ratePitch": {
+      "__class__": "ParamTocElement",
+      "ident": 87,
+      "group": "cppm",
+      "name": "ratePitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "angPitch": {
+      "__class__": "ParamTocElement",
+      "ident": 88,
+      "group": "cppm",
+      "name": "angPitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "angRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 89,
+      "group": "cppm",
+      "name": "angRoll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "rateYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 90,
+      "group": "cppm",
+      "name": "rateYaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "hlCommander": {
+    "vtoff": {
+      "__class__": "ParamTocElement",
+      "ident": 91,
+      "group": "hlCommander",
+      "name": "vtoff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "vland": {
+      "__class__": "ParamTocElement",
+      "ident": 92,
+      "group": "hlCommander",
+      "name": "vland",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "flightmode": {
+    "althold": {
+      "__class__": "ParamTocElement",
+      "ident": 93,
+      "group": "flightmode",
+      "name": "althold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "poshold": {
+      "__class__": "ParamTocElement",
+      "ident": 94,
+      "group": "flightmode",
+      "name": "poshold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "posSet": {
+      "__class__": "ParamTocElement",
+      "ident": 95,
+      "group": "flightmode",
+      "name": "posSet",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "yawMode": {
+      "__class__": "ParamTocElement",
+      "ident": 96,
+      "group": "flightmode",
+      "name": "yawMode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModeRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 97,
+      "group": "flightmode",
+      "name": "stabModeRoll",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModePitch": {
+      "__class__": "ParamTocElement",
+      "ident": 98,
+      "group": "flightmode",
+      "name": "stabModePitch",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModeYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 99,
+      "group": "flightmode",
+      "name": "stabModeYaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "locSrv": {
+    "enRangeStreamFP32": {
+      "__class__": "ParamTocElement",
+      "ident": 100,
+      "group": "locSrv",
+      "name": "enRangeStreamFP32",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "enLhAngleStream": {
+      "__class__": "ParamTocElement",
+      "ident": 101,
+      "group": "locSrv",
+      "name": "enLhAngleStream",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "extPosStdDev": {
+      "__class__": "ParamTocElement",
+      "ident": 102,
+      "group": "locSrv",
+      "name": "extPosStdDev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "extQuatStdDev": {
+      "__class__": "ParamTocElement",
+      "ident": 103,
+      "group": "locSrv",
+      "name": "extQuatStdDev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "crtpsrv": {
+    "echoDelay": {
+      "__class__": "ParamTocElement",
+      "ident": 104,
+      "group": "crtpsrv",
+      "name": "echoDelay",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "health": {
+    "startPropTest": {
+      "__class__": "ParamTocElement",
+      "ident": 105,
+      "group": "health",
+      "name": "startPropTest",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "startBatTest": {
+      "__class__": "ParamTocElement",
+      "ident": 106,
+      "group": "health",
+      "name": "startBatTest",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "propTestPWMRatio": {
+      "__class__": "ParamTocElement",
+      "ident": 107,
+      "group": "health",
+      "name": "propTestPWMRatio",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "batTestPWMRatio": {
+      "__class__": "ParamTocElement",
+      "ident": 108,
+      "group": "health",
+      "name": "batTestPWMRatio",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "kalman": {
+    "maxPos": {
+      "__class__": "ParamTocElement",
+      "ident": 109,
+      "group": "kalman",
+      "name": "maxPos",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxVel": {
+      "__class__": "ParamTocElement",
+      "ident": 110,
+      "group": "kalman",
+      "name": "maxVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "resetEstimation": {
+      "__class__": "ParamTocElement",
+      "ident": 111,
+      "group": "kalman",
+      "name": "resetEstimation",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "robustTdoa": {
+      "__class__": "ParamTocElement",
+      "ident": 112,
+      "group": "kalman",
+      "name": "robustTdoa",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "robustTwr": {
+      "__class__": "ParamTocElement",
+      "ident": 113,
+      "group": "kalman",
+      "name": "robustTwr",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "pNAcc_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 114,
+      "group": "kalman",
+      "name": "pNAcc_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNAcc_z": {
+      "__class__": "ParamTocElement",
+      "ident": 115,
+      "group": "kalman",
+      "name": "pNAcc_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNVel": {
+      "__class__": "ParamTocElement",
+      "ident": 116,
+      "group": "kalman",
+      "name": "pNVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNPos": {
+      "__class__": "ParamTocElement",
+      "ident": 117,
+      "group": "kalman",
+      "name": "pNPos",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNAtt": {
+      "__class__": "ParamTocElement",
+      "ident": 118,
+      "group": "kalman",
+      "name": "pNAtt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNBaro": {
+      "__class__": "ParamTocElement",
+      "ident": 119,
+      "group": "kalman",
+      "name": "mNBaro",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNGyro_rollpitch": {
+      "__class__": "ParamTocElement",
+      "ident": 120,
+      "group": "kalman",
+      "name": "mNGyro_rollpitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNGyro_yaw": {
+      "__class__": "ParamTocElement",
+      "ident": 121,
+      "group": "kalman",
+      "name": "mNGyro_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "initialX": {
+      "__class__": "ParamTocElement",
+      "ident": 122,
+      "group": "kalman",
+      "name": "initialX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialY": {
+      "__class__": "ParamTocElement",
+      "ident": 123,
+      "group": "kalman",
+      "name": "initialY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialZ": {
+      "__class__": "ParamTocElement",
+      "ident": 124,
+      "group": "kalman",
+      "name": "initialZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 125,
+      "group": "kalman",
+      "name": "initialYaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "memTst": {
+    "resetW": {
+      "__class__": "ParamTocElement",
+      "ident": 126,
+      "group": "memTst",
+      "name": "resetW",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "powerDist": {
+    "idleThrust": {
+      "__class__": "ParamTocElement",
+      "ident": 127,
+      "group": "powerDist",
+      "name": "idleThrust",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "quadSysId": {
+    "thrustToTorque": {
+      "__class__": "ParamTocElement",
+      "ident": 128,
+      "group": "quadSysId",
+      "name": "thrustToTorque",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pwmToThrustA": {
+      "__class__": "ParamTocElement",
+      "ident": 129,
+      "group": "quadSysId",
+      "name": "pwmToThrustA",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pwmToThrustB": {
+      "__class__": "ParamTocElement",
+      "ident": 130,
+      "group": "quadSysId",
+      "name": "pwmToThrustB",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "armLength": {
+      "__class__": "ParamTocElement",
+      "ident": 131,
+      "group": "quadSysId",
+      "name": "armLength",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "sensfusion6": {
+    "kp": {
+      "__class__": "ParamTocElement",
+      "ident": 132,
+      "group": "sensfusion6",
+      "name": "kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki": {
+      "__class__": "ParamTocElement",
+      "ident": 133,
+      "group": "sensfusion6",
+      "name": "ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "baseZacc": {
+      "__class__": "ParamTocElement",
+      "ident": 134,
+      "group": "sensfusion6",
+      "name": "baseZacc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "sound": {
+    "effect": {
+      "__class__": "ParamTocElement",
+      "ident": 135,
+      "group": "sound",
+      "name": "effect",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "neffect": {
+      "__class__": "ParamTocElement",
+      "ident": 136,
+      "group": "sound",
+      "name": "neffect",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "freq": {
+      "__class__": "ParamTocElement",
+      "ident": 137,
+      "group": "sound",
+      "name": "freq",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "stabilizer": {
+    "estimator": {
+      "__class__": "ParamTocElement",
+      "ident": 138,
+      "group": "stabilizer",
+      "name": "estimator",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "controller": {
+      "__class__": "ParamTocElement",
+      "ident": 139,
+      "group": "stabilizer",
+      "name": "controller",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stop": {
+      "__class__": "ParamTocElement",
+      "ident": 140,
+      "group": "stabilizer",
+      "name": "stop",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "cpu": {
+    "flash": {
+      "__class__": "ParamTocElement",
+      "ident": 141,
+      "group": "cpu",
+      "name": "flash",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "id0": {
+      "__class__": "ParamTocElement",
+      "ident": 142,
+      "group": "cpu",
+      "name": "id0",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "id1": {
+      "__class__": "ParamTocElement",
+      "ident": 143,
+      "group": "cpu",
+      "name": "id1",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "id2": {
+      "__class__": "ParamTocElement",
+      "ident": 144,
+      "group": "cpu",
+      "name": "id2",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "tdoaEngine": {
+    "logId": {
+      "__class__": "ParamTocElement",
+      "ident": 145,
+      "group": "tdoaEngine",
+      "name": "logId",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "logOthrId": {
+      "__class__": "ParamTocElement",
+      "ident": 146,
+      "group": "tdoaEngine",
+      "name": "logOthrId",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "matchAlgo": {
+      "__class__": "ParamTocElement",
+      "ident": 147,
+      "group": "tdoaEngine",
+      "name": "matchAlgo",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "lighthouse": {
+    "method": {
+      "__class__": "ParamTocElement",
+      "ident": 148,
+      "group": "lighthouse",
+      "name": "method",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "bsCalibReset": {
+      "__class__": "ParamTocElement",
+      "ident": 149,
+      "group": "lighthouse",
+      "name": "bsCalibReset",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "systemType": {
+      "__class__": "ParamTocElement",
+      "ident": 150,
+      "group": "lighthouse",
+      "name": "systemType",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "bsAvailable": {
+      "__class__": "ParamTocElement",
+      "ident": 151,
+      "group": "lighthouse",
+      "name": "bsAvailable",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "sweepStd": {
+      "__class__": "ParamTocElement",
+      "ident": 152,
+      "group": "lighthouse",
+      "name": "sweepStd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "sweepStd2": {
+      "__class__": "ParamTocElement",
+      "ident": 153,
+      "group": "lighthouse",
+      "name": "sweepStd2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "enLhRawStream": {
+      "__class__": "ParamTocElement",
+      "ident": 154,
+      "group": "lighthouse",
+      "name": "enLhRawStream",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "lh2maxRate": {
+      "__class__": "ParamTocElement",
+      "ident": 155,
+      "group": "lighthouse",
+      "name": "lh2maxRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "pid_attitude": {
+    "roll_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 156,
+      "group": "pid_attitude",
+      "name": "roll_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 157,
+      "group": "pid_attitude",
+      "name": "roll_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 158,
+      "group": "pid_attitude",
+      "name": "roll_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 159,
+      "group": "pid_attitude",
+      "name": "roll_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 160,
+      "group": "pid_attitude",
+      "name": "pitch_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 161,
+      "group": "pid_attitude",
+      "name": "pitch_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 162,
+      "group": "pid_attitude",
+      "name": "pitch_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 163,
+      "group": "pid_attitude",
+      "name": "pitch_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 164,
+      "group": "pid_attitude",
+      "name": "yaw_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 165,
+      "group": "pid_attitude",
+      "name": "yaw_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 166,
+      "group": "pid_attitude",
+      "name": "yaw_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 167,
+      "group": "pid_attitude",
+      "name": "yaw_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yawMaxDelta": {
+      "__class__": "ParamTocElement",
+      "ident": 168,
+      "group": "pid_attitude",
+      "name": "yawMaxDelta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "attFiltEn": {
+      "__class__": "ParamTocElement",
+      "ident": 169,
+      "group": "pid_attitude",
+      "name": "attFiltEn",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "attFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 170,
+      "group": "pid_attitude",
+      "name": "attFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "pid_rate": {
+    "roll_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 171,
+      "group": "pid_rate",
+      "name": "roll_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 172,
+      "group": "pid_rate",
+      "name": "roll_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 173,
+      "group": "pid_rate",
+      "name": "roll_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 174,
+      "group": "pid_rate",
+      "name": "roll_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 175,
+      "group": "pid_rate",
+      "name": "pitch_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 176,
+      "group": "pid_rate",
+      "name": "pitch_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 177,
+      "group": "pid_rate",
+      "name": "pitch_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 178,
+      "group": "pid_rate",
+      "name": "pitch_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 179,
+      "group": "pid_rate",
+      "name": "yaw_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 180,
+      "group": "pid_rate",
+      "name": "yaw_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 181,
+      "group": "pid_rate",
+      "name": "yaw_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 182,
+      "group": "pid_rate",
+      "name": "yaw_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "rateFiltEn": {
+      "__class__": "ParamTocElement",
+      "ident": 183,
+      "group": "pid_rate",
+      "name": "rateFiltEn",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "omxFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 184,
+      "group": "pid_rate",
+      "name": "omxFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "omyFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 185,
+      "group": "pid_rate",
+      "name": "omyFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "omzFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 186,
+      "group": "pid_rate",
+      "name": "omzFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "ctrlINDI": {
+    "thrust_threshold": {
+      "__class__": "ParamTocElement",
+      "ident": 187,
+      "group": "ctrlINDI",
+      "name": "thrust_threshold",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bound_ctrl_input": {
+      "__class__": "ParamTocElement",
+      "ident": 188,
+      "group": "ctrlINDI",
+      "name": "bound_ctrl_input",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_p": {
+      "__class__": "ParamTocElement",
+      "ident": 189,
+      "group": "ctrlINDI",
+      "name": "g1_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_q": {
+      "__class__": "ParamTocElement",
+      "ident": 190,
+      "group": "ctrlINDI",
+      "name": "g1_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_r": {
+      "__class__": "ParamTocElement",
+      "ident": 191,
+      "group": "ctrlINDI",
+      "name": "g1_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g2": {
+      "__class__": "ParamTocElement",
+      "ident": 192,
+      "group": "ctrlINDI",
+      "name": "g2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_p": {
+      "__class__": "ParamTocElement",
+      "ident": 193,
+      "group": "ctrlINDI",
+      "name": "ref_err_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_q": {
+      "__class__": "ParamTocElement",
+      "ident": 194,
+      "group": "ctrlINDI",
+      "name": "ref_err_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_r": {
+      "__class__": "ParamTocElement",
+      "ident": 195,
+      "group": "ctrlINDI",
+      "name": "ref_err_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_p": {
+      "__class__": "ParamTocElement",
+      "ident": 196,
+      "group": "ctrlINDI",
+      "name": "ref_rate_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_q": {
+      "__class__": "ParamTocElement",
+      "ident": 197,
+      "group": "ctrlINDI",
+      "name": "ref_rate_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_r": {
+      "__class__": "ParamTocElement",
+      "ident": 198,
+      "group": "ctrlINDI",
+      "name": "ref_rate_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_p": {
+      "__class__": "ParamTocElement",
+      "ident": 199,
+      "group": "ctrlINDI",
+      "name": "act_dyn_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_q": {
+      "__class__": "ParamTocElement",
+      "ident": 200,
+      "group": "ctrlINDI",
+      "name": "act_dyn_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_r": {
+      "__class__": "ParamTocElement",
+      "ident": 201,
+      "group": "ctrlINDI",
+      "name": "act_dyn_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "filt_cutoff": {
+      "__class__": "ParamTocElement",
+      "ident": 202,
+      "group": "ctrlINDI",
+      "name": "filt_cutoff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "filt_cutoff_r": {
+      "__class__": "ParamTocElement",
+      "ident": 203,
+      "group": "ctrlINDI",
+      "name": "filt_cutoff_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "outerLoopActive": {
+      "__class__": "ParamTocElement",
+      "ident": 204,
+      "group": "ctrlINDI",
+      "name": "outerLoopActive",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "ctrlMel": {
+    "kp_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 205,
+      "group": "ctrlMel",
+      "name": "kp_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 206,
+      "group": "ctrlMel",
+      "name": "kd_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 207,
+      "group": "ctrlMel",
+      "name": "ki_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 208,
+      "group": "ctrlMel",
+      "name": "i_range_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kp_z": {
+      "__class__": "ParamTocElement",
+      "ident": 209,
+      "group": "ctrlMel",
+      "name": "kp_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_z": {
+      "__class__": "ParamTocElement",
+      "ident": 210,
+      "group": "ctrlMel",
+      "name": "kd_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_z": {
+      "__class__": "ParamTocElement",
+      "ident": 211,
+      "group": "ctrlMel",
+      "name": "ki_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_z": {
+      "__class__": "ParamTocElement",
+      "ident": 212,
+      "group": "ctrlMel",
+      "name": "i_range_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mass": {
+      "__class__": "ParamTocElement",
+      "ident": 213,
+      "group": "ctrlMel",
+      "name": "mass",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "massThrust": {
+      "__class__": "ParamTocElement",
+      "ident": 214,
+      "group": "ctrlMel",
+      "name": "massThrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kR_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 215,
+      "group": "ctrlMel",
+      "name": "kR_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kR_z": {
+      "__class__": "ParamTocElement",
+      "ident": 216,
+      "group": "ctrlMel",
+      "name": "kR_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kw_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 217,
+      "group": "ctrlMel",
+      "name": "kw_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kw_z": {
+      "__class__": "ParamTocElement",
+      "ident": 218,
+      "group": "ctrlMel",
+      "name": "kw_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_m_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 219,
+      "group": "ctrlMel",
+      "name": "ki_m_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_m_z": {
+      "__class__": "ParamTocElement",
+      "ident": 220,
+      "group": "ctrlMel",
+      "name": "ki_m_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_omega_rp": {
+      "__class__": "ParamTocElement",
+      "ident": 221,
+      "group": "ctrlMel",
+      "name": "kd_omega_rp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_m_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 222,
+      "group": "ctrlMel",
+      "name": "i_range_m_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_m_z": {
+      "__class__": "ParamTocElement",
+      "ident": 223,
+      "group": "ctrlMel",
+      "name": "i_range_m_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "ctrlAtt": {
+    "tau_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 224,
+      "group": "ctrlAtt",
+      "name": "tau_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "zeta_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 225,
+      "group": "ctrlAtt",
+      "name": "zeta_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "tau_z": {
+      "__class__": "ParamTocElement",
+      "ident": 226,
+      "group": "ctrlAtt",
+      "name": "tau_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "zeta_z": {
+      "__class__": "ParamTocElement",
+      "ident": 227,
+      "group": "ctrlAtt",
+      "name": "zeta_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "tau_rp": {
+      "__class__": "ParamTocElement",
+      "ident": 228,
+      "group": "ctrlAtt",
+      "name": "tau_rp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "mixing_factor": {
+      "__class__": "ParamTocElement",
+      "ident": 229,
+      "group": "ctrlAtt",
+      "name": "mixing_factor",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "coll_fairness": {
+      "__class__": "ParamTocElement",
+      "ident": 230,
+      "group": "ctrlAtt",
+      "name": "coll_fairness",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "posCtrlIndi": {
+    "K_xi_x": {
+      "__class__": "ParamTocElement",
+      "ident": 231,
+      "group": "posCtrlIndi",
+      "name": "K_xi_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_xi_y": {
+      "__class__": "ParamTocElement",
+      "ident": 232,
+      "group": "posCtrlIndi",
+      "name": "K_xi_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_xi_z": {
+      "__class__": "ParamTocElement",
+      "ident": 233,
+      "group": "posCtrlIndi",
+      "name": "K_xi_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_x": {
+      "__class__": "ParamTocElement",
+      "ident": 234,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_y": {
+      "__class__": "ParamTocElement",
+      "ident": 235,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_z": {
+      "__class__": "ParamTocElement",
+      "ident": 236,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pq_clamping": {
+      "__class__": "ParamTocElement",
+      "ident": 237,
+      "group": "posCtrlIndi",
+      "name": "pq_clamping",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "posCtlPid": {
+    "xKp": {
+      "__class__": "ParamTocElement",
+      "ident": 238,
+      "group": "posCtlPid",
+      "name": "xKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKi": {
+      "__class__": "ParamTocElement",
+      "ident": 239,
+      "group": "posCtlPid",
+      "name": "xKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKd": {
+      "__class__": "ParamTocElement",
+      "ident": 240,
+      "group": "posCtlPid",
+      "name": "xKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKff": {
+      "__class__": "ParamTocElement",
+      "ident": 241,
+      "group": "posCtlPid",
+      "name": "xKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKp": {
+      "__class__": "ParamTocElement",
+      "ident": 242,
+      "group": "posCtlPid",
+      "name": "yKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKi": {
+      "__class__": "ParamTocElement",
+      "ident": 243,
+      "group": "posCtlPid",
+      "name": "yKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKd": {
+      "__class__": "ParamTocElement",
+      "ident": 244,
+      "group": "posCtlPid",
+      "name": "yKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKff": {
+      "__class__": "ParamTocElement",
+      "ident": 245,
+      "group": "posCtlPid",
+      "name": "yKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKp": {
+      "__class__": "ParamTocElement",
+      "ident": 246,
+      "group": "posCtlPid",
+      "name": "zKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKi": {
+      "__class__": "ParamTocElement",
+      "ident": 247,
+      "group": "posCtlPid",
+      "name": "zKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKd": {
+      "__class__": "ParamTocElement",
+      "ident": 248,
+      "group": "posCtlPid",
+      "name": "zKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKff": {
+      "__class__": "ParamTocElement",
+      "ident": 249,
+      "group": "posCtlPid",
+      "name": "zKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "thrustBase": {
+      "__class__": "ParamTocElement",
+      "ident": 250,
+      "group": "posCtlPid",
+      "name": "thrustBase",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "thrustMin": {
+      "__class__": "ParamTocElement",
+      "ident": 251,
+      "group": "posCtlPid",
+      "name": "thrustMin",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "rLimit": {
+      "__class__": "ParamTocElement",
+      "ident": 252,
+      "group": "posCtlPid",
+      "name": "rLimit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pLimit": {
+      "__class__": "ParamTocElement",
+      "ident": 253,
+      "group": "posCtlPid",
+      "name": "pLimit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 254,
+      "group": "posCtlPid",
+      "name": "xVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 255,
+      "group": "posCtlPid",
+      "name": "yVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 256,
+      "group": "posCtlPid",
+      "name": "zVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "velCtlPid": {
+    "vxKp": {
+      "__class__": "ParamTocElement",
+      "ident": 257,
+      "group": "velCtlPid",
+      "name": "vxKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKi": {
+      "__class__": "ParamTocElement",
+      "ident": 258,
+      "group": "velCtlPid",
+      "name": "vxKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKd": {
+      "__class__": "ParamTocElement",
+      "ident": 259,
+      "group": "velCtlPid",
+      "name": "vxKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 260,
+      "group": "velCtlPid",
+      "name": "vxKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKp": {
+      "__class__": "ParamTocElement",
+      "ident": 261,
+      "group": "velCtlPid",
+      "name": "vyKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKi": {
+      "__class__": "ParamTocElement",
+      "ident": 262,
+      "group": "velCtlPid",
+      "name": "vyKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKd": {
+      "__class__": "ParamTocElement",
+      "ident": 263,
+      "group": "velCtlPid",
+      "name": "vyKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 264,
+      "group": "velCtlPid",
+      "name": "vyKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKp": {
+      "__class__": "ParamTocElement",
+      "ident": 265,
+      "group": "velCtlPid",
+      "name": "vzKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKi": {
+      "__class__": "ParamTocElement",
+      "ident": 266,
+      "group": "velCtlPid",
+      "name": "vzKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKd": {
+      "__class__": "ParamTocElement",
+      "ident": 267,
+      "group": "velCtlPid",
+      "name": "vzKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 268,
+      "group": "velCtlPid",
+      "name": "vzKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "posEstAlt": {
+    "estAlphaAsl": {
+      "__class__": "ParamTocElement",
+      "ident": 269,
+      "group": "posEstAlt",
+      "name": "estAlphaAsl",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "estAlphaZr": {
+      "__class__": "ParamTocElement",
+      "ident": 270,
+      "group": "posEstAlt",
+      "name": "estAlphaZr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "velFactor": {
+      "__class__": "ParamTocElement",
+      "ident": 271,
+      "group": "posEstAlt",
+      "name": "velFactor",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "velZAlpha": {
+      "__class__": "ParamTocElement",
+      "ident": 272,
+      "group": "posEstAlt",
+      "name": "velZAlpha",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vAccDeadband": {
+      "__class__": "ParamTocElement",
+      "ident": 273,
+      "group": "posEstAlt",
+      "name": "vAccDeadband",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "firmware": {
+    "revision0": {
+      "__class__": "ParamTocElement",
+      "ident": 274,
+      "group": "firmware",
+      "name": "revision0",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "revision1": {
+      "__class__": "ParamTocElement",
+      "ident": 275,
+      "group": "firmware",
+      "name": "revision1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "modified": {
+      "__class__": "ParamTocElement",
+      "ident": 276,
+      "group": "firmware",
+      "name": "modified",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  }
+}
\ No newline at end of file
diff --git c/src/webots_pkg/test/hardware/test_cf_lighthouse_configuration.py i/src/webots_pkg/test/hardware/test_cf_lighthouse_configuration.py
index f38e758..c4353a5 100644
--- c/src/webots_pkg/test/hardware/test_cf_lighthouse_configuration.py
+++ i/src/webots_pkg/test/hardware/test_cf_lighthouse_configuration.py
@@ -5,21 +5,18 @@
 # /_/ /_/ /_/\__,_/_/\__/_/_/   \____/_.___/\____/\__/  /____/ |__/|__/\__,_/_/  /_/ /_/ /_/____/  
 
 """
-This file is used to test the functions in webots_pkg/lighthouse_classes.py
+This test ensures that the modified cffirmware has been written to the cf and that the cf is correctly configured to use our lighthouse system.
 Usage: pytest -v test_pre_launch_cf_lighthouse_configuration.py
 
 Author: Will Graham
 """
 
-
-
 import os
 import sys
 import pytest
 
-sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
+sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
 from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
-from webots_pkg.lighthouse_functions import get_cf_pose_according_to_lh, get_only_cf_kalman_pos
 from cflib.crazyflie import Crazyflie
 
 import cflib.crtp  # noqa
@@ -31,9 +28,61 @@ from cflib.crazyflie.mem import LighthouseBsGeometry
 from cflib.crazyflie.mem import LighthouseMemHelper
 from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
 from cflib.utils import uri_helper
+import pytest
+
+
+class TestCfLighthouseConfiguration:
+    """
+    This class is used to test the configuration of the Crazyflie lighthouse system.
+    """
+    def dummy_method(self):
+        """
+        This is a dummy method.
+        """
+        pass
+
+    def test_rot_matrix(self, radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
+        """
+        This fixture is used to test the rotation matrix of all basestations to be equal to straight up
+        """
+        uri = uri_helper.uri_from_env(radio_uri)
+        cflib.crtp.init_drivers()
+
+        temp_LHMem = ReadLHMem(radio_uri)
+
+        print()
+        print('------------------')
+        print("Basestation Memory on CF")
+        print()
+        print(temp_LHMem.geo_data[0].rotation_matrix)
+        print()
 
+        print(temp_LHMem.geo_data[1].rotation_matrix)
+        print(temp_LHMem.geo_data[2].rotation_matrix)
+        print(temp_LHMem.geo_data[3].rotation_matrix)
 
+        
+        # Tests for basestation 1
+        assert temp_LHMem.geo_data[0].rotation_matrix == [
+                [0.0, -1.0, 0.0],
+                [1.0, 0.0, 0.0],
+                [0.0, 0.0, 1.0],
+            ]
 
-# TODO: Add tests to confirm results from cf that current lh configuration is correct. 
+        assert temp_LHMem.geo_data[1].rotation_matrix ==[
+                [0.0, -1.0, 0.0],
+                [1.0, 0.0, 0.0],
+                [0.0, 0.0, 1.0],
+            ] 
 
 
+        assert temp_LHMem.geo_data[2].rotation_matrix ==[
+                [0.0, -1.0, 0.0],
+                [1.0, 0.0, 0.0],
+                [0.0, 0.0, 1.0],
+            ] 
+        assert temp_LHMem.geo_data[3].rotation_matrix ==[
+                [0.0, -1.0, 0.0],
+                [1.0, 0.0, 0.0],
+                [0.0, 0.0, 1.0],
+            ] 
\ No newline at end of file
diff --git c/src/webots_pkg/test/software/cache/39041F30.json i/src/webots_pkg/test/software/cache/39041F30.json
new file mode 100644
index 0000000..ea9e30f
--- /dev/null
+++ i/src/webots_pkg/test/software/cache/39041F30.json
@@ -0,0 +1,4463 @@
+{
+  "activeMarker": {
+    "btSns": {
+      "__class__": "LogTocElement",
+      "ident": 0,
+      "group": "activeMarker",
+      "name": "btSns",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "i2cOk": {
+      "__class__": "LogTocElement",
+      "ident": 1,
+      "group": "activeMarker",
+      "name": "i2cOk",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "motion": {
+    "motion": {
+      "__class__": "LogTocElement",
+      "ident": 2,
+      "group": "motion",
+      "name": "motion",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "deltaX": {
+      "__class__": "LogTocElement",
+      "ident": 3,
+      "group": "motion",
+      "name": "deltaX",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "deltaY": {
+      "__class__": "LogTocElement",
+      "ident": 4,
+      "group": "motion",
+      "name": "deltaY",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "shutter": {
+      "__class__": "LogTocElement",
+      "ident": 5,
+      "group": "motion",
+      "name": "shutter",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "maxRaw": {
+      "__class__": "LogTocElement",
+      "ident": 6,
+      "group": "motion",
+      "name": "maxRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "minRaw": {
+      "__class__": "LogTocElement",
+      "ident": 7,
+      "group": "motion",
+      "name": "minRaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Rawsum": {
+      "__class__": "LogTocElement",
+      "ident": 8,
+      "group": "motion",
+      "name": "Rawsum",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "outlierCount": {
+      "__class__": "LogTocElement",
+      "ident": 9,
+      "group": "motion",
+      "name": "outlierCount",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "squal": {
+      "__class__": "LogTocElement",
+      "ident": 10,
+      "group": "motion",
+      "name": "squal",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "std": {
+      "__class__": "LogTocElement",
+      "ident": 11,
+      "group": "motion",
+      "name": "std",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ring": {
+    "fadeTime": {
+      "__class__": "LogTocElement",
+      "ident": 12,
+      "group": "ring",
+      "name": "fadeTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "loco": {
+    "mode": {
+      "__class__": "LogTocElement",
+      "ident": 13,
+      "group": "loco",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "spiWr": {
+      "__class__": "LogTocElement",
+      "ident": 14,
+      "group": "loco",
+      "name": "spiWr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiRe": {
+      "__class__": "LogTocElement",
+      "ident": 15,
+      "group": "loco",
+      "name": "spiRe",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ranging": {
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 16,
+      "group": "ranging",
+      "name": "state",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "distance0": {
+      "__class__": "LogTocElement",
+      "ident": 17,
+      "group": "ranging",
+      "name": "distance0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance1": {
+      "__class__": "LogTocElement",
+      "ident": 18,
+      "group": "ranging",
+      "name": "distance1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance2": {
+      "__class__": "LogTocElement",
+      "ident": 19,
+      "group": "ranging",
+      "name": "distance2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance3": {
+      "__class__": "LogTocElement",
+      "ident": 20,
+      "group": "ranging",
+      "name": "distance3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance4": {
+      "__class__": "LogTocElement",
+      "ident": 21,
+      "group": "ranging",
+      "name": "distance4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance5": {
+      "__class__": "LogTocElement",
+      "ident": 22,
+      "group": "ranging",
+      "name": "distance5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance6": {
+      "__class__": "LogTocElement",
+      "ident": 23,
+      "group": "ranging",
+      "name": "distance6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "distance7": {
+      "__class__": "LogTocElement",
+      "ident": 24,
+      "group": "ranging",
+      "name": "distance7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure0": {
+      "__class__": "LogTocElement",
+      "ident": 25,
+      "group": "ranging",
+      "name": "pressure0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure1": {
+      "__class__": "LogTocElement",
+      "ident": 26,
+      "group": "ranging",
+      "name": "pressure1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure2": {
+      "__class__": "LogTocElement",
+      "ident": 27,
+      "group": "ranging",
+      "name": "pressure2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure3": {
+      "__class__": "LogTocElement",
+      "ident": 28,
+      "group": "ranging",
+      "name": "pressure3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure4": {
+      "__class__": "LogTocElement",
+      "ident": 29,
+      "group": "ranging",
+      "name": "pressure4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure5": {
+      "__class__": "LogTocElement",
+      "ident": 30,
+      "group": "ranging",
+      "name": "pressure5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure6": {
+      "__class__": "LogTocElement",
+      "ident": 31,
+      "group": "ranging",
+      "name": "pressure6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure7": {
+      "__class__": "LogTocElement",
+      "ident": 32,
+      "group": "ranging",
+      "name": "pressure7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "tdoa2": {
+    "d7-0": {
+      "__class__": "LogTocElement",
+      "ident": 33,
+      "group": "tdoa2",
+      "name": "d7-0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d0-1": {
+      "__class__": "LogTocElement",
+      "ident": 34,
+      "group": "tdoa2",
+      "name": "d0-1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d1-2": {
+      "__class__": "LogTocElement",
+      "ident": 35,
+      "group": "tdoa2",
+      "name": "d1-2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d2-3": {
+      "__class__": "LogTocElement",
+      "ident": 36,
+      "group": "tdoa2",
+      "name": "d2-3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d3-4": {
+      "__class__": "LogTocElement",
+      "ident": 37,
+      "group": "tdoa2",
+      "name": "d3-4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d4-5": {
+      "__class__": "LogTocElement",
+      "ident": 38,
+      "group": "tdoa2",
+      "name": "d4-5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d5-6": {
+      "__class__": "LogTocElement",
+      "ident": 39,
+      "group": "tdoa2",
+      "name": "d5-6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "d6-7": {
+      "__class__": "LogTocElement",
+      "ident": 40,
+      "group": "tdoa2",
+      "name": "d6-7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc0": {
+      "__class__": "LogTocElement",
+      "ident": 41,
+      "group": "tdoa2",
+      "name": "cc0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc1": {
+      "__class__": "LogTocElement",
+      "ident": 42,
+      "group": "tdoa2",
+      "name": "cc1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc2": {
+      "__class__": "LogTocElement",
+      "ident": 43,
+      "group": "tdoa2",
+      "name": "cc2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc3": {
+      "__class__": "LogTocElement",
+      "ident": 44,
+      "group": "tdoa2",
+      "name": "cc3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc4": {
+      "__class__": "LogTocElement",
+      "ident": 45,
+      "group": "tdoa2",
+      "name": "cc4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc5": {
+      "__class__": "LogTocElement",
+      "ident": 46,
+      "group": "tdoa2",
+      "name": "cc5",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc6": {
+      "__class__": "LogTocElement",
+      "ident": 47,
+      "group": "tdoa2",
+      "name": "cc6",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc7": {
+      "__class__": "LogTocElement",
+      "ident": 48,
+      "group": "tdoa2",
+      "name": "cc7",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "dist7-0": {
+      "__class__": "LogTocElement",
+      "ident": 49,
+      "group": "tdoa2",
+      "name": "dist7-0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist0-1": {
+      "__class__": "LogTocElement",
+      "ident": 50,
+      "group": "tdoa2",
+      "name": "dist0-1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist1-2": {
+      "__class__": "LogTocElement",
+      "ident": 51,
+      "group": "tdoa2",
+      "name": "dist1-2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist2-3": {
+      "__class__": "LogTocElement",
+      "ident": 52,
+      "group": "tdoa2",
+      "name": "dist2-3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist3-4": {
+      "__class__": "LogTocElement",
+      "ident": 53,
+      "group": "tdoa2",
+      "name": "dist3-4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist4-5": {
+      "__class__": "LogTocElement",
+      "ident": 54,
+      "group": "tdoa2",
+      "name": "dist4-5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist5-6": {
+      "__class__": "LogTocElement",
+      "ident": 55,
+      "group": "tdoa2",
+      "name": "dist5-6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "dist6-7": {
+      "__class__": "LogTocElement",
+      "ident": 56,
+      "group": "tdoa2",
+      "name": "dist6-7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "twr": {
+    "rangingSuccessRate0": {
+      "__class__": "LogTocElement",
+      "ident": 57,
+      "group": "twr",
+      "name": "rangingSuccessRate0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec0": {
+      "__class__": "LogTocElement",
+      "ident": 58,
+      "group": "twr",
+      "name": "rangingPerSec0",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate1": {
+      "__class__": "LogTocElement",
+      "ident": 59,
+      "group": "twr",
+      "name": "rangingSuccessRate1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec1": {
+      "__class__": "LogTocElement",
+      "ident": 60,
+      "group": "twr",
+      "name": "rangingPerSec1",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate2": {
+      "__class__": "LogTocElement",
+      "ident": 61,
+      "group": "twr",
+      "name": "rangingSuccessRate2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec2": {
+      "__class__": "LogTocElement",
+      "ident": 62,
+      "group": "twr",
+      "name": "rangingPerSec2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate3": {
+      "__class__": "LogTocElement",
+      "ident": 63,
+      "group": "twr",
+      "name": "rangingSuccessRate3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec3": {
+      "__class__": "LogTocElement",
+      "ident": 64,
+      "group": "twr",
+      "name": "rangingPerSec3",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate4": {
+      "__class__": "LogTocElement",
+      "ident": 65,
+      "group": "twr",
+      "name": "rangingSuccessRate4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec4": {
+      "__class__": "LogTocElement",
+      "ident": 66,
+      "group": "twr",
+      "name": "rangingPerSec4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingSuccessRate5": {
+      "__class__": "LogTocElement",
+      "ident": 67,
+      "group": "twr",
+      "name": "rangingSuccessRate5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rangingPerSec5": {
+      "__class__": "LogTocElement",
+      "ident": 68,
+      "group": "twr",
+      "name": "rangingPerSec5",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "oa": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 69,
+      "group": "oa",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 70,
+      "group": "oa",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 71,
+      "group": "oa",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 72,
+      "group": "oa",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 73,
+      "group": "oa",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "usd": {
+    "spiWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 74,
+      "group": "usd",
+      "name": "spiWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "spiReBps": {
+      "__class__": "LogTocElement",
+      "ident": 75,
+      "group": "usd",
+      "name": "spiReBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "fatWrBps": {
+      "__class__": "LogTocElement",
+      "ident": 76,
+      "group": "usd",
+      "name": "fatWrBps",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "motor": {
+    "m1": {
+      "__class__": "LogTocElement",
+      "ident": 77,
+      "group": "motor",
+      "name": "m1",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m2": {
+      "__class__": "LogTocElement",
+      "ident": 78,
+      "group": "motor",
+      "name": "m2",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m3": {
+      "__class__": "LogTocElement",
+      "ident": 79,
+      "group": "motor",
+      "name": "m3",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m4": {
+      "__class__": "LogTocElement",
+      "ident": 80,
+      "group": "motor",
+      "name": "m4",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "m1req": {
+      "__class__": "LogTocElement",
+      "ident": 81,
+      "group": "motor",
+      "name": "m1req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m2req": {
+      "__class__": "LogTocElement",
+      "ident": 82,
+      "group": "motor",
+      "name": "m2req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m3req": {
+      "__class__": "LogTocElement",
+      "ident": 83,
+      "group": "motor",
+      "name": "m3req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    },
+    "m4req": {
+      "__class__": "LogTocElement",
+      "ident": 84,
+      "group": "motor",
+      "name": "m4req",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "pm": {
+    "vbat": {
+      "__class__": "LogTocElement",
+      "ident": 85,
+      "group": "pm",
+      "name": "vbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 86,
+      "group": "pm",
+      "name": "vbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extVbat": {
+      "__class__": "LogTocElement",
+      "ident": 87,
+      "group": "pm",
+      "name": "extVbat",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "extVbatMV": {
+      "__class__": "LogTocElement",
+      "ident": 88,
+      "group": "pm",
+      "name": "extVbatMV",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "extCurr": {
+      "__class__": "LogTocElement",
+      "ident": 89,
+      "group": "pm",
+      "name": "extCurr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "chargeCurrent": {
+      "__class__": "LogTocElement",
+      "ident": 90,
+      "group": "pm",
+      "name": "chargeCurrent",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "state": {
+      "__class__": "LogTocElement",
+      "ident": 91,
+      "group": "pm",
+      "name": "state",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "batteryLevel": {
+      "__class__": "LogTocElement",
+      "ident": 92,
+      "group": "pm",
+      "name": "batteryLevel",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "radio": {
+    "rssi": {
+      "__class__": "LogTocElement",
+      "ident": 93,
+      "group": "radio",
+      "name": "rssi",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isConnected": {
+      "__class__": "LogTocElement",
+      "ident": 94,
+      "group": "radio",
+      "name": "isConnected",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "gyro": {
+    "xRaw": {
+      "__class__": "LogTocElement",
+      "ident": 95,
+      "group": "gyro",
+      "name": "xRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "yRaw": {
+      "__class__": "LogTocElement",
+      "ident": 96,
+      "group": "gyro",
+      "name": "yRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "zRaw": {
+      "__class__": "LogTocElement",
+      "ident": 97,
+      "group": "gyro",
+      "name": "zRaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "xVariance": {
+      "__class__": "LogTocElement",
+      "ident": 98,
+      "group": "gyro",
+      "name": "xVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yVariance": {
+      "__class__": "LogTocElement",
+      "ident": 99,
+      "group": "gyro",
+      "name": "yVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVariance": {
+      "__class__": "LogTocElement",
+      "ident": 100,
+      "group": "gyro",
+      "name": "zVariance",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 101,
+      "group": "gyro",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 102,
+      "group": "gyro",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 103,
+      "group": "gyro",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "colAv": {
+    "latency": {
+      "__class__": "LogTocElement",
+      "ident": 104,
+      "group": "colAv",
+      "name": "latency",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "ext_pos": {
+    "X": {
+      "__class__": "LogTocElement",
+      "ident": 105,
+      "group": "ext_pos",
+      "name": "X",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Y": {
+      "__class__": "LogTocElement",
+      "ident": 106,
+      "group": "ext_pos",
+      "name": "Y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Z": {
+      "__class__": "LogTocElement",
+      "ident": 107,
+      "group": "ext_pos",
+      "name": "Z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrv": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 108,
+      "group": "locSrv",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 109,
+      "group": "locSrv",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 110,
+      "group": "locSrv",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 111,
+      "group": "locSrv",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 112,
+      "group": "locSrv",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 113,
+      "group": "locSrv",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 114,
+      "group": "locSrv",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "locSrvZ": {
+    "tick": {
+      "__class__": "LogTocElement",
+      "ident": 115,
+      "group": "locSrvZ",
+      "name": "tick",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "crtp": {
+    "rxRate": {
+      "__class__": "LogTocElement",
+      "ident": 116,
+      "group": "crtp",
+      "name": "rxRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "txRate": {
+      "__class__": "LogTocElement",
+      "ident": 117,
+      "group": "crtp",
+      "name": "txRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "extrx": {
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 118,
+      "group": "extrx",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 119,
+      "group": "extrx",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 120,
+      "group": "extrx",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 121,
+      "group": "extrx",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 122,
+      "group": "extrx",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 123,
+      "group": "extrx",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zVel": {
+      "__class__": "LogTocElement",
+      "ident": 124,
+      "group": "extrx",
+      "name": "zVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "AltHold": {
+      "__class__": "LogTocElement",
+      "ident": 125,
+      "group": "extrx",
+      "name": "AltHold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "Arm": {
+      "__class__": "LogTocElement",
+      "ident": 126,
+      "group": "extrx",
+      "name": "Arm",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "extrx_raw": {
+    "ch0": {
+      "__class__": "LogTocElement",
+      "ident": 127,
+      "group": "extrx_raw",
+      "name": "ch0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch1": {
+      "__class__": "LogTocElement",
+      "ident": 128,
+      "group": "extrx_raw",
+      "name": "ch1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch2": {
+      "__class__": "LogTocElement",
+      "ident": 129,
+      "group": "extrx_raw",
+      "name": "ch2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch3": {
+      "__class__": "LogTocElement",
+      "ident": 130,
+      "group": "extrx_raw",
+      "name": "ch3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch4": {
+      "__class__": "LogTocElement",
+      "ident": 131,
+      "group": "extrx_raw",
+      "name": "ch4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch5": {
+      "__class__": "LogTocElement",
+      "ident": 132,
+      "group": "extrx_raw",
+      "name": "ch5",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch6": {
+      "__class__": "LogTocElement",
+      "ident": 133,
+      "group": "extrx_raw",
+      "name": "ch6",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "ch7": {
+      "__class__": "LogTocElement",
+      "ident": 134,
+      "group": "extrx_raw",
+      "name": "ch7",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "health": {
+    "motorVarXM1": {
+      "__class__": "LogTocElement",
+      "ident": 135,
+      "group": "health",
+      "name": "motorVarXM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM1": {
+      "__class__": "LogTocElement",
+      "ident": 136,
+      "group": "health",
+      "name": "motorVarYM1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM2": {
+      "__class__": "LogTocElement",
+      "ident": 137,
+      "group": "health",
+      "name": "motorVarXM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM2": {
+      "__class__": "LogTocElement",
+      "ident": 138,
+      "group": "health",
+      "name": "motorVarYM2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM3": {
+      "__class__": "LogTocElement",
+      "ident": 139,
+      "group": "health",
+      "name": "motorVarXM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM3": {
+      "__class__": "LogTocElement",
+      "ident": 140,
+      "group": "health",
+      "name": "motorVarYM3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarXM4": {
+      "__class__": "LogTocElement",
+      "ident": 141,
+      "group": "health",
+      "name": "motorVarXM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorVarYM4": {
+      "__class__": "LogTocElement",
+      "ident": 142,
+      "group": "health",
+      "name": "motorVarYM4",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "motorPass": {
+      "__class__": "LogTocElement",
+      "ident": 143,
+      "group": "health",
+      "name": "motorPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "batterySag": {
+      "__class__": "LogTocElement",
+      "ident": 144,
+      "group": "health",
+      "name": "batterySag",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "batteryPass": {
+      "__class__": "LogTocElement",
+      "ident": 145,
+      "group": "health",
+      "name": "batteryPass",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "motorTestCount": {
+      "__class__": "LogTocElement",
+      "ident": 146,
+      "group": "health",
+      "name": "motorTestCount",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "memTst": {
+    "errCntW": {
+      "__class__": "LogTocElement",
+      "ident": 147,
+      "group": "memTst",
+      "name": "errCntW",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "range": {
+    "front": {
+      "__class__": "LogTocElement",
+      "ident": 148,
+      "group": "range",
+      "name": "front",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "back": {
+      "__class__": "LogTocElement",
+      "ident": 149,
+      "group": "range",
+      "name": "back",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "up": {
+      "__class__": "LogTocElement",
+      "ident": 150,
+      "group": "range",
+      "name": "up",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "left": {
+      "__class__": "LogTocElement",
+      "ident": 151,
+      "group": "range",
+      "name": "left",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "right": {
+      "__class__": "LogTocElement",
+      "ident": 152,
+      "group": "range",
+      "name": "right",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "zrange": {
+      "__class__": "LogTocElement",
+      "ident": 153,
+      "group": "range",
+      "name": "zrange",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    }
+  },
+  "sensfusion6": {
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 154,
+      "group": "sensfusion6",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 155,
+      "group": "sensfusion6",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 156,
+      "group": "sensfusion6",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 157,
+      "group": "sensfusion6",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityX": {
+      "__class__": "LogTocElement",
+      "ident": 158,
+      "group": "sensfusion6",
+      "name": "gravityX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityY": {
+      "__class__": "LogTocElement",
+      "ident": 159,
+      "group": "sensfusion6",
+      "name": "gravityY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "gravityZ": {
+      "__class__": "LogTocElement",
+      "ident": 160,
+      "group": "sensfusion6",
+      "name": "gravityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accZbase": {
+      "__class__": "LogTocElement",
+      "ident": 161,
+      "group": "sensfusion6",
+      "name": "accZbase",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "isInit": {
+      "__class__": "LogTocElement",
+      "ident": 162,
+      "group": "sensfusion6",
+      "name": "isInit",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isCalibrated": {
+      "__class__": "LogTocElement",
+      "ident": 163,
+      "group": "sensfusion6",
+      "name": "isCalibrated",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  },
+  "acc": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 164,
+      "group": "acc",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 165,
+      "group": "acc",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 166,
+      "group": "acc",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "baro": {
+    "asl": {
+      "__class__": "LogTocElement",
+      "ident": 167,
+      "group": "baro",
+      "name": "asl",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "temp": {
+      "__class__": "LogTocElement",
+      "ident": 168,
+      "group": "baro",
+      "name": "temp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pressure": {
+      "__class__": "LogTocElement",
+      "ident": 169,
+      "group": "baro",
+      "name": "pressure",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "controller": {
+    "ctr_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 170,
+      "group": "controller",
+      "name": "ctr_yaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 171,
+      "group": "controller",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 172,
+      "group": "controller",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 173,
+      "group": "controller",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 174,
+      "group": "controller",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 175,
+      "group": "controller",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 176,
+      "group": "controller",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 177,
+      "group": "controller",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 178,
+      "group": "controller",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "actuatorThrust": {
+      "__class__": "LogTocElement",
+      "ident": 179,
+      "group": "controller",
+      "name": "actuatorThrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 180,
+      "group": "controller",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 181,
+      "group": "controller",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 182,
+      "group": "controller",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rollRate": {
+      "__class__": "LogTocElement",
+      "ident": 183,
+      "group": "controller",
+      "name": "rollRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitchRate": {
+      "__class__": "LogTocElement",
+      "ident": 184,
+      "group": "controller",
+      "name": "pitchRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yawRate": {
+      "__class__": "LogTocElement",
+      "ident": 185,
+      "group": "controller",
+      "name": "yawRate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltarget": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 186,
+      "group": "ctrltarget",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 187,
+      "group": "ctrltarget",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 188,
+      "group": "ctrltarget",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 189,
+      "group": "ctrltarget",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 190,
+      "group": "ctrltarget",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 191,
+      "group": "ctrltarget",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 192,
+      "group": "ctrltarget",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 193,
+      "group": "ctrltarget",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 194,
+      "group": "ctrltarget",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 195,
+      "group": "ctrltarget",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 196,
+      "group": "ctrltarget",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 197,
+      "group": "ctrltarget",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrltargetZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 198,
+      "group": "ctrltargetZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 199,
+      "group": "ctrltargetZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 200,
+      "group": "ctrltargetZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 201,
+      "group": "ctrltargetZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 202,
+      "group": "ctrltargetZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 203,
+      "group": "ctrltargetZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 204,
+      "group": "ctrltargetZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 205,
+      "group": "ctrltargetZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 206,
+      "group": "ctrltargetZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "mag": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 207,
+      "group": "mag",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 208,
+      "group": "mag",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 209,
+      "group": "mag",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stabilizer": {
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 210,
+      "group": "stabilizer",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 211,
+      "group": "stabilizer",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 212,
+      "group": "stabilizer",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "thrust": {
+      "__class__": "LogTocElement",
+      "ident": 213,
+      "group": "stabilizer",
+      "name": "thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtStab": {
+      "__class__": "LogTocElement",
+      "ident": 214,
+      "group": "stabilizer",
+      "name": "rtStab",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "intToOut": {
+      "__class__": "LogTocElement",
+      "ident": 215,
+      "group": "stabilizer",
+      "name": "intToOut",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    }
+  },
+  "stateEstimate": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 216,
+      "group": "stateEstimate",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 217,
+      "group": "stateEstimate",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 218,
+      "group": "stateEstimate",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 219,
+      "group": "stateEstimate",
+      "name": "vx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 220,
+      "group": "stateEstimate",
+      "name": "vy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 221,
+      "group": "stateEstimate",
+      "name": "vz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 222,
+      "group": "stateEstimate",
+      "name": "ax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 223,
+      "group": "stateEstimate",
+      "name": "ay",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 224,
+      "group": "stateEstimate",
+      "name": "az",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll": {
+      "__class__": "LogTocElement",
+      "ident": 225,
+      "group": "stateEstimate",
+      "name": "roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch": {
+      "__class__": "LogTocElement",
+      "ident": 226,
+      "group": "stateEstimate",
+      "name": "pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw": {
+      "__class__": "LogTocElement",
+      "ident": 227,
+      "group": "stateEstimate",
+      "name": "yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qx": {
+      "__class__": "LogTocElement",
+      "ident": 228,
+      "group": "stateEstimate",
+      "name": "qx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qy": {
+      "__class__": "LogTocElement",
+      "ident": 229,
+      "group": "stateEstimate",
+      "name": "qy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qz": {
+      "__class__": "LogTocElement",
+      "ident": 230,
+      "group": "stateEstimate",
+      "name": "qz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "qw": {
+      "__class__": "LogTocElement",
+      "ident": 231,
+      "group": "stateEstimate",
+      "name": "qw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "stateEstimateZ": {
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 232,
+      "group": "stateEstimateZ",
+      "name": "x",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 233,
+      "group": "stateEstimateZ",
+      "name": "y",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 234,
+      "group": "stateEstimateZ",
+      "name": "z",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vx": {
+      "__class__": "LogTocElement",
+      "ident": 235,
+      "group": "stateEstimateZ",
+      "name": "vx",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vy": {
+      "__class__": "LogTocElement",
+      "ident": 236,
+      "group": "stateEstimateZ",
+      "name": "vy",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "vz": {
+      "__class__": "LogTocElement",
+      "ident": 237,
+      "group": "stateEstimateZ",
+      "name": "vz",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ax": {
+      "__class__": "LogTocElement",
+      "ident": 238,
+      "group": "stateEstimateZ",
+      "name": "ax",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ay": {
+      "__class__": "LogTocElement",
+      "ident": 239,
+      "group": "stateEstimateZ",
+      "name": "ay",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "az": {
+      "__class__": "LogTocElement",
+      "ident": 240,
+      "group": "stateEstimateZ",
+      "name": "az",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "quat": {
+      "__class__": "LogTocElement",
+      "ident": 241,
+      "group": "stateEstimateZ",
+      "name": "quat",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0
+    },
+    "rateRoll": {
+      "__class__": "LogTocElement",
+      "ident": 242,
+      "group": "stateEstimateZ",
+      "name": "rateRoll",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "ratePitch": {
+      "__class__": "LogTocElement",
+      "ident": 243,
+      "group": "stateEstimateZ",
+      "name": "ratePitch",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    },
+    "rateYaw": {
+      "__class__": "LogTocElement",
+      "ident": 244,
+      "group": "stateEstimateZ",
+      "name": "rateYaw",
+      "ctype": "int16_t",
+      "pytype": "<h",
+      "access": 0
+    }
+  },
+  "sys": {
+    "canfly": {
+      "__class__": "LogTocElement",
+      "ident": 245,
+      "group": "sys",
+      "name": "canfly",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isFlying": {
+      "__class__": "LogTocElement",
+      "ident": 246,
+      "group": "sys",
+      "name": "isFlying",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "isTumbled": {
+      "__class__": "LogTocElement",
+      "ident": 247,
+      "group": "sys",
+      "name": "isTumbled",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "armed": {
+      "__class__": "LogTocElement",
+      "ident": 248,
+      "group": "sys",
+      "name": "armed",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    },
+    "testLogParam": {
+      "__class__": "LogTocElement",
+      "ident": 249,
+      "group": "sys",
+      "name": "testLogParam",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0
+    }
+  },
+  "tdoaEngine": {
+    "stRx": {
+      "__class__": "LogTocElement",
+      "ident": 250,
+      "group": "tdoaEngine",
+      "name": "stRx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stEst": {
+      "__class__": "LogTocElement",
+      "ident": 251,
+      "group": "tdoaEngine",
+      "name": "stEst",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stTime": {
+      "__class__": "LogTocElement",
+      "ident": 252,
+      "group": "tdoaEngine",
+      "name": "stTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stFound": {
+      "__class__": "LogTocElement",
+      "ident": 253,
+      "group": "tdoaEngine",
+      "name": "stFound",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stCc": {
+      "__class__": "LogTocElement",
+      "ident": 254,
+      "group": "tdoaEngine",
+      "name": "stCc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stHit": {
+      "__class__": "LogTocElement",
+      "ident": 255,
+      "group": "tdoaEngine",
+      "name": "stHit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stMiss": {
+      "__class__": "LogTocElement",
+      "ident": 256,
+      "group": "tdoaEngine",
+      "name": "stMiss",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cc": {
+      "__class__": "LogTocElement",
+      "ident": 257,
+      "group": "tdoaEngine",
+      "name": "cc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "tof": {
+      "__class__": "LogTocElement",
+      "ident": 258,
+      "group": "tdoaEngine",
+      "name": "tof",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "tdoa": {
+      "__class__": "LogTocElement",
+      "ident": 259,
+      "group": "tdoaEngine",
+      "name": "tdoa",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman_pred": {
+    "predNX": {
+      "__class__": "LogTocElement",
+      "ident": 260,
+      "group": "kalman_pred",
+      "name": "predNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "predNY": {
+      "__class__": "LogTocElement",
+      "ident": 261,
+      "group": "kalman_pred",
+      "name": "predNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNX": {
+      "__class__": "LogTocElement",
+      "ident": 262,
+      "group": "kalman_pred",
+      "name": "measNX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "measNY": {
+      "__class__": "LogTocElement",
+      "ident": 263,
+      "group": "kalman_pred",
+      "name": "measNY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "lighthouse": {
+    "validAngles": {
+      "__class__": "LogTocElement",
+      "ident": 264,
+      "group": "lighthouse",
+      "name": "validAngles",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "rawAngle0x": {
+      "__class__": "LogTocElement",
+      "ident": 265,
+      "group": "lighthouse",
+      "name": "rawAngle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0y": {
+      "__class__": "LogTocElement",
+      "ident": 266,
+      "group": "lighthouse",
+      "name": "rawAngle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1x": {
+      "__class__": "LogTocElement",
+      "ident": 267,
+      "group": "lighthouse",
+      "name": "rawAngle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1y": {
+      "__class__": "LogTocElement",
+      "ident": 268,
+      "group": "lighthouse",
+      "name": "rawAngle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x": {
+      "__class__": "LogTocElement",
+      "ident": 269,
+      "group": "lighthouse",
+      "name": "angle0x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y": {
+      "__class__": "LogTocElement",
+      "ident": 270,
+      "group": "lighthouse",
+      "name": "angle0y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x": {
+      "__class__": "LogTocElement",
+      "ident": 271,
+      "group": "lighthouse",
+      "name": "angle1x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y": {
+      "__class__": "LogTocElement",
+      "ident": 272,
+      "group": "lighthouse",
+      "name": "angle1y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_1": {
+      "__class__": "LogTocElement",
+      "ident": 273,
+      "group": "lighthouse",
+      "name": "angle0x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_1": {
+      "__class__": "LogTocElement",
+      "ident": 274,
+      "group": "lighthouse",
+      "name": "angle0y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_1": {
+      "__class__": "LogTocElement",
+      "ident": 275,
+      "group": "lighthouse",
+      "name": "angle1x_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_1": {
+      "__class__": "LogTocElement",
+      "ident": 276,
+      "group": "lighthouse",
+      "name": "angle1y_1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_2": {
+      "__class__": "LogTocElement",
+      "ident": 277,
+      "group": "lighthouse",
+      "name": "angle0x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_2": {
+      "__class__": "LogTocElement",
+      "ident": 278,
+      "group": "lighthouse",
+      "name": "angle0y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_2": {
+      "__class__": "LogTocElement",
+      "ident": 279,
+      "group": "lighthouse",
+      "name": "angle1x_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_2": {
+      "__class__": "LogTocElement",
+      "ident": 280,
+      "group": "lighthouse",
+      "name": "angle1y_2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_3": {
+      "__class__": "LogTocElement",
+      "ident": 281,
+      "group": "lighthouse",
+      "name": "angle0x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_3": {
+      "__class__": "LogTocElement",
+      "ident": 282,
+      "group": "lighthouse",
+      "name": "angle0y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_3": {
+      "__class__": "LogTocElement",
+      "ident": 283,
+      "group": "lighthouse",
+      "name": "angle1x_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_3": {
+      "__class__": "LogTocElement",
+      "ident": 284,
+      "group": "lighthouse",
+      "name": "angle1y_3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 285,
+      "group": "lighthouse",
+      "name": "rawAngle0xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle0ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 286,
+      "group": "lighthouse",
+      "name": "rawAngle0ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1xlh2": {
+      "__class__": "LogTocElement",
+      "ident": 287,
+      "group": "lighthouse",
+      "name": "rawAngle1xlh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rawAngle1ylh2": {
+      "__class__": "LogTocElement",
+      "ident": 288,
+      "group": "lighthouse",
+      "name": "rawAngle1ylh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 289,
+      "group": "lighthouse",
+      "name": "angle0x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle0y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 290,
+      "group": "lighthouse",
+      "name": "angle0y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1x_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 291,
+      "group": "lighthouse",
+      "name": "angle1x_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angle1y_0lh2": {
+      "__class__": "LogTocElement",
+      "ident": 292,
+      "group": "lighthouse",
+      "name": "angle1y_0lh2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "width0": {
+      "__class__": "LogTocElement",
+      "ident": 293,
+      "group": "lighthouse",
+      "name": "width0",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width1": {
+      "__class__": "LogTocElement",
+      "ident": 294,
+      "group": "lighthouse",
+      "name": "width1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width2": {
+      "__class__": "LogTocElement",
+      "ident": 295,
+      "group": "lighthouse",
+      "name": "width2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "width3": {
+      "__class__": "LogTocElement",
+      "ident": 296,
+      "group": "lighthouse",
+      "name": "width3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "comSync": {
+      "__class__": "LogTocElement",
+      "ident": 297,
+      "group": "lighthouse",
+      "name": "comSync",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "bsAvailable": {
+      "__class__": "LogTocElement",
+      "ident": 298,
+      "group": "lighthouse",
+      "name": "bsAvailable",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsReceive": {
+      "__class__": "LogTocElement",
+      "ident": 299,
+      "group": "lighthouse",
+      "name": "bsReceive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsActive": {
+      "__class__": "LogTocElement",
+      "ident": 300,
+      "group": "lighthouse",
+      "name": "bsActive",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalUd": {
+      "__class__": "LogTocElement",
+      "ident": 301,
+      "group": "lighthouse",
+      "name": "bsCalUd",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalCon": {
+      "__class__": "LogTocElement",
+      "ident": 302,
+      "group": "lighthouse",
+      "name": "bsCalCon",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "status": {
+      "__class__": "LogTocElement",
+      "ident": 303,
+      "group": "lighthouse",
+      "name": "status",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "posRt": {
+      "__class__": "LogTocElement",
+      "ident": 304,
+      "group": "lighthouse",
+      "name": "posRt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs0Rt": {
+      "__class__": "LogTocElement",
+      "ident": 305,
+      "group": "lighthouse",
+      "name": "estBs0Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estBs1Rt": {
+      "__class__": "LogTocElement",
+      "ident": 306,
+      "group": "lighthouse",
+      "name": "estBs1Rt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "x": {
+      "__class__": "LogTocElement",
+      "ident": 307,
+      "group": "lighthouse",
+      "name": "x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "y": {
+      "__class__": "LogTocElement",
+      "ident": 308,
+      "group": "lighthouse",
+      "name": "y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "z": {
+      "__class__": "LogTocElement",
+      "ident": 309,
+      "group": "lighthouse",
+      "name": "z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "delta": {
+      "__class__": "LogTocElement",
+      "ident": 310,
+      "group": "lighthouse",
+      "name": "delta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bsGeoVal": {
+      "__class__": "LogTocElement",
+      "ident": 311,
+      "group": "lighthouse",
+      "name": "bsGeoVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "bsCalVal": {
+      "__class__": "LogTocElement",
+      "ident": 312,
+      "group": "lighthouse",
+      "name": "bsCalVal",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0
+    },
+    "disProb": {
+      "__class__": "LogTocElement",
+      "ident": 313,
+      "group": "lighthouse",
+      "name": "disProb",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_attitude": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 314,
+      "group": "pid_attitude",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 315,
+      "group": "pid_attitude",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 316,
+      "group": "pid_attitude",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 317,
+      "group": "pid_attitude",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 318,
+      "group": "pid_attitude",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 319,
+      "group": "pid_attitude",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 320,
+      "group": "pid_attitude",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 321,
+      "group": "pid_attitude",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 322,
+      "group": "pid_attitude",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 323,
+      "group": "pid_attitude",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 324,
+      "group": "pid_attitude",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 325,
+      "group": "pid_attitude",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "pid_rate": {
+    "roll_outP": {
+      "__class__": "LogTocElement",
+      "ident": 326,
+      "group": "pid_rate",
+      "name": "roll_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outI": {
+      "__class__": "LogTocElement",
+      "ident": 327,
+      "group": "pid_rate",
+      "name": "roll_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outD": {
+      "__class__": "LogTocElement",
+      "ident": 328,
+      "group": "pid_rate",
+      "name": "roll_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "roll_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 329,
+      "group": "pid_rate",
+      "name": "roll_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outP": {
+      "__class__": "LogTocElement",
+      "ident": 330,
+      "group": "pid_rate",
+      "name": "pitch_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outI": {
+      "__class__": "LogTocElement",
+      "ident": 331,
+      "group": "pid_rate",
+      "name": "pitch_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outD": {
+      "__class__": "LogTocElement",
+      "ident": 332,
+      "group": "pid_rate",
+      "name": "pitch_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "pitch_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 333,
+      "group": "pid_rate",
+      "name": "pitch_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outP": {
+      "__class__": "LogTocElement",
+      "ident": 334,
+      "group": "pid_rate",
+      "name": "yaw_outP",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outI": {
+      "__class__": "LogTocElement",
+      "ident": 335,
+      "group": "pid_rate",
+      "name": "yaw_outI",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outD": {
+      "__class__": "LogTocElement",
+      "ident": 336,
+      "group": "pid_rate",
+      "name": "yaw_outD",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "yaw_outFF": {
+      "__class__": "LogTocElement",
+      "ident": 337,
+      "group": "pid_rate",
+      "name": "yaw_outFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlINDI": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 338,
+      "group": "ctrlINDI",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 339,
+      "group": "ctrlINDI",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 340,
+      "group": "ctrlINDI",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 341,
+      "group": "ctrlINDI",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 342,
+      "group": "ctrlINDI",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 343,
+      "group": "ctrlINDI",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 344,
+      "group": "ctrlINDI",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_p": {
+      "__class__": "LogTocElement",
+      "ident": 345,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_q": {
+      "__class__": "LogTocElement",
+      "ident": 346,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "u_act_dyn_r": {
+      "__class__": "LogTocElement",
+      "ident": 347,
+      "group": "ctrlINDI",
+      "name": "u_act_dyn_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_p": {
+      "__class__": "LogTocElement",
+      "ident": 348,
+      "group": "ctrlINDI",
+      "name": "du_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_q": {
+      "__class__": "LogTocElement",
+      "ident": 349,
+      "group": "ctrlINDI",
+      "name": "du_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "du_r": {
+      "__class__": "LogTocElement",
+      "ident": 350,
+      "group": "ctrlINDI",
+      "name": "du_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_p": {
+      "__class__": "LogTocElement",
+      "ident": 351,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_q": {
+      "__class__": "LogTocElement",
+      "ident": 352,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "ang_accel_ref_r": {
+      "__class__": "LogTocElement",
+      "ident": 353,
+      "group": "ctrlINDI",
+      "name": "ang_accel_ref_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[0]": {
+      "__class__": "LogTocElement",
+      "ident": 354,
+      "group": "ctrlINDI",
+      "name": "rate_d[0]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[1]": {
+      "__class__": "LogTocElement",
+      "ident": 355,
+      "group": "ctrlINDI",
+      "name": "rate_d[1]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rate_d[2]": {
+      "__class__": "LogTocElement",
+      "ident": 356,
+      "group": "ctrlINDI",
+      "name": "rate_d[2]",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_p": {
+      "__class__": "LogTocElement",
+      "ident": 357,
+      "group": "ctrlINDI",
+      "name": "uf_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_q": {
+      "__class__": "LogTocElement",
+      "ident": 358,
+      "group": "ctrlINDI",
+      "name": "uf_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "uf_r": {
+      "__class__": "LogTocElement",
+      "ident": 359,
+      "group": "ctrlINDI",
+      "name": "uf_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_p": {
+      "__class__": "LogTocElement",
+      "ident": 360,
+      "group": "ctrlINDI",
+      "name": "Omega_f_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_q": {
+      "__class__": "LogTocElement",
+      "ident": 361,
+      "group": "ctrlINDI",
+      "name": "Omega_f_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Omega_f_r": {
+      "__class__": "LogTocElement",
+      "ident": 362,
+      "group": "ctrlINDI",
+      "name": "Omega_f_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_p": {
+      "__class__": "LogTocElement",
+      "ident": 363,
+      "group": "ctrlINDI",
+      "name": "n_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_q": {
+      "__class__": "LogTocElement",
+      "ident": 364,
+      "group": "ctrlINDI",
+      "name": "n_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "n_r": {
+      "__class__": "LogTocElement",
+      "ident": 365,
+      "group": "ctrlINDI",
+      "name": "n_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "ctrlMel": {
+    "cmd_thrust": {
+      "__class__": "LogTocElement",
+      "ident": 366,
+      "group": "ctrlMel",
+      "name": "cmd_thrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_roll": {
+      "__class__": "LogTocElement",
+      "ident": 367,
+      "group": "ctrlMel",
+      "name": "cmd_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 368,
+      "group": "ctrlMel",
+      "name": "cmd_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 369,
+      "group": "ctrlMel",
+      "name": "cmd_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_roll": {
+      "__class__": "LogTocElement",
+      "ident": 370,
+      "group": "ctrlMel",
+      "name": "r_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 371,
+      "group": "ctrlMel",
+      "name": "r_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "r_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 372,
+      "group": "ctrlMel",
+      "name": "r_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accelz": {
+      "__class__": "LogTocElement",
+      "ident": 373,
+      "group": "ctrlMel",
+      "name": "accelz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdx": {
+      "__class__": "LogTocElement",
+      "ident": 374,
+      "group": "ctrlMel",
+      "name": "zdx",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdy": {
+      "__class__": "LogTocElement",
+      "ident": 375,
+      "group": "ctrlMel",
+      "name": "zdy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "zdz": {
+      "__class__": "LogTocElement",
+      "ident": 376,
+      "group": "ctrlMel",
+      "name": "zdz",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_x": {
+      "__class__": "LogTocElement",
+      "ident": 377,
+      "group": "ctrlMel",
+      "name": "i_err_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_y": {
+      "__class__": "LogTocElement",
+      "ident": 378,
+      "group": "ctrlMel",
+      "name": "i_err_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "i_err_z": {
+      "__class__": "LogTocElement",
+      "ident": 379,
+      "group": "ctrlMel",
+      "name": "i_err_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtrlIndi": {
+    "posRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 380,
+      "group": "posCtrlIndi",
+      "name": "posRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 381,
+      "group": "posCtrlIndi",
+      "name": "posRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "posRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 382,
+      "group": "posCtrlIndi",
+      "name": "posRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_x": {
+      "__class__": "LogTocElement",
+      "ident": 383,
+      "group": "posCtrlIndi",
+      "name": "velS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_y": {
+      "__class__": "LogTocElement",
+      "ident": 384,
+      "group": "posCtrlIndi",
+      "name": "velS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velS_z": {
+      "__class__": "LogTocElement",
+      "ident": 385,
+      "group": "posCtrlIndi",
+      "name": "velS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 386,
+      "group": "posCtrlIndi",
+      "name": "velRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 387,
+      "group": "posCtrlIndi",
+      "name": "velRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 388,
+      "group": "posCtrlIndi",
+      "name": "velRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_roll": {
+      "__class__": "LogTocElement",
+      "ident": 389,
+      "group": "posCtrlIndi",
+      "name": "angS_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 390,
+      "group": "posCtrlIndi",
+      "name": "angS_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angS_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 391,
+      "group": "posCtrlIndi",
+      "name": "angS_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_roll": {
+      "__class__": "LogTocElement",
+      "ident": 392,
+      "group": "posCtrlIndi",
+      "name": "angF_roll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_pitch": {
+      "__class__": "LogTocElement",
+      "ident": 393,
+      "group": "posCtrlIndi",
+      "name": "angF_pitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "angF_yaw": {
+      "__class__": "LogTocElement",
+      "ident": 394,
+      "group": "posCtrlIndi",
+      "name": "angF_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_x": {
+      "__class__": "LogTocElement",
+      "ident": 395,
+      "group": "posCtrlIndi",
+      "name": "accRef_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_y": {
+      "__class__": "LogTocElement",
+      "ident": 396,
+      "group": "posCtrlIndi",
+      "name": "accRef_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accRef_z": {
+      "__class__": "LogTocElement",
+      "ident": 397,
+      "group": "posCtrlIndi",
+      "name": "accRef_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_x": {
+      "__class__": "LogTocElement",
+      "ident": 398,
+      "group": "posCtrlIndi",
+      "name": "accS_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_y": {
+      "__class__": "LogTocElement",
+      "ident": 399,
+      "group": "posCtrlIndi",
+      "name": "accS_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accS_z": {
+      "__class__": "LogTocElement",
+      "ident": 400,
+      "group": "posCtrlIndi",
+      "name": "accS_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_x": {
+      "__class__": "LogTocElement",
+      "ident": 401,
+      "group": "posCtrlIndi",
+      "name": "accF_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_y": {
+      "__class__": "LogTocElement",
+      "ident": 402,
+      "group": "posCtrlIndi",
+      "name": "accF_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accF_z": {
+      "__class__": "LogTocElement",
+      "ident": 403,
+      "group": "posCtrlIndi",
+      "name": "accF_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_x": {
+      "__class__": "LogTocElement",
+      "ident": 404,
+      "group": "posCtrlIndi",
+      "name": "accFT_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_y": {
+      "__class__": "LogTocElement",
+      "ident": 405,
+      "group": "posCtrlIndi",
+      "name": "accFT_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accFT_z": {
+      "__class__": "LogTocElement",
+      "ident": 406,
+      "group": "posCtrlIndi",
+      "name": "accFT_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_x": {
+      "__class__": "LogTocElement",
+      "ident": 407,
+      "group": "posCtrlIndi",
+      "name": "accErr_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_y": {
+      "__class__": "LogTocElement",
+      "ident": 408,
+      "group": "posCtrlIndi",
+      "name": "accErr_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "accErr_z": {
+      "__class__": "LogTocElement",
+      "ident": 409,
+      "group": "posCtrlIndi",
+      "name": "accErr_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "phi_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 410,
+      "group": "posCtrlIndi",
+      "name": "phi_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "theta_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 411,
+      "group": "posCtrlIndi",
+      "name": "theta_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_tilde": {
+      "__class__": "LogTocElement",
+      "ident": 412,
+      "group": "posCtrlIndi",
+      "name": "T_tilde",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner": {
+      "__class__": "LogTocElement",
+      "ident": 413,
+      "group": "posCtrlIndi",
+      "name": "T_inner",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_inner_f": {
+      "__class__": "LogTocElement",
+      "ident": 414,
+      "group": "posCtrlIndi",
+      "name": "T_inner_f",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "T_incremented": {
+      "__class__": "LogTocElement",
+      "ident": 415,
+      "group": "posCtrlIndi",
+      "name": "T_incremented",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_phi": {
+      "__class__": "LogTocElement",
+      "ident": 416,
+      "group": "posCtrlIndi",
+      "name": "cmd_phi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "cmd_theta": {
+      "__class__": "LogTocElement",
+      "ident": 417,
+      "group": "posCtrlIndi",
+      "name": "cmd_theta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posCtl": {
+    "targetVX": {
+      "__class__": "LogTocElement",
+      "ident": 418,
+      "group": "posCtl",
+      "name": "targetVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVY": {
+      "__class__": "LogTocElement",
+      "ident": 419,
+      "group": "posCtl",
+      "name": "targetVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetVZ": {
+      "__class__": "LogTocElement",
+      "ident": 420,
+      "group": "posCtl",
+      "name": "targetVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetX": {
+      "__class__": "LogTocElement",
+      "ident": 421,
+      "group": "posCtl",
+      "name": "targetX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetY": {
+      "__class__": "LogTocElement",
+      "ident": 422,
+      "group": "posCtl",
+      "name": "targetY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "targetZ": {
+      "__class__": "LogTocElement",
+      "ident": 423,
+      "group": "posCtl",
+      "name": "targetZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVX": {
+      "__class__": "LogTocElement",
+      "ident": 424,
+      "group": "posCtl",
+      "name": "bodyVX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyVY": {
+      "__class__": "LogTocElement",
+      "ident": 425,
+      "group": "posCtl",
+      "name": "bodyVY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyX": {
+      "__class__": "LogTocElement",
+      "ident": 426,
+      "group": "posCtl",
+      "name": "bodyX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "bodyY": {
+      "__class__": "LogTocElement",
+      "ident": 427,
+      "group": "posCtl",
+      "name": "bodyY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xp": {
+      "__class__": "LogTocElement",
+      "ident": 428,
+      "group": "posCtl",
+      "name": "Xp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xi": {
+      "__class__": "LogTocElement",
+      "ident": 429,
+      "group": "posCtl",
+      "name": "Xi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xd": {
+      "__class__": "LogTocElement",
+      "ident": 430,
+      "group": "posCtl",
+      "name": "Xd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Xff": {
+      "__class__": "LogTocElement",
+      "ident": 431,
+      "group": "posCtl",
+      "name": "Xff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yp": {
+      "__class__": "LogTocElement",
+      "ident": 432,
+      "group": "posCtl",
+      "name": "Yp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yi": {
+      "__class__": "LogTocElement",
+      "ident": 433,
+      "group": "posCtl",
+      "name": "Yi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yd": {
+      "__class__": "LogTocElement",
+      "ident": 434,
+      "group": "posCtl",
+      "name": "Yd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Yff": {
+      "__class__": "LogTocElement",
+      "ident": 435,
+      "group": "posCtl",
+      "name": "Yff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zp": {
+      "__class__": "LogTocElement",
+      "ident": 436,
+      "group": "posCtl",
+      "name": "Zp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zi": {
+      "__class__": "LogTocElement",
+      "ident": 437,
+      "group": "posCtl",
+      "name": "Zi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zd": {
+      "__class__": "LogTocElement",
+      "ident": 438,
+      "group": "posCtl",
+      "name": "Zd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "Zff": {
+      "__class__": "LogTocElement",
+      "ident": 439,
+      "group": "posCtl",
+      "name": "Zff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXp": {
+      "__class__": "LogTocElement",
+      "ident": 440,
+      "group": "posCtl",
+      "name": "VXp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXi": {
+      "__class__": "LogTocElement",
+      "ident": 441,
+      "group": "posCtl",
+      "name": "VXi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXd": {
+      "__class__": "LogTocElement",
+      "ident": 442,
+      "group": "posCtl",
+      "name": "VXd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VXff": {
+      "__class__": "LogTocElement",
+      "ident": 443,
+      "group": "posCtl",
+      "name": "VXff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYp": {
+      "__class__": "LogTocElement",
+      "ident": 444,
+      "group": "posCtl",
+      "name": "VYp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYi": {
+      "__class__": "LogTocElement",
+      "ident": 445,
+      "group": "posCtl",
+      "name": "VYi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYd": {
+      "__class__": "LogTocElement",
+      "ident": 446,
+      "group": "posCtl",
+      "name": "VYd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VYff": {
+      "__class__": "LogTocElement",
+      "ident": 447,
+      "group": "posCtl",
+      "name": "VYff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZp": {
+      "__class__": "LogTocElement",
+      "ident": 448,
+      "group": "posCtl",
+      "name": "VZp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZi": {
+      "__class__": "LogTocElement",
+      "ident": 449,
+      "group": "posCtl",
+      "name": "VZi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZd": {
+      "__class__": "LogTocElement",
+      "ident": 450,
+      "group": "posCtl",
+      "name": "VZd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "VZff": {
+      "__class__": "LogTocElement",
+      "ident": 451,
+      "group": "posCtl",
+      "name": "VZff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "kalman": {
+    "stateX": {
+      "__class__": "LogTocElement",
+      "ident": 452,
+      "group": "kalman",
+      "name": "stateX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateY": {
+      "__class__": "LogTocElement",
+      "ident": 453,
+      "group": "kalman",
+      "name": "stateY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateZ": {
+      "__class__": "LogTocElement",
+      "ident": 454,
+      "group": "kalman",
+      "name": "stateZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePX": {
+      "__class__": "LogTocElement",
+      "ident": 455,
+      "group": "kalman",
+      "name": "statePX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePY": {
+      "__class__": "LogTocElement",
+      "ident": 456,
+      "group": "kalman",
+      "name": "statePY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "statePZ": {
+      "__class__": "LogTocElement",
+      "ident": 457,
+      "group": "kalman",
+      "name": "statePZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD0": {
+      "__class__": "LogTocElement",
+      "ident": 458,
+      "group": "kalman",
+      "name": "stateD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD1": {
+      "__class__": "LogTocElement",
+      "ident": 459,
+      "group": "kalman",
+      "name": "stateD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "stateD2": {
+      "__class__": "LogTocElement",
+      "ident": 460,
+      "group": "kalman",
+      "name": "stateD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varX": {
+      "__class__": "LogTocElement",
+      "ident": 461,
+      "group": "kalman",
+      "name": "varX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varY": {
+      "__class__": "LogTocElement",
+      "ident": 462,
+      "group": "kalman",
+      "name": "varY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varZ": {
+      "__class__": "LogTocElement",
+      "ident": 463,
+      "group": "kalman",
+      "name": "varZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPX": {
+      "__class__": "LogTocElement",
+      "ident": 464,
+      "group": "kalman",
+      "name": "varPX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPY": {
+      "__class__": "LogTocElement",
+      "ident": 465,
+      "group": "kalman",
+      "name": "varPY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varPZ": {
+      "__class__": "LogTocElement",
+      "ident": 466,
+      "group": "kalman",
+      "name": "varPZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD0": {
+      "__class__": "LogTocElement",
+      "ident": 467,
+      "group": "kalman",
+      "name": "varD0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD1": {
+      "__class__": "LogTocElement",
+      "ident": 468,
+      "group": "kalman",
+      "name": "varD1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "varD2": {
+      "__class__": "LogTocElement",
+      "ident": 469,
+      "group": "kalman",
+      "name": "varD2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q0": {
+      "__class__": "LogTocElement",
+      "ident": 470,
+      "group": "kalman",
+      "name": "q0",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q1": {
+      "__class__": "LogTocElement",
+      "ident": 471,
+      "group": "kalman",
+      "name": "q1",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q2": {
+      "__class__": "LogTocElement",
+      "ident": 472,
+      "group": "kalman",
+      "name": "q2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "q3": {
+      "__class__": "LogTocElement",
+      "ident": 473,
+      "group": "kalman",
+      "name": "q3",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtUpdate": {
+      "__class__": "LogTocElement",
+      "ident": 474,
+      "group": "kalman",
+      "name": "rtUpdate",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtPred": {
+      "__class__": "LogTocElement",
+      "ident": 475,
+      "group": "kalman",
+      "name": "rtPred",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtFinal": {
+      "__class__": "LogTocElement",
+      "ident": 476,
+      "group": "kalman",
+      "name": "rtFinal",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "outlierf": {
+    "lhWin": {
+      "__class__": "LogTocElement",
+      "ident": 477,
+      "group": "outlierf",
+      "name": "lhWin",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0
+    }
+  },
+  "estimator": {
+    "rtApnd": {
+      "__class__": "LogTocElement",
+      "ident": 478,
+      "group": "estimator",
+      "name": "rtApnd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "rtRej": {
+      "__class__": "LogTocElement",
+      "ident": 479,
+      "group": "estimator",
+      "name": "rtRej",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "posEstAlt": {
+    "estimatedZ": {
+      "__class__": "LogTocElement",
+      "ident": 480,
+      "group": "posEstAlt",
+      "name": "estimatedZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "estVZ": {
+      "__class__": "LogTocElement",
+      "ident": 481,
+      "group": "posEstAlt",
+      "name": "estVZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    },
+    "velocityZ": {
+      "__class__": "LogTocElement",
+      "ident": 482,
+      "group": "posEstAlt",
+      "name": "velocityZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0
+    }
+  },
+  "DTR_P2P": {
+    "rx_state": {
+      "__class__": "LogTocElement",
+      "ident": 483,
+      "group": "DTR_P2P",
+      "name": "rx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    },
+    "tx_state": {
+      "__class__": "LogTocElement",
+      "ident": 484,
+      "group": "DTR_P2P",
+      "name": "tx_state",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0
+    }
+  }
+}
\ No newline at end of file
diff --git c/src/webots_pkg/test/software/cache/9FA714B3.json i/src/webots_pkg/test/software/cache/9FA714B3.json
new file mode 100644
index 0000000..3c86bf4
--- /dev/null
+++ i/src/webots_pkg/test/software/cache/9FA714B3.json
@@ -0,0 +1,2862 @@
+{
+  "activeMarker": {
+    "front": {
+      "__class__": "ParamTocElement",
+      "ident": 0,
+      "group": "activeMarker",
+      "name": "front",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "back": {
+      "__class__": "ParamTocElement",
+      "ident": 1,
+      "group": "activeMarker",
+      "name": "back",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "left": {
+      "__class__": "ParamTocElement",
+      "ident": 2,
+      "group": "activeMarker",
+      "name": "left",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "right": {
+      "__class__": "ParamTocElement",
+      "ident": 3,
+      "group": "activeMarker",
+      "name": "right",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "mode": {
+      "__class__": "ParamTocElement",
+      "ident": 4,
+      "group": "activeMarker",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "poll": {
+      "__class__": "ParamTocElement",
+      "ident": 5,
+      "group": "activeMarker",
+      "name": "poll",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "deck": {
+    "bcActiveMarker": {
+      "__class__": "ParamTocElement",
+      "ident": 6,
+      "group": "deck",
+      "name": "bcActiveMarker",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcAI": {
+      "__class__": "ParamTocElement",
+      "ident": 7,
+      "group": "deck",
+      "name": "bcAI",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcBuzzer": {
+      "__class__": "ParamTocElement",
+      "ident": 8,
+      "group": "deck",
+      "name": "bcBuzzer",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcFlow": {
+      "__class__": "ParamTocElement",
+      "ident": 9,
+      "group": "deck",
+      "name": "bcFlow",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcFlow2": {
+      "__class__": "ParamTocElement",
+      "ident": 10,
+      "group": "deck",
+      "name": "bcFlow2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLedRing": {
+      "__class__": "ParamTocElement",
+      "ident": 11,
+      "group": "deck",
+      "name": "bcLedRing",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLighthouse4": {
+      "__class__": "ParamTocElement",
+      "ident": 12,
+      "group": "deck",
+      "name": "bcLighthouse4",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcDWM1000": {
+      "__class__": "ParamTocElement",
+      "ident": 13,
+      "group": "deck",
+      "name": "bcDWM1000",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcLoco": {
+      "__class__": "ParamTocElement",
+      "ident": 14,
+      "group": "deck",
+      "name": "bcLoco",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcMultiranger": {
+      "__class__": "ParamTocElement",
+      "ident": 15,
+      "group": "deck",
+      "name": "bcMultiranger",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcOA": {
+      "__class__": "ParamTocElement",
+      "ident": 16,
+      "group": "deck",
+      "name": "bcOA",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcUSD": {
+      "__class__": "ParamTocElement",
+      "ident": 17,
+      "group": "deck",
+      "name": "bcUSD",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcZRanger": {
+      "__class__": "ParamTocElement",
+      "ident": 18,
+      "group": "deck",
+      "name": "bcZRanger",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "bcZRanger2": {
+      "__class__": "ParamTocElement",
+      "ident": 19,
+      "group": "deck",
+      "name": "bcZRanger2",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "motion": {
+    "disable": {
+      "__class__": "ParamTocElement",
+      "ident": 20,
+      "group": "motion",
+      "name": "disable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "adaptive": {
+      "__class__": "ParamTocElement",
+      "ident": 21,
+      "group": "motion",
+      "name": "adaptive",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "flowStdFixed": {
+      "__class__": "ParamTocElement",
+      "ident": 22,
+      "group": "motion",
+      "name": "flowStdFixed",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "ring": {
+    "effect": {
+      "__class__": "ParamTocElement",
+      "ident": 23,
+      "group": "ring",
+      "name": "effect",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "neffect": {
+      "__class__": "ParamTocElement",
+      "ident": 24,
+      "group": "ring",
+      "name": "neffect",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "solidRed": {
+      "__class__": "ParamTocElement",
+      "ident": 25,
+      "group": "ring",
+      "name": "solidRed",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "solidGreen": {
+      "__class__": "ParamTocElement",
+      "ident": 26,
+      "group": "ring",
+      "name": "solidGreen",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "solidBlue": {
+      "__class__": "ParamTocElement",
+      "ident": 27,
+      "group": "ring",
+      "name": "solidBlue",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "headlightEnable": {
+      "__class__": "ParamTocElement",
+      "ident": 28,
+      "group": "ring",
+      "name": "headlightEnable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "emptyCharge": {
+      "__class__": "ParamTocElement",
+      "ident": 29,
+      "group": "ring",
+      "name": "emptyCharge",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "fullCharge": {
+      "__class__": "ParamTocElement",
+      "ident": 30,
+      "group": "ring",
+      "name": "fullCharge",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "fadeColor": {
+      "__class__": "ParamTocElement",
+      "ident": 31,
+      "group": "ring",
+      "name": "fadeColor",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0,
+      "extended": false
+    },
+    "fadeTime": {
+      "__class__": "ParamTocElement",
+      "ident": 32,
+      "group": "ring",
+      "name": "fadeTime",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "system": {
+    "highlight": {
+      "__class__": "ParamTocElement",
+      "ident": 33,
+      "group": "system",
+      "name": "highlight",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "storageStats": {
+      "__class__": "ParamTocElement",
+      "ident": 34,
+      "group": "system",
+      "name": "storageStats",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "storageReformat": {
+      "__class__": "ParamTocElement",
+      "ident": 35,
+      "group": "system",
+      "name": "storageReformat",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "taskDump": {
+      "__class__": "ParamTocElement",
+      "ident": 36,
+      "group": "system",
+      "name": "taskDump",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "selftestPassed": {
+      "__class__": "ParamTocElement",
+      "ident": 37,
+      "group": "system",
+      "name": "selftestPassed",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 1,
+      "extended": false
+    },
+    "forceArm": {
+      "__class__": "ParamTocElement",
+      "ident": 38,
+      "group": "system",
+      "name": "forceArm",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "assertInfo": {
+      "__class__": "ParamTocElement",
+      "ident": 39,
+      "group": "system",
+      "name": "assertInfo",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "testLogParam": {
+      "__class__": "ParamTocElement",
+      "ident": 40,
+      "group": "system",
+      "name": "testLogParam",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "loco": {
+    "mode": {
+      "__class__": "ParamTocElement",
+      "ident": 41,
+      "group": "loco",
+      "name": "mode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "tdoa2": {
+    "stddev": {
+      "__class__": "ParamTocElement",
+      "ident": 42,
+      "group": "tdoa2",
+      "name": "stddev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "tdoa3": {
+    "stddev": {
+      "__class__": "ParamTocElement",
+      "ident": 43,
+      "group": "tdoa3",
+      "name": "stddev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "multiranger": {
+    "filterMask": {
+      "__class__": "ParamTocElement",
+      "ident": 44,
+      "group": "multiranger",
+      "name": "filterMask",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "usd": {
+    "canLog": {
+      "__class__": "ParamTocElement",
+      "ident": 45,
+      "group": "usd",
+      "name": "canLog",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "logging": {
+      "__class__": "ParamTocElement",
+      "ident": 46,
+      "group": "usd",
+      "name": "logging",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "led": {
+    "bitmask": {
+      "__class__": "ParamTocElement",
+      "ident": 47,
+      "group": "led",
+      "name": "bitmask",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "motorPowerSet": {
+    "enable": {
+      "__class__": "ParamTocElement",
+      "ident": 48,
+      "group": "motorPowerSet",
+      "name": "enable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "m1": {
+      "__class__": "ParamTocElement",
+      "ident": 49,
+      "group": "motorPowerSet",
+      "name": "m1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m2": {
+      "__class__": "ParamTocElement",
+      "ident": 50,
+      "group": "motorPowerSet",
+      "name": "m2",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m3": {
+      "__class__": "ParamTocElement",
+      "ident": 51,
+      "group": "motorPowerSet",
+      "name": "m3",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    },
+    "m4": {
+      "__class__": "ParamTocElement",
+      "ident": 52,
+      "group": "motorPowerSet",
+      "name": "m4",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "pm": {
+    "lowVoltage": {
+      "__class__": "ParamTocElement",
+      "ident": 53,
+      "group": "pm",
+      "name": "lowVoltage",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "criticalLowVoltage": {
+      "__class__": "ParamTocElement",
+      "ident": 54,
+      "group": "pm",
+      "name": "criticalLowVoltage",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "imu_sensors": {
+    "BMP388": {
+      "__class__": "ParamTocElement",
+      "ident": 55,
+      "group": "imu_sensors",
+      "name": "BMP388",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "imuPhi": {
+      "__class__": "ParamTocElement",
+      "ident": 56,
+      "group": "imu_sensors",
+      "name": "imuPhi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuTheta": {
+      "__class__": "ParamTocElement",
+      "ident": 57,
+      "group": "imu_sensors",
+      "name": "imuTheta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuPsi": {
+      "__class__": "ParamTocElement",
+      "ident": 58,
+      "group": "imu_sensors",
+      "name": "imuPsi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "AK8963": {
+      "__class__": "ParamTocElement",
+      "ident": 59,
+      "group": "imu_sensors",
+      "name": "AK8963",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "LPS25H": {
+      "__class__": "ParamTocElement",
+      "ident": 60,
+      "group": "imu_sensors",
+      "name": "LPS25H",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "imu_tests": {
+    "MPU6500": {
+      "__class__": "ParamTocElement",
+      "ident": 61,
+      "group": "imu_tests",
+      "name": "MPU6500",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "AK8963": {
+      "__class__": "ParamTocElement",
+      "ident": 62,
+      "group": "imu_tests",
+      "name": "AK8963",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "LPS25H": {
+      "__class__": "ParamTocElement",
+      "ident": 63,
+      "group": "imu_tests",
+      "name": "LPS25H",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    },
+    "imuPhi": {
+      "__class__": "ParamTocElement",
+      "ident": 64,
+      "group": "imu_tests",
+      "name": "imuPhi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuTheta": {
+      "__class__": "ParamTocElement",
+      "ident": 65,
+      "group": "imu_tests",
+      "name": "imuTheta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "imuPsi": {
+      "__class__": "ParamTocElement",
+      "ident": 66,
+      "group": "imu_tests",
+      "name": "imuPsi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "syslink": {
+    "probe": {
+      "__class__": "ParamTocElement",
+      "ident": 67,
+      "group": "syslink",
+      "name": "probe",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "usec": {
+    "reset": {
+      "__class__": "ParamTocElement",
+      "ident": 68,
+      "group": "usec",
+      "name": "reset",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "colAv": {
+    "enable": {
+      "__class__": "ParamTocElement",
+      "ident": 69,
+      "group": "colAv",
+      "name": "enable",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidX": {
+      "__class__": "ParamTocElement",
+      "ident": 70,
+      "group": "colAv",
+      "name": "ellipsoidX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidY": {
+      "__class__": "ParamTocElement",
+      "ident": 71,
+      "group": "colAv",
+      "name": "ellipsoidY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ellipsoidZ": {
+      "__class__": "ParamTocElement",
+      "ident": 72,
+      "group": "colAv",
+      "name": "ellipsoidZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinX": {
+      "__class__": "ParamTocElement",
+      "ident": 73,
+      "group": "colAv",
+      "name": "bboxMinX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinY": {
+      "__class__": "ParamTocElement",
+      "ident": 74,
+      "group": "colAv",
+      "name": "bboxMinY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMinZ": {
+      "__class__": "ParamTocElement",
+      "ident": 75,
+      "group": "colAv",
+      "name": "bboxMinZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxX": {
+      "__class__": "ParamTocElement",
+      "ident": 76,
+      "group": "colAv",
+      "name": "bboxMaxX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxY": {
+      "__class__": "ParamTocElement",
+      "ident": 77,
+      "group": "colAv",
+      "name": "bboxMaxY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bboxMaxZ": {
+      "__class__": "ParamTocElement",
+      "ident": 78,
+      "group": "colAv",
+      "name": "bboxMaxZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "horizon": {
+      "__class__": "ParamTocElement",
+      "ident": 79,
+      "group": "colAv",
+      "name": "horizon",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxSpeed": {
+      "__class__": "ParamTocElement",
+      "ident": 80,
+      "group": "colAv",
+      "name": "maxSpeed",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "sidestepThrsh": {
+      "__class__": "ParamTocElement",
+      "ident": 81,
+      "group": "colAv",
+      "name": "sidestepThrsh",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxPeerLocAge": {
+      "__class__": "ParamTocElement",
+      "ident": 82,
+      "group": "colAv",
+      "name": "maxPeerLocAge",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0,
+      "extended": false
+    },
+    "vorTol": {
+      "__class__": "ParamTocElement",
+      "ident": 83,
+      "group": "colAv",
+      "name": "vorTol",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "vorIters": {
+      "__class__": "ParamTocElement",
+      "ident": 84,
+      "group": "colAv",
+      "name": "vorIters",
+      "ctype": "int32_t",
+      "pytype": "<i",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "commander": {
+    "enHighLevel": {
+      "__class__": "ParamTocElement",
+      "ident": 85,
+      "group": "commander",
+      "name": "enHighLevel",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "cppm": {
+    "rateRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 86,
+      "group": "cppm",
+      "name": "rateRoll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ratePitch": {
+      "__class__": "ParamTocElement",
+      "ident": 87,
+      "group": "cppm",
+      "name": "ratePitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "angPitch": {
+      "__class__": "ParamTocElement",
+      "ident": 88,
+      "group": "cppm",
+      "name": "angPitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "angRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 89,
+      "group": "cppm",
+      "name": "angRoll",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "rateYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 90,
+      "group": "cppm",
+      "name": "rateYaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "hlCommander": {
+    "vtoff": {
+      "__class__": "ParamTocElement",
+      "ident": 91,
+      "group": "hlCommander",
+      "name": "vtoff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "vland": {
+      "__class__": "ParamTocElement",
+      "ident": 92,
+      "group": "hlCommander",
+      "name": "vland",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "flightmode": {
+    "althold": {
+      "__class__": "ParamTocElement",
+      "ident": 93,
+      "group": "flightmode",
+      "name": "althold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "poshold": {
+      "__class__": "ParamTocElement",
+      "ident": 94,
+      "group": "flightmode",
+      "name": "poshold",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "posSet": {
+      "__class__": "ParamTocElement",
+      "ident": 95,
+      "group": "flightmode",
+      "name": "posSet",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "yawMode": {
+      "__class__": "ParamTocElement",
+      "ident": 96,
+      "group": "flightmode",
+      "name": "yawMode",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModeRoll": {
+      "__class__": "ParamTocElement",
+      "ident": 97,
+      "group": "flightmode",
+      "name": "stabModeRoll",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModePitch": {
+      "__class__": "ParamTocElement",
+      "ident": 98,
+      "group": "flightmode",
+      "name": "stabModePitch",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stabModeYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 99,
+      "group": "flightmode",
+      "name": "stabModeYaw",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "locSrv": {
+    "enRangeStreamFP32": {
+      "__class__": "ParamTocElement",
+      "ident": 100,
+      "group": "locSrv",
+      "name": "enRangeStreamFP32",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "enLhAngleStream": {
+      "__class__": "ParamTocElement",
+      "ident": 101,
+      "group": "locSrv",
+      "name": "enLhAngleStream",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "extPosStdDev": {
+      "__class__": "ParamTocElement",
+      "ident": 102,
+      "group": "locSrv",
+      "name": "extPosStdDev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "extQuatStdDev": {
+      "__class__": "ParamTocElement",
+      "ident": 103,
+      "group": "locSrv",
+      "name": "extQuatStdDev",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "crtpsrv": {
+    "echoDelay": {
+      "__class__": "ParamTocElement",
+      "ident": 104,
+      "group": "crtpsrv",
+      "name": "echoDelay",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "health": {
+    "startPropTest": {
+      "__class__": "ParamTocElement",
+      "ident": 105,
+      "group": "health",
+      "name": "startPropTest",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "startBatTest": {
+      "__class__": "ParamTocElement",
+      "ident": 106,
+      "group": "health",
+      "name": "startBatTest",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "propTestPWMRatio": {
+      "__class__": "ParamTocElement",
+      "ident": 107,
+      "group": "health",
+      "name": "propTestPWMRatio",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "batTestPWMRatio": {
+      "__class__": "ParamTocElement",
+      "ident": 108,
+      "group": "health",
+      "name": "batTestPWMRatio",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "kalman": {
+    "maxPos": {
+      "__class__": "ParamTocElement",
+      "ident": 109,
+      "group": "kalman",
+      "name": "maxPos",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "maxVel": {
+      "__class__": "ParamTocElement",
+      "ident": 110,
+      "group": "kalman",
+      "name": "maxVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "resetEstimation": {
+      "__class__": "ParamTocElement",
+      "ident": 111,
+      "group": "kalman",
+      "name": "resetEstimation",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "robustTdoa": {
+      "__class__": "ParamTocElement",
+      "ident": 112,
+      "group": "kalman",
+      "name": "robustTdoa",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "robustTwr": {
+      "__class__": "ParamTocElement",
+      "ident": 113,
+      "group": "kalman",
+      "name": "robustTwr",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "pNAcc_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 114,
+      "group": "kalman",
+      "name": "pNAcc_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNAcc_z": {
+      "__class__": "ParamTocElement",
+      "ident": 115,
+      "group": "kalman",
+      "name": "pNAcc_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNVel": {
+      "__class__": "ParamTocElement",
+      "ident": 116,
+      "group": "kalman",
+      "name": "pNVel",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNPos": {
+      "__class__": "ParamTocElement",
+      "ident": 117,
+      "group": "kalman",
+      "name": "pNPos",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pNAtt": {
+      "__class__": "ParamTocElement",
+      "ident": 118,
+      "group": "kalman",
+      "name": "pNAtt",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNBaro": {
+      "__class__": "ParamTocElement",
+      "ident": 119,
+      "group": "kalman",
+      "name": "mNBaro",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNGyro_rollpitch": {
+      "__class__": "ParamTocElement",
+      "ident": 120,
+      "group": "kalman",
+      "name": "mNGyro_rollpitch",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mNGyro_yaw": {
+      "__class__": "ParamTocElement",
+      "ident": 121,
+      "group": "kalman",
+      "name": "mNGyro_yaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "initialX": {
+      "__class__": "ParamTocElement",
+      "ident": 122,
+      "group": "kalman",
+      "name": "initialX",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialY": {
+      "__class__": "ParamTocElement",
+      "ident": 123,
+      "group": "kalman",
+      "name": "initialY",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialZ": {
+      "__class__": "ParamTocElement",
+      "ident": 124,
+      "group": "kalman",
+      "name": "initialZ",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "initialYaw": {
+      "__class__": "ParamTocElement",
+      "ident": 125,
+      "group": "kalman",
+      "name": "initialYaw",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "memTst": {
+    "resetW": {
+      "__class__": "ParamTocElement",
+      "ident": 126,
+      "group": "memTst",
+      "name": "resetW",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "powerDist": {
+    "idleThrust": {
+      "__class__": "ParamTocElement",
+      "ident": 127,
+      "group": "powerDist",
+      "name": "idleThrust",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "quadSysId": {
+    "thrustToTorque": {
+      "__class__": "ParamTocElement",
+      "ident": 128,
+      "group": "quadSysId",
+      "name": "thrustToTorque",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pwmToThrustA": {
+      "__class__": "ParamTocElement",
+      "ident": 129,
+      "group": "quadSysId",
+      "name": "pwmToThrustA",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pwmToThrustB": {
+      "__class__": "ParamTocElement",
+      "ident": 130,
+      "group": "quadSysId",
+      "name": "pwmToThrustB",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "armLength": {
+      "__class__": "ParamTocElement",
+      "ident": 131,
+      "group": "quadSysId",
+      "name": "armLength",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "sensfusion6": {
+    "kp": {
+      "__class__": "ParamTocElement",
+      "ident": 132,
+      "group": "sensfusion6",
+      "name": "kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki": {
+      "__class__": "ParamTocElement",
+      "ident": 133,
+      "group": "sensfusion6",
+      "name": "ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "baseZacc": {
+      "__class__": "ParamTocElement",
+      "ident": 134,
+      "group": "sensfusion6",
+      "name": "baseZacc",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "sound": {
+    "effect": {
+      "__class__": "ParamTocElement",
+      "ident": 135,
+      "group": "sound",
+      "name": "effect",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": true
+    },
+    "neffect": {
+      "__class__": "ParamTocElement",
+      "ident": 136,
+      "group": "sound",
+      "name": "neffect",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "freq": {
+      "__class__": "ParamTocElement",
+      "ident": 137,
+      "group": "sound",
+      "name": "freq",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "stabilizer": {
+    "estimator": {
+      "__class__": "ParamTocElement",
+      "ident": 138,
+      "group": "stabilizer",
+      "name": "estimator",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "controller": {
+      "__class__": "ParamTocElement",
+      "ident": 139,
+      "group": "stabilizer",
+      "name": "controller",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "stop": {
+      "__class__": "ParamTocElement",
+      "ident": 140,
+      "group": "stabilizer",
+      "name": "stop",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "cpu": {
+    "flash": {
+      "__class__": "ParamTocElement",
+      "ident": 141,
+      "group": "cpu",
+      "name": "flash",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "id0": {
+      "__class__": "ParamTocElement",
+      "ident": 142,
+      "group": "cpu",
+      "name": "id0",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "id1": {
+      "__class__": "ParamTocElement",
+      "ident": 143,
+      "group": "cpu",
+      "name": "id1",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "id2": {
+      "__class__": "ParamTocElement",
+      "ident": 144,
+      "group": "cpu",
+      "name": "id2",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    }
+  },
+  "tdoaEngine": {
+    "logId": {
+      "__class__": "ParamTocElement",
+      "ident": 145,
+      "group": "tdoaEngine",
+      "name": "logId",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "logOthrId": {
+      "__class__": "ParamTocElement",
+      "ident": 146,
+      "group": "tdoaEngine",
+      "name": "logOthrId",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "matchAlgo": {
+      "__class__": "ParamTocElement",
+      "ident": 147,
+      "group": "tdoaEngine",
+      "name": "matchAlgo",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "lighthouse": {
+    "method": {
+      "__class__": "ParamTocElement",
+      "ident": 148,
+      "group": "lighthouse",
+      "name": "method",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "bsCalibReset": {
+      "__class__": "ParamTocElement",
+      "ident": 149,
+      "group": "lighthouse",
+      "name": "bsCalibReset",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "systemType": {
+      "__class__": "ParamTocElement",
+      "ident": 150,
+      "group": "lighthouse",
+      "name": "systemType",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "bsAvailable": {
+      "__class__": "ParamTocElement",
+      "ident": 151,
+      "group": "lighthouse",
+      "name": "bsAvailable",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "sweepStd": {
+      "__class__": "ParamTocElement",
+      "ident": 152,
+      "group": "lighthouse",
+      "name": "sweepStd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "sweepStd2": {
+      "__class__": "ParamTocElement",
+      "ident": 153,
+      "group": "lighthouse",
+      "name": "sweepStd2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "enLhRawStream": {
+      "__class__": "ParamTocElement",
+      "ident": 154,
+      "group": "lighthouse",
+      "name": "enLhRawStream",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    },
+    "lh2maxRate": {
+      "__class__": "ParamTocElement",
+      "ident": 155,
+      "group": "lighthouse",
+      "name": "lh2maxRate",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "pid_attitude": {
+    "roll_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 156,
+      "group": "pid_attitude",
+      "name": "roll_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 157,
+      "group": "pid_attitude",
+      "name": "roll_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 158,
+      "group": "pid_attitude",
+      "name": "roll_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 159,
+      "group": "pid_attitude",
+      "name": "roll_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 160,
+      "group": "pid_attitude",
+      "name": "pitch_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 161,
+      "group": "pid_attitude",
+      "name": "pitch_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 162,
+      "group": "pid_attitude",
+      "name": "pitch_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 163,
+      "group": "pid_attitude",
+      "name": "pitch_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 164,
+      "group": "pid_attitude",
+      "name": "yaw_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 165,
+      "group": "pid_attitude",
+      "name": "yaw_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 166,
+      "group": "pid_attitude",
+      "name": "yaw_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 167,
+      "group": "pid_attitude",
+      "name": "yaw_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yawMaxDelta": {
+      "__class__": "ParamTocElement",
+      "ident": 168,
+      "group": "pid_attitude",
+      "name": "yawMaxDelta",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "attFiltEn": {
+      "__class__": "ParamTocElement",
+      "ident": 169,
+      "group": "pid_attitude",
+      "name": "attFiltEn",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "attFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 170,
+      "group": "pid_attitude",
+      "name": "attFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "pid_rate": {
+    "roll_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 171,
+      "group": "pid_rate",
+      "name": "roll_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 172,
+      "group": "pid_rate",
+      "name": "roll_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 173,
+      "group": "pid_rate",
+      "name": "roll_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "roll_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 174,
+      "group": "pid_rate",
+      "name": "roll_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 175,
+      "group": "pid_rate",
+      "name": "pitch_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 176,
+      "group": "pid_rate",
+      "name": "pitch_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 177,
+      "group": "pid_rate",
+      "name": "pitch_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pitch_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 178,
+      "group": "pid_rate",
+      "name": "pitch_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kp": {
+      "__class__": "ParamTocElement",
+      "ident": 179,
+      "group": "pid_rate",
+      "name": "yaw_kp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_ki": {
+      "__class__": "ParamTocElement",
+      "ident": 180,
+      "group": "pid_rate",
+      "name": "yaw_ki",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kd": {
+      "__class__": "ParamTocElement",
+      "ident": 181,
+      "group": "pid_rate",
+      "name": "yaw_kd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yaw_kff": {
+      "__class__": "ParamTocElement",
+      "ident": 182,
+      "group": "pid_rate",
+      "name": "yaw_kff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "rateFiltEn": {
+      "__class__": "ParamTocElement",
+      "ident": 183,
+      "group": "pid_rate",
+      "name": "rateFiltEn",
+      "ctype": "int8_t",
+      "pytype": "<b",
+      "access": 0,
+      "extended": true
+    },
+    "omxFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 184,
+      "group": "pid_rate",
+      "name": "omxFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "omyFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 185,
+      "group": "pid_rate",
+      "name": "omyFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "omzFiltCut": {
+      "__class__": "ParamTocElement",
+      "ident": 186,
+      "group": "pid_rate",
+      "name": "omzFiltCut",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "ctrlINDI": {
+    "thrust_threshold": {
+      "__class__": "ParamTocElement",
+      "ident": 187,
+      "group": "ctrlINDI",
+      "name": "thrust_threshold",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "bound_ctrl_input": {
+      "__class__": "ParamTocElement",
+      "ident": 188,
+      "group": "ctrlINDI",
+      "name": "bound_ctrl_input",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_p": {
+      "__class__": "ParamTocElement",
+      "ident": 189,
+      "group": "ctrlINDI",
+      "name": "g1_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_q": {
+      "__class__": "ParamTocElement",
+      "ident": 190,
+      "group": "ctrlINDI",
+      "name": "g1_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g1_r": {
+      "__class__": "ParamTocElement",
+      "ident": 191,
+      "group": "ctrlINDI",
+      "name": "g1_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "g2": {
+      "__class__": "ParamTocElement",
+      "ident": 192,
+      "group": "ctrlINDI",
+      "name": "g2",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_p": {
+      "__class__": "ParamTocElement",
+      "ident": 193,
+      "group": "ctrlINDI",
+      "name": "ref_err_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_q": {
+      "__class__": "ParamTocElement",
+      "ident": 194,
+      "group": "ctrlINDI",
+      "name": "ref_err_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_err_r": {
+      "__class__": "ParamTocElement",
+      "ident": 195,
+      "group": "ctrlINDI",
+      "name": "ref_err_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_p": {
+      "__class__": "ParamTocElement",
+      "ident": 196,
+      "group": "ctrlINDI",
+      "name": "ref_rate_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_q": {
+      "__class__": "ParamTocElement",
+      "ident": 197,
+      "group": "ctrlINDI",
+      "name": "ref_rate_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "ref_rate_r": {
+      "__class__": "ParamTocElement",
+      "ident": 198,
+      "group": "ctrlINDI",
+      "name": "ref_rate_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_p": {
+      "__class__": "ParamTocElement",
+      "ident": 199,
+      "group": "ctrlINDI",
+      "name": "act_dyn_p",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_q": {
+      "__class__": "ParamTocElement",
+      "ident": 200,
+      "group": "ctrlINDI",
+      "name": "act_dyn_q",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "act_dyn_r": {
+      "__class__": "ParamTocElement",
+      "ident": 201,
+      "group": "ctrlINDI",
+      "name": "act_dyn_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "filt_cutoff": {
+      "__class__": "ParamTocElement",
+      "ident": 202,
+      "group": "ctrlINDI",
+      "name": "filt_cutoff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "filt_cutoff_r": {
+      "__class__": "ParamTocElement",
+      "ident": 203,
+      "group": "ctrlINDI",
+      "name": "filt_cutoff_r",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "outerLoopActive": {
+      "__class__": "ParamTocElement",
+      "ident": 204,
+      "group": "ctrlINDI",
+      "name": "outerLoopActive",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "ctrlMel": {
+    "kp_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 205,
+      "group": "ctrlMel",
+      "name": "kp_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 206,
+      "group": "ctrlMel",
+      "name": "kd_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 207,
+      "group": "ctrlMel",
+      "name": "ki_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 208,
+      "group": "ctrlMel",
+      "name": "i_range_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kp_z": {
+      "__class__": "ParamTocElement",
+      "ident": 209,
+      "group": "ctrlMel",
+      "name": "kp_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_z": {
+      "__class__": "ParamTocElement",
+      "ident": 210,
+      "group": "ctrlMel",
+      "name": "kd_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_z": {
+      "__class__": "ParamTocElement",
+      "ident": 211,
+      "group": "ctrlMel",
+      "name": "ki_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_z": {
+      "__class__": "ParamTocElement",
+      "ident": 212,
+      "group": "ctrlMel",
+      "name": "i_range_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "mass": {
+      "__class__": "ParamTocElement",
+      "ident": 213,
+      "group": "ctrlMel",
+      "name": "mass",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "massThrust": {
+      "__class__": "ParamTocElement",
+      "ident": 214,
+      "group": "ctrlMel",
+      "name": "massThrust",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kR_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 215,
+      "group": "ctrlMel",
+      "name": "kR_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kR_z": {
+      "__class__": "ParamTocElement",
+      "ident": 216,
+      "group": "ctrlMel",
+      "name": "kR_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kw_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 217,
+      "group": "ctrlMel",
+      "name": "kw_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kw_z": {
+      "__class__": "ParamTocElement",
+      "ident": 218,
+      "group": "ctrlMel",
+      "name": "kw_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_m_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 219,
+      "group": "ctrlMel",
+      "name": "ki_m_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "ki_m_z": {
+      "__class__": "ParamTocElement",
+      "ident": 220,
+      "group": "ctrlMel",
+      "name": "ki_m_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "kd_omega_rp": {
+      "__class__": "ParamTocElement",
+      "ident": 221,
+      "group": "ctrlMel",
+      "name": "kd_omega_rp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_m_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 222,
+      "group": "ctrlMel",
+      "name": "i_range_m_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "i_range_m_z": {
+      "__class__": "ParamTocElement",
+      "ident": 223,
+      "group": "ctrlMel",
+      "name": "i_range_m_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "ctrlAtt": {
+    "tau_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 224,
+      "group": "ctrlAtt",
+      "name": "tau_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "zeta_xy": {
+      "__class__": "ParamTocElement",
+      "ident": 225,
+      "group": "ctrlAtt",
+      "name": "zeta_xy",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "tau_z": {
+      "__class__": "ParamTocElement",
+      "ident": 226,
+      "group": "ctrlAtt",
+      "name": "tau_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "zeta_z": {
+      "__class__": "ParamTocElement",
+      "ident": 227,
+      "group": "ctrlAtt",
+      "name": "zeta_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "tau_rp": {
+      "__class__": "ParamTocElement",
+      "ident": 228,
+      "group": "ctrlAtt",
+      "name": "tau_rp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "mixing_factor": {
+      "__class__": "ParamTocElement",
+      "ident": 229,
+      "group": "ctrlAtt",
+      "name": "mixing_factor",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "coll_fairness": {
+      "__class__": "ParamTocElement",
+      "ident": 230,
+      "group": "ctrlAtt",
+      "name": "coll_fairness",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "posCtrlIndi": {
+    "K_xi_x": {
+      "__class__": "ParamTocElement",
+      "ident": 231,
+      "group": "posCtrlIndi",
+      "name": "K_xi_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_xi_y": {
+      "__class__": "ParamTocElement",
+      "ident": 232,
+      "group": "posCtrlIndi",
+      "name": "K_xi_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_xi_z": {
+      "__class__": "ParamTocElement",
+      "ident": 233,
+      "group": "posCtrlIndi",
+      "name": "K_xi_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_x": {
+      "__class__": "ParamTocElement",
+      "ident": 234,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_x",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_y": {
+      "__class__": "ParamTocElement",
+      "ident": 235,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_y",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "K_dxi_z": {
+      "__class__": "ParamTocElement",
+      "ident": 236,
+      "group": "posCtrlIndi",
+      "name": "K_dxi_z",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    },
+    "pq_clamping": {
+      "__class__": "ParamTocElement",
+      "ident": 237,
+      "group": "posCtrlIndi",
+      "name": "pq_clamping",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": false
+    }
+  },
+  "posCtlPid": {
+    "xKp": {
+      "__class__": "ParamTocElement",
+      "ident": 238,
+      "group": "posCtlPid",
+      "name": "xKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKi": {
+      "__class__": "ParamTocElement",
+      "ident": 239,
+      "group": "posCtlPid",
+      "name": "xKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKd": {
+      "__class__": "ParamTocElement",
+      "ident": 240,
+      "group": "posCtlPid",
+      "name": "xKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xKff": {
+      "__class__": "ParamTocElement",
+      "ident": 241,
+      "group": "posCtlPid",
+      "name": "xKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKp": {
+      "__class__": "ParamTocElement",
+      "ident": 242,
+      "group": "posCtlPid",
+      "name": "yKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKi": {
+      "__class__": "ParamTocElement",
+      "ident": 243,
+      "group": "posCtlPid",
+      "name": "yKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKd": {
+      "__class__": "ParamTocElement",
+      "ident": 244,
+      "group": "posCtlPid",
+      "name": "yKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yKff": {
+      "__class__": "ParamTocElement",
+      "ident": 245,
+      "group": "posCtlPid",
+      "name": "yKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKp": {
+      "__class__": "ParamTocElement",
+      "ident": 246,
+      "group": "posCtlPid",
+      "name": "zKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKi": {
+      "__class__": "ParamTocElement",
+      "ident": 247,
+      "group": "posCtlPid",
+      "name": "zKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKd": {
+      "__class__": "ParamTocElement",
+      "ident": 248,
+      "group": "posCtlPid",
+      "name": "zKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zKff": {
+      "__class__": "ParamTocElement",
+      "ident": 249,
+      "group": "posCtlPid",
+      "name": "zKff",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "thrustBase": {
+      "__class__": "ParamTocElement",
+      "ident": 250,
+      "group": "posCtlPid",
+      "name": "thrustBase",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "thrustMin": {
+      "__class__": "ParamTocElement",
+      "ident": 251,
+      "group": "posCtlPid",
+      "name": "thrustMin",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 0,
+      "extended": true
+    },
+    "rLimit": {
+      "__class__": "ParamTocElement",
+      "ident": 252,
+      "group": "posCtlPid",
+      "name": "rLimit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "pLimit": {
+      "__class__": "ParamTocElement",
+      "ident": 253,
+      "group": "posCtlPid",
+      "name": "pLimit",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "xVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 254,
+      "group": "posCtlPid",
+      "name": "xVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "yVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 255,
+      "group": "posCtlPid",
+      "name": "yVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "zVelMax": {
+      "__class__": "ParamTocElement",
+      "ident": 256,
+      "group": "posCtlPid",
+      "name": "zVelMax",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "velCtlPid": {
+    "vxKp": {
+      "__class__": "ParamTocElement",
+      "ident": 257,
+      "group": "velCtlPid",
+      "name": "vxKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKi": {
+      "__class__": "ParamTocElement",
+      "ident": 258,
+      "group": "velCtlPid",
+      "name": "vxKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKd": {
+      "__class__": "ParamTocElement",
+      "ident": 259,
+      "group": "velCtlPid",
+      "name": "vxKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vxKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 260,
+      "group": "velCtlPid",
+      "name": "vxKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKp": {
+      "__class__": "ParamTocElement",
+      "ident": 261,
+      "group": "velCtlPid",
+      "name": "vyKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKi": {
+      "__class__": "ParamTocElement",
+      "ident": 262,
+      "group": "velCtlPid",
+      "name": "vyKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKd": {
+      "__class__": "ParamTocElement",
+      "ident": 263,
+      "group": "velCtlPid",
+      "name": "vyKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vyKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 264,
+      "group": "velCtlPid",
+      "name": "vyKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKp": {
+      "__class__": "ParamTocElement",
+      "ident": 265,
+      "group": "velCtlPid",
+      "name": "vzKp",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKi": {
+      "__class__": "ParamTocElement",
+      "ident": 266,
+      "group": "velCtlPid",
+      "name": "vzKi",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKd": {
+      "__class__": "ParamTocElement",
+      "ident": 267,
+      "group": "velCtlPid",
+      "name": "vzKd",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vzKFF": {
+      "__class__": "ParamTocElement",
+      "ident": 268,
+      "group": "velCtlPid",
+      "name": "vzKFF",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "posEstAlt": {
+    "estAlphaAsl": {
+      "__class__": "ParamTocElement",
+      "ident": 269,
+      "group": "posEstAlt",
+      "name": "estAlphaAsl",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "estAlphaZr": {
+      "__class__": "ParamTocElement",
+      "ident": 270,
+      "group": "posEstAlt",
+      "name": "estAlphaZr",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "velFactor": {
+      "__class__": "ParamTocElement",
+      "ident": 271,
+      "group": "posEstAlt",
+      "name": "velFactor",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "velZAlpha": {
+      "__class__": "ParamTocElement",
+      "ident": 272,
+      "group": "posEstAlt",
+      "name": "velZAlpha",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    },
+    "vAccDeadband": {
+      "__class__": "ParamTocElement",
+      "ident": 273,
+      "group": "posEstAlt",
+      "name": "vAccDeadband",
+      "ctype": "float",
+      "pytype": "<f",
+      "access": 0,
+      "extended": true
+    }
+  },
+  "firmware": {
+    "revision0": {
+      "__class__": "ParamTocElement",
+      "ident": 274,
+      "group": "firmware",
+      "name": "revision0",
+      "ctype": "uint32_t",
+      "pytype": "<L",
+      "access": 1,
+      "extended": false
+    },
+    "revision1": {
+      "__class__": "ParamTocElement",
+      "ident": 275,
+      "group": "firmware",
+      "name": "revision1",
+      "ctype": "uint16_t",
+      "pytype": "<H",
+      "access": 1,
+      "extended": false
+    },
+    "modified": {
+      "__class__": "ParamTocElement",
+      "ident": 276,
+      "group": "firmware",
+      "name": "modified",
+      "ctype": "uint8_t",
+      "pytype": "<B",
+      "access": 1,
+      "extended": false
+    }
+  }
+}
\ No newline at end of file
diff --git c/src/webots_pkg/test/software/test_lighthouse_classes.py i/src/webots_pkg/test/software/test_lighthouse_classes.py
index 3fe0b61..557822d 100644
--- c/src/webots_pkg/test/software/test_lighthouse_classes.py
+++ i/src/webots_pkg/test/software/test_lighthouse_classes.py
@@ -21,14 +21,8 @@ sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..',
 from webots_pkg.lighthouse_classes import ReadLHMem, WriteLHGeoMem, WriteLHMem
 from cflib.crazyflie import Crazyflie
 
-import cflib.crtp  # noqa
-from cflib.crazyflie import Crazyflie
-from cflib.crazyflie.log import LogConfig
-from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
-from cflib.crazyflie.syncLogger import SyncLogger
+import cflib.crtp
 from cflib.crazyflie.mem import LighthouseBsGeometry
-from cflib.crazyflie.mem import LighthouseMemHelper
-from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
 from cflib.utils import uri_helper
 
 def test_ReadLHMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):
@@ -54,7 +48,7 @@ def test_WriteLHGeoMem(radio_uri = "radio://0/80/2M/E7E7E7E7E7"):    #
     bs1geo.rotation_matrix = [
         [0.0, -1.0, 0.0],
         [1.0, 0.0, 0.0],
-        [0.0, 0.0, 7.0],
+        [0.0, 0.0, 1.0],
     ]
     bs1geo.valid = True
 
diff --git c/src/webots_pkg/test/vicon/test_vicon_listener.zsh i/src/webots_pkg/test/vicon/test_vicon_listener.zsh
index 2db26a2..6efee01 100644
--- c/src/webots_pkg/test/vicon/test_vicon_listener.zsh
+++ i/src/webots_pkg/test/vicon/test_vicon_listener.zsh
@@ -1,6 +1,6 @@
 #!/bin/bash
-# TODO: Test and make sure this stuff is working. 
-
+# RUNME: 
+# RUN_TESTS: Run test to make sure this actually listens to the vicon cameras.
 
 
 # Specify the path to the workspace you want to source
diff --git c/src/webots_pkg/webots_pkg/lighthouse_classes.py i/src/webots_pkg/webots_pkg/lighthouse_classes.py
index 89c3194..c23c9b2 100644
--- c/src/webots_pkg/webots_pkg/lighthouse_classes.py
+++ i/src/webots_pkg/webots_pkg/lighthouse_classes.py
@@ -106,9 +106,9 @@ class WriteLHGeoMem:
 
     def _data_written(self, success):
         if success:
-            print('Data written')
+            print('Lighthouse geometry write success')
         else:
-            print('Write failed')
+            print('Lighthouse geometry write failure')
 
         self._event.set()
 
--------------------------------------------------
Changes not staged for commit:
diff --git i/.gitignore w/.gitignore
index 336a1a5..2962b58 100644
--- i/.gitignore
+++ w/.gitignore
@@ -5,3 +5,5 @@ install/
 **/*.pyc
 venv/
 .vscode
+__pycache__/
+*.pyc
diff --git i/src/webots_pkg/test/hardware/cache/39041F30.json w/src/webots_pkg/test/hardware/cache/39041F30.json
deleted file mode 100644
index ea9e30f..0000000
--- i/src/webots_pkg/test/hardware/cache/39041F30.json
+++ /dev/null
@@ -1,4463 +0,0 @@
-{
-  "activeMarker": {
-    "btSns": {
-      "__class__": "LogTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "btSns",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "i2cOk": {
-      "__class__": "LogTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "i2cOk",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "motion": {
-    "motion": {
-      "__class__": "LogTocElement",
-      "ident": 2,
-      "group": "motion",
-      "name": "motion",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "deltaX": {
-      "__class__": "LogTocElement",
-      "ident": 3,
-      "group": "motion",
-      "name": "deltaX",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "deltaY": {
-      "__class__": "LogTocElement",
-      "ident": 4,
-      "group": "motion",
-      "name": "deltaY",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "shutter": {
-      "__class__": "LogTocElement",
-      "ident": 5,
-      "group": "motion",
-      "name": "shutter",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "maxRaw": {
-      "__class__": "LogTocElement",
-      "ident": 6,
-      "group": "motion",
-      "name": "maxRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "minRaw": {
-      "__class__": "LogTocElement",
-      "ident": 7,
-      "group": "motion",
-      "name": "minRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Rawsum": {
-      "__class__": "LogTocElement",
-      "ident": 8,
-      "group": "motion",
-      "name": "Rawsum",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "outlierCount": {
-      "__class__": "LogTocElement",
-      "ident": 9,
-      "group": "motion",
-      "name": "outlierCount",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "squal": {
-      "__class__": "LogTocElement",
-      "ident": 10,
-      "group": "motion",
-      "name": "squal",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "std": {
-      "__class__": "LogTocElement",
-      "ident": 11,
-      "group": "motion",
-      "name": "std",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ring": {
-    "fadeTime": {
-      "__class__": "LogTocElement",
-      "ident": 12,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "LogTocElement",
-      "ident": 13,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "spiWr": {
-      "__class__": "LogTocElement",
-      "ident": 14,
-      "group": "loco",
-      "name": "spiWr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiRe": {
-      "__class__": "LogTocElement",
-      "ident": 15,
-      "group": "loco",
-      "name": "spiRe",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ranging": {
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 16,
-      "group": "ranging",
-      "name": "state",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "distance0": {
-      "__class__": "LogTocElement",
-      "ident": 17,
-      "group": "ranging",
-      "name": "distance0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance1": {
-      "__class__": "LogTocElement",
-      "ident": 18,
-      "group": "ranging",
-      "name": "distance1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance2": {
-      "__class__": "LogTocElement",
-      "ident": 19,
-      "group": "ranging",
-      "name": "distance2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance3": {
-      "__class__": "LogTocElement",
-      "ident": 20,
-      "group": "ranging",
-      "name": "distance3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance4": {
-      "__class__": "LogTocElement",
-      "ident": 21,
-      "group": "ranging",
-      "name": "distance4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance5": {
-      "__class__": "LogTocElement",
-      "ident": 22,
-      "group": "ranging",
-      "name": "distance5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance6": {
-      "__class__": "LogTocElement",
-      "ident": 23,
-      "group": "ranging",
-      "name": "distance6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance7": {
-      "__class__": "LogTocElement",
-      "ident": 24,
-      "group": "ranging",
-      "name": "distance7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure0": {
-      "__class__": "LogTocElement",
-      "ident": 25,
-      "group": "ranging",
-      "name": "pressure0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure1": {
-      "__class__": "LogTocElement",
-      "ident": 26,
-      "group": "ranging",
-      "name": "pressure1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure2": {
-      "__class__": "LogTocElement",
-      "ident": 27,
-      "group": "ranging",
-      "name": "pressure2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure3": {
-      "__class__": "LogTocElement",
-      "ident": 28,
-      "group": "ranging",
-      "name": "pressure3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure4": {
-      "__class__": "LogTocElement",
-      "ident": 29,
-      "group": "ranging",
-      "name": "pressure4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure5": {
-      "__class__": "LogTocElement",
-      "ident": 30,
-      "group": "ranging",
-      "name": "pressure5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure6": {
-      "__class__": "LogTocElement",
-      "ident": 31,
-      "group": "ranging",
-      "name": "pressure6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure7": {
-      "__class__": "LogTocElement",
-      "ident": 32,
-      "group": "ranging",
-      "name": "pressure7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "tdoa2": {
-    "d7-0": {
-      "__class__": "LogTocElement",
-      "ident": 33,
-      "group": "tdoa2",
-      "name": "d7-0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d0-1": {
-      "__class__": "LogTocElement",
-      "ident": 34,
-      "group": "tdoa2",
-      "name": "d0-1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d1-2": {
-      "__class__": "LogTocElement",
-      "ident": 35,
-      "group": "tdoa2",
-      "name": "d1-2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d2-3": {
-      "__class__": "LogTocElement",
-      "ident": 36,
-      "group": "tdoa2",
-      "name": "d2-3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d3-4": {
-      "__class__": "LogTocElement",
-      "ident": 37,
-      "group": "tdoa2",
-      "name": "d3-4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d4-5": {
-      "__class__": "LogTocElement",
-      "ident": 38,
-      "group": "tdoa2",
-      "name": "d4-5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d5-6": {
-      "__class__": "LogTocElement",
-      "ident": 39,
-      "group": "tdoa2",
-      "name": "d5-6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d6-7": {
-      "__class__": "LogTocElement",
-      "ident": 40,
-      "group": "tdoa2",
-      "name": "d6-7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc0": {
-      "__class__": "LogTocElement",
-      "ident": 41,
-      "group": "tdoa2",
-      "name": "cc0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc1": {
-      "__class__": "LogTocElement",
-      "ident": 42,
-      "group": "tdoa2",
-      "name": "cc1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc2": {
-      "__class__": "LogTocElement",
-      "ident": 43,
-      "group": "tdoa2",
-      "name": "cc2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc3": {
-      "__class__": "LogTocElement",
-      "ident": 44,
-      "group": "tdoa2",
-      "name": "cc3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc4": {
-      "__class__": "LogTocElement",
-      "ident": 45,
-      "group": "tdoa2",
-      "name": "cc4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc5": {
-      "__class__": "LogTocElement",
-      "ident": 46,
-      "group": "tdoa2",
-      "name": "cc5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc6": {
-      "__class__": "LogTocElement",
-      "ident": 47,
-      "group": "tdoa2",
-      "name": "cc6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc7": {
-      "__class__": "LogTocElement",
-      "ident": 48,
-      "group": "tdoa2",
-      "name": "cc7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "dist7-0": {
-      "__class__": "LogTocElement",
-      "ident": 49,
-      "group": "tdoa2",
-      "name": "dist7-0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist0-1": {
-      "__class__": "LogTocElement",
-      "ident": 50,
-      "group": "tdoa2",
-      "name": "dist0-1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist1-2": {
-      "__class__": "LogTocElement",
-      "ident": 51,
-      "group": "tdoa2",
-      "name": "dist1-2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist2-3": {
-      "__class__": "LogTocElement",
-      "ident": 52,
-      "group": "tdoa2",
-      "name": "dist2-3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist3-4": {
-      "__class__": "LogTocElement",
-      "ident": 53,
-      "group": "tdoa2",
-      "name": "dist3-4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist4-5": {
-      "__class__": "LogTocElement",
-      "ident": 54,
-      "group": "tdoa2",
-      "name": "dist4-5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist5-6": {
-      "__class__": "LogTocElement",
-      "ident": 55,
-      "group": "tdoa2",
-      "name": "dist5-6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist6-7": {
-      "__class__": "LogTocElement",
-      "ident": 56,
-      "group": "tdoa2",
-      "name": "dist6-7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "twr": {
-    "rangingSuccessRate0": {
-      "__class__": "LogTocElement",
-      "ident": 57,
-      "group": "twr",
-      "name": "rangingSuccessRate0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec0": {
-      "__class__": "LogTocElement",
-      "ident": 58,
-      "group": "twr",
-      "name": "rangingPerSec0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate1": {
-      "__class__": "LogTocElement",
-      "ident": 59,
-      "group": "twr",
-      "name": "rangingSuccessRate1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec1": {
-      "__class__": "LogTocElement",
-      "ident": 60,
-      "group": "twr",
-      "name": "rangingPerSec1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate2": {
-      "__class__": "LogTocElement",
-      "ident": 61,
-      "group": "twr",
-      "name": "rangingSuccessRate2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec2": {
-      "__class__": "LogTocElement",
-      "ident": 62,
-      "group": "twr",
-      "name": "rangingPerSec2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate3": {
-      "__class__": "LogTocElement",
-      "ident": 63,
-      "group": "twr",
-      "name": "rangingSuccessRate3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec3": {
-      "__class__": "LogTocElement",
-      "ident": 64,
-      "group": "twr",
-      "name": "rangingPerSec3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate4": {
-      "__class__": "LogTocElement",
-      "ident": 65,
-      "group": "twr",
-      "name": "rangingSuccessRate4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec4": {
-      "__class__": "LogTocElement",
-      "ident": 66,
-      "group": "twr",
-      "name": "rangingPerSec4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate5": {
-      "__class__": "LogTocElement",
-      "ident": 67,
-      "group": "twr",
-      "name": "rangingSuccessRate5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec5": {
-      "__class__": "LogTocElement",
-      "ident": 68,
-      "group": "twr",
-      "name": "rangingPerSec5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "oa": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 69,
-      "group": "oa",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 70,
-      "group": "oa",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 71,
-      "group": "oa",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 72,
-      "group": "oa",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 73,
-      "group": "oa",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "usd": {
-    "spiWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 74,
-      "group": "usd",
-      "name": "spiWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiReBps": {
-      "__class__": "LogTocElement",
-      "ident": 75,
-      "group": "usd",
-      "name": "spiReBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "fatWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 76,
-      "group": "usd",
-      "name": "fatWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "motor": {
-    "m1": {
-      "__class__": "LogTocElement",
-      "ident": 77,
-      "group": "motor",
-      "name": "m1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m2": {
-      "__class__": "LogTocElement",
-      "ident": 78,
-      "group": "motor",
-      "name": "m2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m3": {
-      "__class__": "LogTocElement",
-      "ident": 79,
-      "group": "motor",
-      "name": "m3",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m4": {
-      "__class__": "LogTocElement",
-      "ident": 80,
-      "group": "motor",
-      "name": "m4",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m1req": {
-      "__class__": "LogTocElement",
-      "ident": 81,
-      "group": "motor",
-      "name": "m1req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m2req": {
-      "__class__": "LogTocElement",
-      "ident": 82,
-      "group": "motor",
-      "name": "m2req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m3req": {
-      "__class__": "LogTocElement",
-      "ident": 83,
-      "group": "motor",
-      "name": "m3req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m4req": {
-      "__class__": "LogTocElement",
-      "ident": 84,
-      "group": "motor",
-      "name": "m4req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "pm": {
-    "vbat": {
-      "__class__": "LogTocElement",
-      "ident": 85,
-      "group": "pm",
-      "name": "vbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 86,
-      "group": "pm",
-      "name": "vbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extVbat": {
-      "__class__": "LogTocElement",
-      "ident": 87,
-      "group": "pm",
-      "name": "extVbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "extVbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 88,
-      "group": "pm",
-      "name": "extVbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extCurr": {
-      "__class__": "LogTocElement",
-      "ident": 89,
-      "group": "pm",
-      "name": "extCurr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "chargeCurrent": {
-      "__class__": "LogTocElement",
-      "ident": 90,
-      "group": "pm",
-      "name": "chargeCurrent",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 91,
-      "group": "pm",
-      "name": "state",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    },
-    "batteryLevel": {
-      "__class__": "LogTocElement",
-      "ident": 92,
-      "group": "pm",
-      "name": "batteryLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "radio": {
-    "rssi": {
-      "__class__": "LogTocElement",
-      "ident": 93,
-      "group": "radio",
-      "name": "rssi",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isConnected": {
-      "__class__": "LogTocElement",
-      "ident": 94,
-      "group": "radio",
-      "name": "isConnected",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "gyro": {
-    "xRaw": {
-      "__class__": "LogTocElement",
-      "ident": 95,
-      "group": "gyro",
-      "name": "xRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "yRaw": {
-      "__class__": "LogTocElement",
-      "ident": 96,
-      "group": "gyro",
-      "name": "yRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "zRaw": {
-      "__class__": "LogTocElement",
-      "ident": 97,
-      "group": "gyro",
-      "name": "zRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "xVariance": {
-      "__class__": "LogTocElement",
-      "ident": 98,
-      "group": "gyro",
-      "name": "xVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yVariance": {
-      "__class__": "LogTocElement",
-      "ident": 99,
-      "group": "gyro",
-      "name": "yVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVariance": {
-      "__class__": "LogTocElement",
-      "ident": 100,
-      "group": "gyro",
-      "name": "zVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 101,
-      "group": "gyro",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 102,
-      "group": "gyro",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 103,
-      "group": "gyro",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "colAv": {
-    "latency": {
-      "__class__": "LogTocElement",
-      "ident": 104,
-      "group": "colAv",
-      "name": "latency",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "ext_pos": {
-    "X": {
-      "__class__": "LogTocElement",
-      "ident": 105,
-      "group": "ext_pos",
-      "name": "X",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Y": {
-      "__class__": "LogTocElement",
-      "ident": 106,
-      "group": "ext_pos",
-      "name": "Y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Z": {
-      "__class__": "LogTocElement",
-      "ident": 107,
-      "group": "ext_pos",
-      "name": "Z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrv": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 108,
-      "group": "locSrv",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 109,
-      "group": "locSrv",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 110,
-      "group": "locSrv",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 111,
-      "group": "locSrv",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 112,
-      "group": "locSrv",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 113,
-      "group": "locSrv",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 114,
-      "group": "locSrv",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrvZ": {
-    "tick": {
-      "__class__": "LogTocElement",
-      "ident": 115,
-      "group": "locSrvZ",
-      "name": "tick",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "crtp": {
-    "rxRate": {
-      "__class__": "LogTocElement",
-      "ident": 116,
-      "group": "crtp",
-      "name": "rxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "txRate": {
-      "__class__": "LogTocElement",
-      "ident": 117,
-      "group": "crtp",
-      "name": "txRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "extrx": {
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 118,
-      "group": "extrx",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 119,
-      "group": "extrx",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 120,
-      "group": "extrx",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 121,
-      "group": "extrx",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 122,
-      "group": "extrx",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 123,
-      "group": "extrx",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVel": {
-      "__class__": "LogTocElement",
-      "ident": 124,
-      "group": "extrx",
-      "name": "zVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "AltHold": {
-      "__class__": "LogTocElement",
-      "ident": 125,
-      "group": "extrx",
-      "name": "AltHold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Arm": {
-      "__class__": "LogTocElement",
-      "ident": 126,
-      "group": "extrx",
-      "name": "Arm",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "extrx_raw": {
-    "ch0": {
-      "__class__": "LogTocElement",
-      "ident": 127,
-      "group": "extrx_raw",
-      "name": "ch0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch1": {
-      "__class__": "LogTocElement",
-      "ident": 128,
-      "group": "extrx_raw",
-      "name": "ch1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch2": {
-      "__class__": "LogTocElement",
-      "ident": 129,
-      "group": "extrx_raw",
-      "name": "ch2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch3": {
-      "__class__": "LogTocElement",
-      "ident": 130,
-      "group": "extrx_raw",
-      "name": "ch3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch4": {
-      "__class__": "LogTocElement",
-      "ident": 131,
-      "group": "extrx_raw",
-      "name": "ch4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch5": {
-      "__class__": "LogTocElement",
-      "ident": 132,
-      "group": "extrx_raw",
-      "name": "ch5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch6": {
-      "__class__": "LogTocElement",
-      "ident": 133,
-      "group": "extrx_raw",
-      "name": "ch6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch7": {
-      "__class__": "LogTocElement",
-      "ident": 134,
-      "group": "extrx_raw",
-      "name": "ch7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "health": {
-    "motorVarXM1": {
-      "__class__": "LogTocElement",
-      "ident": 135,
-      "group": "health",
-      "name": "motorVarXM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM1": {
-      "__class__": "LogTocElement",
-      "ident": 136,
-      "group": "health",
-      "name": "motorVarYM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM2": {
-      "__class__": "LogTocElement",
-      "ident": 137,
-      "group": "health",
-      "name": "motorVarXM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM2": {
-      "__class__": "LogTocElement",
-      "ident": 138,
-      "group": "health",
-      "name": "motorVarYM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM3": {
-      "__class__": "LogTocElement",
-      "ident": 139,
-      "group": "health",
-      "name": "motorVarXM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM3": {
-      "__class__": "LogTocElement",
-      "ident": 140,
-      "group": "health",
-      "name": "motorVarYM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM4": {
-      "__class__": "LogTocElement",
-      "ident": 141,
-      "group": "health",
-      "name": "motorVarXM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM4": {
-      "__class__": "LogTocElement",
-      "ident": 142,
-      "group": "health",
-      "name": "motorVarYM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorPass": {
-      "__class__": "LogTocElement",
-      "ident": 143,
-      "group": "health",
-      "name": "motorPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "batterySag": {
-      "__class__": "LogTocElement",
-      "ident": 144,
-      "group": "health",
-      "name": "batterySag",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "batteryPass": {
-      "__class__": "LogTocElement",
-      "ident": 145,
-      "group": "health",
-      "name": "batteryPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "motorTestCount": {
-      "__class__": "LogTocElement",
-      "ident": 146,
-      "group": "health",
-      "name": "motorTestCount",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "memTst": {
-    "errCntW": {
-      "__class__": "LogTocElement",
-      "ident": 147,
-      "group": "memTst",
-      "name": "errCntW",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "range": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 148,
-      "group": "range",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 149,
-      "group": "range",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 150,
-      "group": "range",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 151,
-      "group": "range",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 152,
-      "group": "range",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "zrange": {
-      "__class__": "LogTocElement",
-      "ident": 153,
-      "group": "range",
-      "name": "zrange",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "sensfusion6": {
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 154,
-      "group": "sensfusion6",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 155,
-      "group": "sensfusion6",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 156,
-      "group": "sensfusion6",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 157,
-      "group": "sensfusion6",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityX": {
-      "__class__": "LogTocElement",
-      "ident": 158,
-      "group": "sensfusion6",
-      "name": "gravityX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityY": {
-      "__class__": "LogTocElement",
-      "ident": 159,
-      "group": "sensfusion6",
-      "name": "gravityY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityZ": {
-      "__class__": "LogTocElement",
-      "ident": 160,
-      "group": "sensfusion6",
-      "name": "gravityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accZbase": {
-      "__class__": "LogTocElement",
-      "ident": 161,
-      "group": "sensfusion6",
-      "name": "accZbase",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "isInit": {
-      "__class__": "LogTocElement",
-      "ident": 162,
-      "group": "sensfusion6",
-      "name": "isInit",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isCalibrated": {
-      "__class__": "LogTocElement",
-      "ident": 163,
-      "group": "sensfusion6",
-      "name": "isCalibrated",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "acc": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 164,
-      "group": "acc",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 165,
-      "group": "acc",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 166,
-      "group": "acc",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "baro": {
-    "asl": {
-      "__class__": "LogTocElement",
-      "ident": 167,
-      "group": "baro",
-      "name": "asl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "temp": {
-      "__class__": "LogTocElement",
-      "ident": 168,
-      "group": "baro",
-      "name": "temp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure": {
-      "__class__": "LogTocElement",
-      "ident": 169,
-      "group": "baro",
-      "name": "pressure",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "controller": {
-    "ctr_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 170,
-      "group": "controller",
-      "name": "ctr_yaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 171,
-      "group": "controller",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 172,
-      "group": "controller",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 173,
-      "group": "controller",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 174,
-      "group": "controller",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 175,
-      "group": "controller",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 176,
-      "group": "controller",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 177,
-      "group": "controller",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 178,
-      "group": "controller",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "actuatorThrust": {
-      "__class__": "LogTocElement",
-      "ident": 179,
-      "group": "controller",
-      "name": "actuatorThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 180,
-      "group": "controller",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 181,
-      "group": "controller",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 182,
-      "group": "controller",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 183,
-      "group": "controller",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 184,
-      "group": "controller",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 185,
-      "group": "controller",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrltarget": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 186,
-      "group": "ctrltarget",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 187,
-      "group": "ctrltarget",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 188,
-      "group": "ctrltarget",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 189,
-      "group": "ctrltarget",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 190,
-      "group": "ctrltarget",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 191,
-      "group": "ctrltarget",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 192,
-      "group": "ctrltarget",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 193,
-      "group": "ctrltarget",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 194,
-      "group": "ctrltarget",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 195,
-      "group": "ctrltarget",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 196,
-      "group": "ctrltarget",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 197,
-      "group": "ctrltarget",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrltargetZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 198,
-      "group": "ctrltargetZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 199,
-      "group": "ctrltargetZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 200,
-      "group": "ctrltargetZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 201,
-      "group": "ctrltargetZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 202,
-      "group": "ctrltargetZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 203,
-      "group": "ctrltargetZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 204,
-      "group": "ctrltargetZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 205,
-      "group": "ctrltargetZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 206,
-      "group": "ctrltargetZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "mag": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 207,
-      "group": "mag",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 208,
-      "group": "mag",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 209,
-      "group": "mag",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stabilizer": {
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 210,
-      "group": "stabilizer",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 211,
-      "group": "stabilizer",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 212,
-      "group": "stabilizer",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 213,
-      "group": "stabilizer",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtStab": {
-      "__class__": "LogTocElement",
-      "ident": 214,
-      "group": "stabilizer",
-      "name": "rtStab",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "intToOut": {
-      "__class__": "LogTocElement",
-      "ident": 215,
-      "group": "stabilizer",
-      "name": "intToOut",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "stateEstimate": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 216,
-      "group": "stateEstimate",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 217,
-      "group": "stateEstimate",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 218,
-      "group": "stateEstimate",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 219,
-      "group": "stateEstimate",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 220,
-      "group": "stateEstimate",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 221,
-      "group": "stateEstimate",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 222,
-      "group": "stateEstimate",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 223,
-      "group": "stateEstimate",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 224,
-      "group": "stateEstimate",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 225,
-      "group": "stateEstimate",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 226,
-      "group": "stateEstimate",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 227,
-      "group": "stateEstimate",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 228,
-      "group": "stateEstimate",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 229,
-      "group": "stateEstimate",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 230,
-      "group": "stateEstimate",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 231,
-      "group": "stateEstimate",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stateEstimateZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 232,
-      "group": "stateEstimateZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 233,
-      "group": "stateEstimateZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 234,
-      "group": "stateEstimateZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 235,
-      "group": "stateEstimateZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 236,
-      "group": "stateEstimateZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 237,
-      "group": "stateEstimateZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 238,
-      "group": "stateEstimateZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 239,
-      "group": "stateEstimateZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 240,
-      "group": "stateEstimateZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "quat": {
-      "__class__": "LogTocElement",
-      "ident": 241,
-      "group": "stateEstimateZ",
-      "name": "quat",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "rateRoll": {
-      "__class__": "LogTocElement",
-      "ident": 242,
-      "group": "stateEstimateZ",
-      "name": "rateRoll",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ratePitch": {
-      "__class__": "LogTocElement",
-      "ident": 243,
-      "group": "stateEstimateZ",
-      "name": "ratePitch",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "rateYaw": {
-      "__class__": "LogTocElement",
-      "ident": 244,
-      "group": "stateEstimateZ",
-      "name": "rateYaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "sys": {
-    "canfly": {
-      "__class__": "LogTocElement",
-      "ident": 245,
-      "group": "sys",
-      "name": "canfly",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isFlying": {
-      "__class__": "LogTocElement",
-      "ident": 246,
-      "group": "sys",
-      "name": "isFlying",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isTumbled": {
-      "__class__": "LogTocElement",
-      "ident": 247,
-      "group": "sys",
-      "name": "isTumbled",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "armed": {
-      "__class__": "LogTocElement",
-      "ident": 248,
-      "group": "sys",
-      "name": "armed",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    },
-    "testLogParam": {
-      "__class__": "LogTocElement",
-      "ident": 249,
-      "group": "sys",
-      "name": "testLogParam",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    }
-  },
-  "tdoaEngine": {
-    "stRx": {
-      "__class__": "LogTocElement",
-      "ident": 250,
-      "group": "tdoaEngine",
-      "name": "stRx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stEst": {
-      "__class__": "LogTocElement",
-      "ident": 251,
-      "group": "tdoaEngine",
-      "name": "stEst",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stTime": {
-      "__class__": "LogTocElement",
-      "ident": 252,
-      "group": "tdoaEngine",
-      "name": "stTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stFound": {
-      "__class__": "LogTocElement",
-      "ident": 253,
-      "group": "tdoaEngine",
-      "name": "stFound",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stCc": {
-      "__class__": "LogTocElement",
-      "ident": 254,
-      "group": "tdoaEngine",
-      "name": "stCc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stHit": {
-      "__class__": "LogTocElement",
-      "ident": 255,
-      "group": "tdoaEngine",
-      "name": "stHit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stMiss": {
-      "__class__": "LogTocElement",
-      "ident": 256,
-      "group": "tdoaEngine",
-      "name": "stMiss",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc": {
-      "__class__": "LogTocElement",
-      "ident": 257,
-      "group": "tdoaEngine",
-      "name": "cc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "tof": {
-      "__class__": "LogTocElement",
-      "ident": 258,
-      "group": "tdoaEngine",
-      "name": "tof",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "tdoa": {
-      "__class__": "LogTocElement",
-      "ident": 259,
-      "group": "tdoaEngine",
-      "name": "tdoa",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman_pred": {
-    "predNX": {
-      "__class__": "LogTocElement",
-      "ident": 260,
-      "group": "kalman_pred",
-      "name": "predNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "predNY": {
-      "__class__": "LogTocElement",
-      "ident": 261,
-      "group": "kalman_pred",
-      "name": "predNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNX": {
-      "__class__": "LogTocElement",
-      "ident": 262,
-      "group": "kalman_pred",
-      "name": "measNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNY": {
-      "__class__": "LogTocElement",
-      "ident": 263,
-      "group": "kalman_pred",
-      "name": "measNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "lighthouse": {
-    "validAngles": {
-      "__class__": "LogTocElement",
-      "ident": 264,
-      "group": "lighthouse",
-      "name": "validAngles",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rawAngle0x": {
-      "__class__": "LogTocElement",
-      "ident": 265,
-      "group": "lighthouse",
-      "name": "rawAngle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0y": {
-      "__class__": "LogTocElement",
-      "ident": 266,
-      "group": "lighthouse",
-      "name": "rawAngle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1x": {
-      "__class__": "LogTocElement",
-      "ident": 267,
-      "group": "lighthouse",
-      "name": "rawAngle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1y": {
-      "__class__": "LogTocElement",
-      "ident": 268,
-      "group": "lighthouse",
-      "name": "rawAngle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x": {
-      "__class__": "LogTocElement",
-      "ident": 269,
-      "group": "lighthouse",
-      "name": "angle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y": {
-      "__class__": "LogTocElement",
-      "ident": 270,
-      "group": "lighthouse",
-      "name": "angle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x": {
-      "__class__": "LogTocElement",
-      "ident": 271,
-      "group": "lighthouse",
-      "name": "angle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y": {
-      "__class__": "LogTocElement",
-      "ident": 272,
-      "group": "lighthouse",
-      "name": "angle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_1": {
-      "__class__": "LogTocElement",
-      "ident": 273,
-      "group": "lighthouse",
-      "name": "angle0x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_1": {
-      "__class__": "LogTocElement",
-      "ident": 274,
-      "group": "lighthouse",
-      "name": "angle0y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_1": {
-      "__class__": "LogTocElement",
-      "ident": 275,
-      "group": "lighthouse",
-      "name": "angle1x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_1": {
-      "__class__": "LogTocElement",
-      "ident": 276,
-      "group": "lighthouse",
-      "name": "angle1y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_2": {
-      "__class__": "LogTocElement",
-      "ident": 277,
-      "group": "lighthouse",
-      "name": "angle0x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_2": {
-      "__class__": "LogTocElement",
-      "ident": 278,
-      "group": "lighthouse",
-      "name": "angle0y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_2": {
-      "__class__": "LogTocElement",
-      "ident": 279,
-      "group": "lighthouse",
-      "name": "angle1x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_2": {
-      "__class__": "LogTocElement",
-      "ident": 280,
-      "group": "lighthouse",
-      "name": "angle1y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_3": {
-      "__class__": "LogTocElement",
-      "ident": 281,
-      "group": "lighthouse",
-      "name": "angle0x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_3": {
-      "__class__": "LogTocElement",
-      "ident": 282,
-      "group": "lighthouse",
-      "name": "angle0y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_3": {
-      "__class__": "LogTocElement",
-      "ident": 283,
-      "group": "lighthouse",
-      "name": "angle1x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_3": {
-      "__class__": "LogTocElement",
-      "ident": 284,
-      "group": "lighthouse",
-      "name": "angle1y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 285,
-      "group": "lighthouse",
-      "name": "rawAngle0xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 286,
-      "group": "lighthouse",
-      "name": "rawAngle0ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 287,
-      "group": "lighthouse",
-      "name": "rawAngle1xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 288,
-      "group": "lighthouse",
-      "name": "rawAngle1ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 289,
-      "group": "lighthouse",
-      "name": "angle0x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 290,
-      "group": "lighthouse",
-      "name": "angle0y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 291,
-      "group": "lighthouse",
-      "name": "angle1x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 292,
-      "group": "lighthouse",
-      "name": "angle1y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "width0": {
-      "__class__": "LogTocElement",
-      "ident": 293,
-      "group": "lighthouse",
-      "name": "width0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width1": {
-      "__class__": "LogTocElement",
-      "ident": 294,
-      "group": "lighthouse",
-      "name": "width1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width2": {
-      "__class__": "LogTocElement",
-      "ident": 295,
-      "group": "lighthouse",
-      "name": "width2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width3": {
-      "__class__": "LogTocElement",
-      "ident": 296,
-      "group": "lighthouse",
-      "name": "width3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "comSync": {
-      "__class__": "LogTocElement",
-      "ident": 297,
-      "group": "lighthouse",
-      "name": "comSync",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "bsAvailable": {
-      "__class__": "LogTocElement",
-      "ident": 298,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsReceive": {
-      "__class__": "LogTocElement",
-      "ident": 299,
-      "group": "lighthouse",
-      "name": "bsReceive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsActive": {
-      "__class__": "LogTocElement",
-      "ident": 300,
-      "group": "lighthouse",
-      "name": "bsActive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalUd": {
-      "__class__": "LogTocElement",
-      "ident": 301,
-      "group": "lighthouse",
-      "name": "bsCalUd",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalCon": {
-      "__class__": "LogTocElement",
-      "ident": 302,
-      "group": "lighthouse",
-      "name": "bsCalCon",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "status": {
-      "__class__": "LogTocElement",
-      "ident": 303,
-      "group": "lighthouse",
-      "name": "status",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "posRt": {
-      "__class__": "LogTocElement",
-      "ident": 304,
-      "group": "lighthouse",
-      "name": "posRt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs0Rt": {
-      "__class__": "LogTocElement",
-      "ident": 305,
-      "group": "lighthouse",
-      "name": "estBs0Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs1Rt": {
-      "__class__": "LogTocElement",
-      "ident": 306,
-      "group": "lighthouse",
-      "name": "estBs1Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 307,
-      "group": "lighthouse",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 308,
-      "group": "lighthouse",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 309,
-      "group": "lighthouse",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "delta": {
-      "__class__": "LogTocElement",
-      "ident": 310,
-      "group": "lighthouse",
-      "name": "delta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bsGeoVal": {
-      "__class__": "LogTocElement",
-      "ident": 311,
-      "group": "lighthouse",
-      "name": "bsGeoVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalVal": {
-      "__class__": "LogTocElement",
-      "ident": 312,
-      "group": "lighthouse",
-      "name": "bsCalVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "disProb": {
-      "__class__": "LogTocElement",
-      "ident": 313,
-      "group": "lighthouse",
-      "name": "disProb",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_attitude": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 314,
-      "group": "pid_attitude",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 315,
-      "group": "pid_attitude",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 316,
-      "group": "pid_attitude",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 317,
-      "group": "pid_attitude",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 318,
-      "group": "pid_attitude",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 319,
-      "group": "pid_attitude",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 320,
-      "group": "pid_attitude",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 321,
-      "group": "pid_attitude",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 322,
-      "group": "pid_attitude",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 323,
-      "group": "pid_attitude",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 324,
-      "group": "pid_attitude",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 325,
-      "group": "pid_attitude",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_rate": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 326,
-      "group": "pid_rate",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 327,
-      "group": "pid_rate",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 328,
-      "group": "pid_rate",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 329,
-      "group": "pid_rate",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 330,
-      "group": "pid_rate",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 331,
-      "group": "pid_rate",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 332,
-      "group": "pid_rate",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 333,
-      "group": "pid_rate",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 334,
-      "group": "pid_rate",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 335,
-      "group": "pid_rate",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 336,
-      "group": "pid_rate",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 337,
-      "group": "pid_rate",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlINDI": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 338,
-      "group": "ctrlINDI",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 339,
-      "group": "ctrlINDI",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 340,
-      "group": "ctrlINDI",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 341,
-      "group": "ctrlINDI",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 342,
-      "group": "ctrlINDI",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 343,
-      "group": "ctrlINDI",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 344,
-      "group": "ctrlINDI",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_p": {
-      "__class__": "LogTocElement",
-      "ident": 345,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_q": {
-      "__class__": "LogTocElement",
-      "ident": 346,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_r": {
-      "__class__": "LogTocElement",
-      "ident": 347,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_p": {
-      "__class__": "LogTocElement",
-      "ident": 348,
-      "group": "ctrlINDI",
-      "name": "du_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_q": {
-      "__class__": "LogTocElement",
-      "ident": 349,
-      "group": "ctrlINDI",
-      "name": "du_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_r": {
-      "__class__": "LogTocElement",
-      "ident": 350,
-      "group": "ctrlINDI",
-      "name": "du_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_p": {
-      "__class__": "LogTocElement",
-      "ident": 351,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_q": {
-      "__class__": "LogTocElement",
-      "ident": 352,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_r": {
-      "__class__": "LogTocElement",
-      "ident": 353,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[0]": {
-      "__class__": "LogTocElement",
-      "ident": 354,
-      "group": "ctrlINDI",
-      "name": "rate_d[0]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[1]": {
-      "__class__": "LogTocElement",
-      "ident": 355,
-      "group": "ctrlINDI",
-      "name": "rate_d[1]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[2]": {
-      "__class__": "LogTocElement",
-      "ident": 356,
-      "group": "ctrlINDI",
-      "name": "rate_d[2]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_p": {
-      "__class__": "LogTocElement",
-      "ident": 357,
-      "group": "ctrlINDI",
-      "name": "uf_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_q": {
-      "__class__": "LogTocElement",
-      "ident": 358,
-      "group": "ctrlINDI",
-      "name": "uf_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_r": {
-      "__class__": "LogTocElement",
-      "ident": 359,
-      "group": "ctrlINDI",
-      "name": "uf_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_p": {
-      "__class__": "LogTocElement",
-      "ident": 360,
-      "group": "ctrlINDI",
-      "name": "Omega_f_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_q": {
-      "__class__": "LogTocElement",
-      "ident": 361,
-      "group": "ctrlINDI",
-      "name": "Omega_f_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_r": {
-      "__class__": "LogTocElement",
-      "ident": 362,
-      "group": "ctrlINDI",
-      "name": "Omega_f_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_p": {
-      "__class__": "LogTocElement",
-      "ident": 363,
-      "group": "ctrlINDI",
-      "name": "n_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_q": {
-      "__class__": "LogTocElement",
-      "ident": 364,
-      "group": "ctrlINDI",
-      "name": "n_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_r": {
-      "__class__": "LogTocElement",
-      "ident": 365,
-      "group": "ctrlINDI",
-      "name": "n_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlMel": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 366,
-      "group": "ctrlMel",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 367,
-      "group": "ctrlMel",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 368,
-      "group": "ctrlMel",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 369,
-      "group": "ctrlMel",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 370,
-      "group": "ctrlMel",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 371,
-      "group": "ctrlMel",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 372,
-      "group": "ctrlMel",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 373,
-      "group": "ctrlMel",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdx": {
-      "__class__": "LogTocElement",
-      "ident": 374,
-      "group": "ctrlMel",
-      "name": "zdx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdy": {
-      "__class__": "LogTocElement",
-      "ident": 375,
-      "group": "ctrlMel",
-      "name": "zdy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdz": {
-      "__class__": "LogTocElement",
-      "ident": 376,
-      "group": "ctrlMel",
-      "name": "zdz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_x": {
-      "__class__": "LogTocElement",
-      "ident": 377,
-      "group": "ctrlMel",
-      "name": "i_err_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_y": {
-      "__class__": "LogTocElement",
-      "ident": 378,
-      "group": "ctrlMel",
-      "name": "i_err_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_z": {
-      "__class__": "LogTocElement",
-      "ident": 379,
-      "group": "ctrlMel",
-      "name": "i_err_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtrlIndi": {
-    "posRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 380,
-      "group": "posCtrlIndi",
-      "name": "posRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 381,
-      "group": "posCtrlIndi",
-      "name": "posRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 382,
-      "group": "posCtrlIndi",
-      "name": "posRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_x": {
-      "__class__": "LogTocElement",
-      "ident": 383,
-      "group": "posCtrlIndi",
-      "name": "velS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_y": {
-      "__class__": "LogTocElement",
-      "ident": 384,
-      "group": "posCtrlIndi",
-      "name": "velS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_z": {
-      "__class__": "LogTocElement",
-      "ident": 385,
-      "group": "posCtrlIndi",
-      "name": "velS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 386,
-      "group": "posCtrlIndi",
-      "name": "velRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 387,
-      "group": "posCtrlIndi",
-      "name": "velRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 388,
-      "group": "posCtrlIndi",
-      "name": "velRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_roll": {
-      "__class__": "LogTocElement",
-      "ident": 389,
-      "group": "posCtrlIndi",
-      "name": "angS_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 390,
-      "group": "posCtrlIndi",
-      "name": "angS_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 391,
-      "group": "posCtrlIndi",
-      "name": "angS_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_roll": {
-      "__class__": "LogTocElement",
-      "ident": 392,
-      "group": "posCtrlIndi",
-      "name": "angF_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 393,
-      "group": "posCtrlIndi",
-      "name": "angF_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 394,
-      "group": "posCtrlIndi",
-      "name": "angF_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 395,
-      "group": "posCtrlIndi",
-      "name": "accRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 396,
-      "group": "posCtrlIndi",
-      "name": "accRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 397,
-      "group": "posCtrlIndi",
-      "name": "accRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_x": {
-      "__class__": "LogTocElement",
-      "ident": 398,
-      "group": "posCtrlIndi",
-      "name": "accS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_y": {
-      "__class__": "LogTocElement",
-      "ident": 399,
-      "group": "posCtrlIndi",
-      "name": "accS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_z": {
-      "__class__": "LogTocElement",
-      "ident": 400,
-      "group": "posCtrlIndi",
-      "name": "accS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_x": {
-      "__class__": "LogTocElement",
-      "ident": 401,
-      "group": "posCtrlIndi",
-      "name": "accF_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_y": {
-      "__class__": "LogTocElement",
-      "ident": 402,
-      "group": "posCtrlIndi",
-      "name": "accF_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_z": {
-      "__class__": "LogTocElement",
-      "ident": 403,
-      "group": "posCtrlIndi",
-      "name": "accF_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_x": {
-      "__class__": "LogTocElement",
-      "ident": 404,
-      "group": "posCtrlIndi",
-      "name": "accFT_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_y": {
-      "__class__": "LogTocElement",
-      "ident": 405,
-      "group": "posCtrlIndi",
-      "name": "accFT_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_z": {
-      "__class__": "LogTocElement",
-      "ident": 406,
-      "group": "posCtrlIndi",
-      "name": "accFT_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_x": {
-      "__class__": "LogTocElement",
-      "ident": 407,
-      "group": "posCtrlIndi",
-      "name": "accErr_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_y": {
-      "__class__": "LogTocElement",
-      "ident": 408,
-      "group": "posCtrlIndi",
-      "name": "accErr_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_z": {
-      "__class__": "LogTocElement",
-      "ident": 409,
-      "group": "posCtrlIndi",
-      "name": "accErr_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "phi_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 410,
-      "group": "posCtrlIndi",
-      "name": "phi_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "theta_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 411,
-      "group": "posCtrlIndi",
-      "name": "theta_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 412,
-      "group": "posCtrlIndi",
-      "name": "T_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner": {
-      "__class__": "LogTocElement",
-      "ident": 413,
-      "group": "posCtrlIndi",
-      "name": "T_inner",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner_f": {
-      "__class__": "LogTocElement",
-      "ident": 414,
-      "group": "posCtrlIndi",
-      "name": "T_inner_f",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_incremented": {
-      "__class__": "LogTocElement",
-      "ident": 415,
-      "group": "posCtrlIndi",
-      "name": "T_incremented",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_phi": {
-      "__class__": "LogTocElement",
-      "ident": 416,
-      "group": "posCtrlIndi",
-      "name": "cmd_phi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_theta": {
-      "__class__": "LogTocElement",
-      "ident": 417,
-      "group": "posCtrlIndi",
-      "name": "cmd_theta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtl": {
-    "targetVX": {
-      "__class__": "LogTocElement",
-      "ident": 418,
-      "group": "posCtl",
-      "name": "targetVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVY": {
-      "__class__": "LogTocElement",
-      "ident": 419,
-      "group": "posCtl",
-      "name": "targetVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVZ": {
-      "__class__": "LogTocElement",
-      "ident": 420,
-      "group": "posCtl",
-      "name": "targetVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetX": {
-      "__class__": "LogTocElement",
-      "ident": 421,
-      "group": "posCtl",
-      "name": "targetX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetY": {
-      "__class__": "LogTocElement",
-      "ident": 422,
-      "group": "posCtl",
-      "name": "targetY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetZ": {
-      "__class__": "LogTocElement",
-      "ident": 423,
-      "group": "posCtl",
-      "name": "targetZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVX": {
-      "__class__": "LogTocElement",
-      "ident": 424,
-      "group": "posCtl",
-      "name": "bodyVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVY": {
-      "__class__": "LogTocElement",
-      "ident": 425,
-      "group": "posCtl",
-      "name": "bodyVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyX": {
-      "__class__": "LogTocElement",
-      "ident": 426,
-      "group": "posCtl",
-      "name": "bodyX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyY": {
-      "__class__": "LogTocElement",
-      "ident": 427,
-      "group": "posCtl",
-      "name": "bodyY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xp": {
-      "__class__": "LogTocElement",
-      "ident": 428,
-      "group": "posCtl",
-      "name": "Xp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xi": {
-      "__class__": "LogTocElement",
-      "ident": 429,
-      "group": "posCtl",
-      "name": "Xi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xd": {
-      "__class__": "LogTocElement",
-      "ident": 430,
-      "group": "posCtl",
-      "name": "Xd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xff": {
-      "__class__": "LogTocElement",
-      "ident": 431,
-      "group": "posCtl",
-      "name": "Xff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yp": {
-      "__class__": "LogTocElement",
-      "ident": 432,
-      "group": "posCtl",
-      "name": "Yp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yi": {
-      "__class__": "LogTocElement",
-      "ident": 433,
-      "group": "posCtl",
-      "name": "Yi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yd": {
-      "__class__": "LogTocElement",
-      "ident": 434,
-      "group": "posCtl",
-      "name": "Yd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yff": {
-      "__class__": "LogTocElement",
-      "ident": 435,
-      "group": "posCtl",
-      "name": "Yff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zp": {
-      "__class__": "LogTocElement",
-      "ident": 436,
-      "group": "posCtl",
-      "name": "Zp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zi": {
-      "__class__": "LogTocElement",
-      "ident": 437,
-      "group": "posCtl",
-      "name": "Zi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zd": {
-      "__class__": "LogTocElement",
-      "ident": 438,
-      "group": "posCtl",
-      "name": "Zd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zff": {
-      "__class__": "LogTocElement",
-      "ident": 439,
-      "group": "posCtl",
-      "name": "Zff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXp": {
-      "__class__": "LogTocElement",
-      "ident": 440,
-      "group": "posCtl",
-      "name": "VXp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXi": {
-      "__class__": "LogTocElement",
-      "ident": 441,
-      "group": "posCtl",
-      "name": "VXi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXd": {
-      "__class__": "LogTocElement",
-      "ident": 442,
-      "group": "posCtl",
-      "name": "VXd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXff": {
-      "__class__": "LogTocElement",
-      "ident": 443,
-      "group": "posCtl",
-      "name": "VXff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYp": {
-      "__class__": "LogTocElement",
-      "ident": 444,
-      "group": "posCtl",
-      "name": "VYp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYi": {
-      "__class__": "LogTocElement",
-      "ident": 445,
-      "group": "posCtl",
-      "name": "VYi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYd": {
-      "__class__": "LogTocElement",
-      "ident": 446,
-      "group": "posCtl",
-      "name": "VYd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYff": {
-      "__class__": "LogTocElement",
-      "ident": 447,
-      "group": "posCtl",
-      "name": "VYff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZp": {
-      "__class__": "LogTocElement",
-      "ident": 448,
-      "group": "posCtl",
-      "name": "VZp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZi": {
-      "__class__": "LogTocElement",
-      "ident": 449,
-      "group": "posCtl",
-      "name": "VZi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZd": {
-      "__class__": "LogTocElement",
-      "ident": 450,
-      "group": "posCtl",
-      "name": "VZd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZff": {
-      "__class__": "LogTocElement",
-      "ident": 451,
-      "group": "posCtl",
-      "name": "VZff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman": {
-    "stateX": {
-      "__class__": "LogTocElement",
-      "ident": 452,
-      "group": "kalman",
-      "name": "stateX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateY": {
-      "__class__": "LogTocElement",
-      "ident": 453,
-      "group": "kalman",
-      "name": "stateY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateZ": {
-      "__class__": "LogTocElement",
-      "ident": 454,
-      "group": "kalman",
-      "name": "stateZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePX": {
-      "__class__": "LogTocElement",
-      "ident": 455,
-      "group": "kalman",
-      "name": "statePX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePY": {
-      "__class__": "LogTocElement",
-      "ident": 456,
-      "group": "kalman",
-      "name": "statePY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePZ": {
-      "__class__": "LogTocElement",
-      "ident": 457,
-      "group": "kalman",
-      "name": "statePZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD0": {
-      "__class__": "LogTocElement",
-      "ident": 458,
-      "group": "kalman",
-      "name": "stateD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD1": {
-      "__class__": "LogTocElement",
-      "ident": 459,
-      "group": "kalman",
-      "name": "stateD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD2": {
-      "__class__": "LogTocElement",
-      "ident": 460,
-      "group": "kalman",
-      "name": "stateD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varX": {
-      "__class__": "LogTocElement",
-      "ident": 461,
-      "group": "kalman",
-      "name": "varX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varY": {
-      "__class__": "LogTocElement",
-      "ident": 462,
-      "group": "kalman",
-      "name": "varY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varZ": {
-      "__class__": "LogTocElement",
-      "ident": 463,
-      "group": "kalman",
-      "name": "varZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPX": {
-      "__class__": "LogTocElement",
-      "ident": 464,
-      "group": "kalman",
-      "name": "varPX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPY": {
-      "__class__": "LogTocElement",
-      "ident": 465,
-      "group": "kalman",
-      "name": "varPY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPZ": {
-      "__class__": "LogTocElement",
-      "ident": 466,
-      "group": "kalman",
-      "name": "varPZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD0": {
-      "__class__": "LogTocElement",
-      "ident": 467,
-      "group": "kalman",
-      "name": "varD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD1": {
-      "__class__": "LogTocElement",
-      "ident": 468,
-      "group": "kalman",
-      "name": "varD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD2": {
-      "__class__": "LogTocElement",
-      "ident": 469,
-      "group": "kalman",
-      "name": "varD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q0": {
-      "__class__": "LogTocElement",
-      "ident": 470,
-      "group": "kalman",
-      "name": "q0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q1": {
-      "__class__": "LogTocElement",
-      "ident": 471,
-      "group": "kalman",
-      "name": "q1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q2": {
-      "__class__": "LogTocElement",
-      "ident": 472,
-      "group": "kalman",
-      "name": "q2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q3": {
-      "__class__": "LogTocElement",
-      "ident": 473,
-      "group": "kalman",
-      "name": "q3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtUpdate": {
-      "__class__": "LogTocElement",
-      "ident": 474,
-      "group": "kalman",
-      "name": "rtUpdate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtPred": {
-      "__class__": "LogTocElement",
-      "ident": 475,
-      "group": "kalman",
-      "name": "rtPred",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtFinal": {
-      "__class__": "LogTocElement",
-      "ident": 476,
-      "group": "kalman",
-      "name": "rtFinal",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "outlierf": {
-    "lhWin": {
-      "__class__": "LogTocElement",
-      "ident": 477,
-      "group": "outlierf",
-      "name": "lhWin",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "estimator": {
-    "rtApnd": {
-      "__class__": "LogTocElement",
-      "ident": 478,
-      "group": "estimator",
-      "name": "rtApnd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtRej": {
-      "__class__": "LogTocElement",
-      "ident": 479,
-      "group": "estimator",
-      "name": "rtRej",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posEstAlt": {
-    "estimatedZ": {
-      "__class__": "LogTocElement",
-      "ident": 480,
-      "group": "posEstAlt",
-      "name": "estimatedZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estVZ": {
-      "__class__": "LogTocElement",
-      "ident": 481,
-      "group": "posEstAlt",
-      "name": "estVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velocityZ": {
-      "__class__": "LogTocElement",
-      "ident": 482,
-      "group": "posEstAlt",
-      "name": "velocityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "DTR_P2P": {
-    "rx_state": {
-      "__class__": "LogTocElement",
-      "ident": 483,
-      "group": "DTR_P2P",
-      "name": "rx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "tx_state": {
-      "__class__": "LogTocElement",
-      "ident": 484,
-      "group": "DTR_P2P",
-      "name": "tx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  }
-}
\ No newline at end of file
diff --git i/src/webots_pkg/test/hardware/cache/9FA714B3.json w/src/webots_pkg/test/hardware/cache/9FA714B3.json
deleted file mode 100644
index 3c86bf4..0000000
--- i/src/webots_pkg/test/hardware/cache/9FA714B3.json
+++ /dev/null
@@ -1,2862 +0,0 @@
-{
-  "activeMarker": {
-    "front": {
-      "__class__": "ParamTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "front",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "back": {
-      "__class__": "ParamTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "back",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "left": {
-      "__class__": "ParamTocElement",
-      "ident": 2,
-      "group": "activeMarker",
-      "name": "left",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "right": {
-      "__class__": "ParamTocElement",
-      "ident": 3,
-      "group": "activeMarker",
-      "name": "right",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 4,
-      "group": "activeMarker",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "poll": {
-      "__class__": "ParamTocElement",
-      "ident": 5,
-      "group": "activeMarker",
-      "name": "poll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "deck": {
-    "bcActiveMarker": {
-      "__class__": "ParamTocElement",
-      "ident": 6,
-      "group": "deck",
-      "name": "bcActiveMarker",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcAI": {
-      "__class__": "ParamTocElement",
-      "ident": 7,
-      "group": "deck",
-      "name": "bcAI",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcBuzzer": {
-      "__class__": "ParamTocElement",
-      "ident": 8,
-      "group": "deck",
-      "name": "bcBuzzer",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow": {
-      "__class__": "ParamTocElement",
-      "ident": 9,
-      "group": "deck",
-      "name": "bcFlow",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow2": {
-      "__class__": "ParamTocElement",
-      "ident": 10,
-      "group": "deck",
-      "name": "bcFlow2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLedRing": {
-      "__class__": "ParamTocElement",
-      "ident": 11,
-      "group": "deck",
-      "name": "bcLedRing",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLighthouse4": {
-      "__class__": "ParamTocElement",
-      "ident": 12,
-      "group": "deck",
-      "name": "bcLighthouse4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcDWM1000": {
-      "__class__": "ParamTocElement",
-      "ident": 13,
-      "group": "deck",
-      "name": "bcDWM1000",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLoco": {
-      "__class__": "ParamTocElement",
-      "ident": 14,
-      "group": "deck",
-      "name": "bcLoco",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcMultiranger": {
-      "__class__": "ParamTocElement",
-      "ident": 15,
-      "group": "deck",
-      "name": "bcMultiranger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcOA": {
-      "__class__": "ParamTocElement",
-      "ident": 16,
-      "group": "deck",
-      "name": "bcOA",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcUSD": {
-      "__class__": "ParamTocElement",
-      "ident": 17,
-      "group": "deck",
-      "name": "bcUSD",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger": {
-      "__class__": "ParamTocElement",
-      "ident": 18,
-      "group": "deck",
-      "name": "bcZRanger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger2": {
-      "__class__": "ParamTocElement",
-      "ident": 19,
-      "group": "deck",
-      "name": "bcZRanger2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "motion": {
-    "disable": {
-      "__class__": "ParamTocElement",
-      "ident": 20,
-      "group": "motion",
-      "name": "disable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "adaptive": {
-      "__class__": "ParamTocElement",
-      "ident": 21,
-      "group": "motion",
-      "name": "adaptive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "flowStdFixed": {
-      "__class__": "ParamTocElement",
-      "ident": 22,
-      "group": "motion",
-      "name": "flowStdFixed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ring": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 23,
-      "group": "ring",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 24,
-      "group": "ring",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "solidRed": {
-      "__class__": "ParamTocElement",
-      "ident": 25,
-      "group": "ring",
-      "name": "solidRed",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidGreen": {
-      "__class__": "ParamTocElement",
-      "ident": 26,
-      "group": "ring",
-      "name": "solidGreen",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidBlue": {
-      "__class__": "ParamTocElement",
-      "ident": 27,
-      "group": "ring",
-      "name": "solidBlue",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "headlightEnable": {
-      "__class__": "ParamTocElement",
-      "ident": 28,
-      "group": "ring",
-      "name": "headlightEnable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "emptyCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 29,
-      "group": "ring",
-      "name": "emptyCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fullCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 30,
-      "group": "ring",
-      "name": "fullCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fadeColor": {
-      "__class__": "ParamTocElement",
-      "ident": 31,
-      "group": "ring",
-      "name": "fadeColor",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": false
-    },
-    "fadeTime": {
-      "__class__": "ParamTocElement",
-      "ident": 32,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "system": {
-    "highlight": {
-      "__class__": "ParamTocElement",
-      "ident": 33,
-      "group": "system",
-      "name": "highlight",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageStats": {
-      "__class__": "ParamTocElement",
-      "ident": 34,
-      "group": "system",
-      "name": "storageStats",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageReformat": {
-      "__class__": "ParamTocElement",
-      "ident": 35,
-      "group": "system",
-      "name": "storageReformat",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "taskDump": {
-      "__class__": "ParamTocElement",
-      "ident": 36,
-      "group": "system",
-      "name": "taskDump",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "selftestPassed": {
-      "__class__": "ParamTocElement",
-      "ident": 37,
-      "group": "system",
-      "name": "selftestPassed",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 1,
-      "extended": false
-    },
-    "forceArm": {
-      "__class__": "ParamTocElement",
-      "ident": 38,
-      "group": "system",
-      "name": "forceArm",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "assertInfo": {
-      "__class__": "ParamTocElement",
-      "ident": 39,
-      "group": "system",
-      "name": "assertInfo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "testLogParam": {
-      "__class__": "ParamTocElement",
-      "ident": 40,
-      "group": "system",
-      "name": "testLogParam",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 41,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa2": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 42,
-      "group": "tdoa2",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa3": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 43,
-      "group": "tdoa3",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "multiranger": {
-    "filterMask": {
-      "__class__": "ParamTocElement",
-      "ident": 44,
-      "group": "multiranger",
-      "name": "filterMask",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usd": {
-    "canLog": {
-      "__class__": "ParamTocElement",
-      "ident": 45,
-      "group": "usd",
-      "name": "canLog",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "logging": {
-      "__class__": "ParamTocElement",
-      "ident": 46,
-      "group": "usd",
-      "name": "logging",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "led": {
-    "bitmask": {
-      "__class__": "ParamTocElement",
-      "ident": 47,
-      "group": "led",
-      "name": "bitmask",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "motorPowerSet": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 48,
-      "group": "motorPowerSet",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "m1": {
-      "__class__": "ParamTocElement",
-      "ident": 49,
-      "group": "motorPowerSet",
-      "name": "m1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m2": {
-      "__class__": "ParamTocElement",
-      "ident": 50,
-      "group": "motorPowerSet",
-      "name": "m2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m3": {
-      "__class__": "ParamTocElement",
-      "ident": 51,
-      "group": "motorPowerSet",
-      "name": "m3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m4": {
-      "__class__": "ParamTocElement",
-      "ident": 52,
-      "group": "motorPowerSet",
-      "name": "m4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pm": {
-    "lowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 53,
-      "group": "pm",
-      "name": "lowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "criticalLowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 54,
-      "group": "pm",
-      "name": "criticalLowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "imu_sensors": {
-    "BMP388": {
-      "__class__": "ParamTocElement",
-      "ident": 55,
-      "group": "imu_sensors",
-      "name": "BMP388",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 56,
-      "group": "imu_sensors",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 57,
-      "group": "imu_sensors",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 58,
-      "group": "imu_sensors",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 59,
-      "group": "imu_sensors",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 60,
-      "group": "imu_sensors",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "imu_tests": {
-    "MPU6500": {
-      "__class__": "ParamTocElement",
-      "ident": 61,
-      "group": "imu_tests",
-      "name": "MPU6500",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 62,
-      "group": "imu_tests",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 63,
-      "group": "imu_tests",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 64,
-      "group": "imu_tests",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 65,
-      "group": "imu_tests",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 66,
-      "group": "imu_tests",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "syslink": {
-    "probe": {
-      "__class__": "ParamTocElement",
-      "ident": 67,
-      "group": "syslink",
-      "name": "probe",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usec": {
-    "reset": {
-      "__class__": "ParamTocElement",
-      "ident": 68,
-      "group": "usec",
-      "name": "reset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "colAv": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 69,
-      "group": "colAv",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidX": {
-      "__class__": "ParamTocElement",
-      "ident": 70,
-      "group": "colAv",
-      "name": "ellipsoidX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidY": {
-      "__class__": "ParamTocElement",
-      "ident": 71,
-      "group": "colAv",
-      "name": "ellipsoidY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidZ": {
-      "__class__": "ParamTocElement",
-      "ident": 72,
-      "group": "colAv",
-      "name": "ellipsoidZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinX": {
-      "__class__": "ParamTocElement",
-      "ident": 73,
-      "group": "colAv",
-      "name": "bboxMinX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinY": {
-      "__class__": "ParamTocElement",
-      "ident": 74,
-      "group": "colAv",
-      "name": "bboxMinY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinZ": {
-      "__class__": "ParamTocElement",
-      "ident": 75,
-      "group": "colAv",
-      "name": "bboxMinZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxX": {
-      "__class__": "ParamTocElement",
-      "ident": 76,
-      "group": "colAv",
-      "name": "bboxMaxX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxY": {
-      "__class__": "ParamTocElement",
-      "ident": 77,
-      "group": "colAv",
-      "name": "bboxMaxY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxZ": {
-      "__class__": "ParamTocElement",
-      "ident": 78,
-      "group": "colAv",
-      "name": "bboxMaxZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "horizon": {
-      "__class__": "ParamTocElement",
-      "ident": 79,
-      "group": "colAv",
-      "name": "horizon",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxSpeed": {
-      "__class__": "ParamTocElement",
-      "ident": 80,
-      "group": "colAv",
-      "name": "maxSpeed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sidestepThrsh": {
-      "__class__": "ParamTocElement",
-      "ident": 81,
-      "group": "colAv",
-      "name": "sidestepThrsh",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxPeerLocAge": {
-      "__class__": "ParamTocElement",
-      "ident": 82,
-      "group": "colAv",
-      "name": "maxPeerLocAge",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    },
-    "vorTol": {
-      "__class__": "ParamTocElement",
-      "ident": 83,
-      "group": "colAv",
-      "name": "vorTol",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vorIters": {
-      "__class__": "ParamTocElement",
-      "ident": 84,
-      "group": "colAv",
-      "name": "vorIters",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "commander": {
-    "enHighLevel": {
-      "__class__": "ParamTocElement",
-      "ident": 85,
-      "group": "commander",
-      "name": "enHighLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cppm": {
-    "rateRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 86,
-      "group": "cppm",
-      "name": "rateRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ratePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 87,
-      "group": "cppm",
-      "name": "ratePitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angPitch": {
-      "__class__": "ParamTocElement",
-      "ident": 88,
-      "group": "cppm",
-      "name": "angPitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 89,
-      "group": "cppm",
-      "name": "angRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 90,
-      "group": "cppm",
-      "name": "rateYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "hlCommander": {
-    "vtoff": {
-      "__class__": "ParamTocElement",
-      "ident": 91,
-      "group": "hlCommander",
-      "name": "vtoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vland": {
-      "__class__": "ParamTocElement",
-      "ident": 92,
-      "group": "hlCommander",
-      "name": "vland",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "flightmode": {
-    "althold": {
-      "__class__": "ParamTocElement",
-      "ident": 93,
-      "group": "flightmode",
-      "name": "althold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "poshold": {
-      "__class__": "ParamTocElement",
-      "ident": 94,
-      "group": "flightmode",
-      "name": "poshold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "posSet": {
-      "__class__": "ParamTocElement",
-      "ident": 95,
-      "group": "flightmode",
-      "name": "posSet",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "yawMode": {
-      "__class__": "ParamTocElement",
-      "ident": 96,
-      "group": "flightmode",
-      "name": "yawMode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 97,
-      "group": "flightmode",
-      "name": "stabModeRoll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 98,
-      "group": "flightmode",
-      "name": "stabModePitch",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 99,
-      "group": "flightmode",
-      "name": "stabModeYaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "locSrv": {
-    "enRangeStreamFP32": {
-      "__class__": "ParamTocElement",
-      "ident": 100,
-      "group": "locSrv",
-      "name": "enRangeStreamFP32",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "enLhAngleStream": {
-      "__class__": "ParamTocElement",
-      "ident": 101,
-      "group": "locSrv",
-      "name": "enLhAngleStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "extPosStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 102,
-      "group": "locSrv",
-      "name": "extPosStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "extQuatStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 103,
-      "group": "locSrv",
-      "name": "extQuatStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "crtpsrv": {
-    "echoDelay": {
-      "__class__": "ParamTocElement",
-      "ident": 104,
-      "group": "crtpsrv",
-      "name": "echoDelay",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "health": {
-    "startPropTest": {
-      "__class__": "ParamTocElement",
-      "ident": 105,
-      "group": "health",
-      "name": "startPropTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "startBatTest": {
-      "__class__": "ParamTocElement",
-      "ident": 106,
-      "group": "health",
-      "name": "startBatTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "propTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 107,
-      "group": "health",
-      "name": "propTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "batTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 108,
-      "group": "health",
-      "name": "batTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "kalman": {
-    "maxPos": {
-      "__class__": "ParamTocElement",
-      "ident": 109,
-      "group": "kalman",
-      "name": "maxPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxVel": {
-      "__class__": "ParamTocElement",
-      "ident": 110,
-      "group": "kalman",
-      "name": "maxVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "resetEstimation": {
-      "__class__": "ParamTocElement",
-      "ident": 111,
-      "group": "kalman",
-      "name": "resetEstimation",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTdoa": {
-      "__class__": "ParamTocElement",
-      "ident": 112,
-      "group": "kalman",
-      "name": "robustTdoa",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTwr": {
-      "__class__": "ParamTocElement",
-      "ident": 113,
-      "group": "kalman",
-      "name": "robustTwr",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "pNAcc_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 114,
-      "group": "kalman",
-      "name": "pNAcc_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAcc_z": {
-      "__class__": "ParamTocElement",
-      "ident": 115,
-      "group": "kalman",
-      "name": "pNAcc_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNVel": {
-      "__class__": "ParamTocElement",
-      "ident": 116,
-      "group": "kalman",
-      "name": "pNVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNPos": {
-      "__class__": "ParamTocElement",
-      "ident": 117,
-      "group": "kalman",
-      "name": "pNPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAtt": {
-      "__class__": "ParamTocElement",
-      "ident": 118,
-      "group": "kalman",
-      "name": "pNAtt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNBaro": {
-      "__class__": "ParamTocElement",
-      "ident": 119,
-      "group": "kalman",
-      "name": "mNBaro",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_rollpitch": {
-      "__class__": "ParamTocElement",
-      "ident": 120,
-      "group": "kalman",
-      "name": "mNGyro_rollpitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_yaw": {
-      "__class__": "ParamTocElement",
-      "ident": 121,
-      "group": "kalman",
-      "name": "mNGyro_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "initialX": {
-      "__class__": "ParamTocElement",
-      "ident": 122,
-      "group": "kalman",
-      "name": "initialX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialY": {
-      "__class__": "ParamTocElement",
-      "ident": 123,
-      "group": "kalman",
-      "name": "initialY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialZ": {
-      "__class__": "ParamTocElement",
-      "ident": 124,
-      "group": "kalman",
-      "name": "initialZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 125,
-      "group": "kalman",
-      "name": "initialYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "memTst": {
-    "resetW": {
-      "__class__": "ParamTocElement",
-      "ident": 126,
-      "group": "memTst",
-      "name": "resetW",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "powerDist": {
-    "idleThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 127,
-      "group": "powerDist",
-      "name": "idleThrust",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "quadSysId": {
-    "thrustToTorque": {
-      "__class__": "ParamTocElement",
-      "ident": 128,
-      "group": "quadSysId",
-      "name": "thrustToTorque",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustA": {
-      "__class__": "ParamTocElement",
-      "ident": 129,
-      "group": "quadSysId",
-      "name": "pwmToThrustA",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustB": {
-      "__class__": "ParamTocElement",
-      "ident": 130,
-      "group": "quadSysId",
-      "name": "pwmToThrustB",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "armLength": {
-      "__class__": "ParamTocElement",
-      "ident": 131,
-      "group": "quadSysId",
-      "name": "armLength",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sensfusion6": {
-    "kp": {
-      "__class__": "ParamTocElement",
-      "ident": 132,
-      "group": "sensfusion6",
-      "name": "kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki": {
-      "__class__": "ParamTocElement",
-      "ident": 133,
-      "group": "sensfusion6",
-      "name": "ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "baseZacc": {
-      "__class__": "ParamTocElement",
-      "ident": 134,
-      "group": "sensfusion6",
-      "name": "baseZacc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sound": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 135,
-      "group": "sound",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 136,
-      "group": "sound",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "freq": {
-      "__class__": "ParamTocElement",
-      "ident": 137,
-      "group": "sound",
-      "name": "freq",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "stabilizer": {
-    "estimator": {
-      "__class__": "ParamTocElement",
-      "ident": 138,
-      "group": "stabilizer",
-      "name": "estimator",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "controller": {
-      "__class__": "ParamTocElement",
-      "ident": 139,
-      "group": "stabilizer",
-      "name": "controller",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stop": {
-      "__class__": "ParamTocElement",
-      "ident": 140,
-      "group": "stabilizer",
-      "name": "stop",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cpu": {
-    "flash": {
-      "__class__": "ParamTocElement",
-      "ident": 141,
-      "group": "cpu",
-      "name": "flash",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "id0": {
-      "__class__": "ParamTocElement",
-      "ident": 142,
-      "group": "cpu",
-      "name": "id0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id1": {
-      "__class__": "ParamTocElement",
-      "ident": 143,
-      "group": "cpu",
-      "name": "id1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id2": {
-      "__class__": "ParamTocElement",
-      "ident": 144,
-      "group": "cpu",
-      "name": "id2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "tdoaEngine": {
-    "logId": {
-      "__class__": "ParamTocElement",
-      "ident": 145,
-      "group": "tdoaEngine",
-      "name": "logId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "logOthrId": {
-      "__class__": "ParamTocElement",
-      "ident": 146,
-      "group": "tdoaEngine",
-      "name": "logOthrId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "matchAlgo": {
-      "__class__": "ParamTocElement",
-      "ident": 147,
-      "group": "tdoaEngine",
-      "name": "matchAlgo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "lighthouse": {
-    "method": {
-      "__class__": "ParamTocElement",
-      "ident": 148,
-      "group": "lighthouse",
-      "name": "method",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsCalibReset": {
-      "__class__": "ParamTocElement",
-      "ident": 149,
-      "group": "lighthouse",
-      "name": "bsCalibReset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "systemType": {
-      "__class__": "ParamTocElement",
-      "ident": 150,
-      "group": "lighthouse",
-      "name": "systemType",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsAvailable": {
-      "__class__": "ParamTocElement",
-      "ident": 151,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "sweepStd": {
-      "__class__": "ParamTocElement",
-      "ident": 152,
-      "group": "lighthouse",
-      "name": "sweepStd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sweepStd2": {
-      "__class__": "ParamTocElement",
-      "ident": 153,
-      "group": "lighthouse",
-      "name": "sweepStd2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "enLhRawStream": {
-      "__class__": "ParamTocElement",
-      "ident": 154,
-      "group": "lighthouse",
-      "name": "enLhRawStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "lh2maxRate": {
-      "__class__": "ParamTocElement",
-      "ident": 155,
-      "group": "lighthouse",
-      "name": "lh2maxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pid_attitude": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 156,
-      "group": "pid_attitude",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 157,
-      "group": "pid_attitude",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 158,
-      "group": "pid_attitude",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 159,
-      "group": "pid_attitude",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 160,
-      "group": "pid_attitude",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 161,
-      "group": "pid_attitude",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 162,
-      "group": "pid_attitude",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 163,
-      "group": "pid_attitude",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 164,
-      "group": "pid_attitude",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 165,
-      "group": "pid_attitude",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 166,
-      "group": "pid_attitude",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 167,
-      "group": "pid_attitude",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yawMaxDelta": {
-      "__class__": "ParamTocElement",
-      "ident": 168,
-      "group": "pid_attitude",
-      "name": "yawMaxDelta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 169,
-      "group": "pid_attitude",
-      "name": "attFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 170,
-      "group": "pid_attitude",
-      "name": "attFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "pid_rate": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 171,
-      "group": "pid_rate",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 172,
-      "group": "pid_rate",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 173,
-      "group": "pid_rate",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 174,
-      "group": "pid_rate",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 175,
-      "group": "pid_rate",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 176,
-      "group": "pid_rate",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 177,
-      "group": "pid_rate",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 178,
-      "group": "pid_rate",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 179,
-      "group": "pid_rate",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 180,
-      "group": "pid_rate",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 181,
-      "group": "pid_rate",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 182,
-      "group": "pid_rate",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 183,
-      "group": "pid_rate",
-      "name": "rateFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "omxFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 184,
-      "group": "pid_rate",
-      "name": "omxFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omyFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 185,
-      "group": "pid_rate",
-      "name": "omyFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omzFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 186,
-      "group": "pid_rate",
-      "name": "omzFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlINDI": {
-    "thrust_threshold": {
-      "__class__": "ParamTocElement",
-      "ident": 187,
-      "group": "ctrlINDI",
-      "name": "thrust_threshold",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bound_ctrl_input": {
-      "__class__": "ParamTocElement",
-      "ident": 188,
-      "group": "ctrlINDI",
-      "name": "bound_ctrl_input",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_p": {
-      "__class__": "ParamTocElement",
-      "ident": 189,
-      "group": "ctrlINDI",
-      "name": "g1_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_q": {
-      "__class__": "ParamTocElement",
-      "ident": 190,
-      "group": "ctrlINDI",
-      "name": "g1_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_r": {
-      "__class__": "ParamTocElement",
-      "ident": 191,
-      "group": "ctrlINDI",
-      "name": "g1_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g2": {
-      "__class__": "ParamTocElement",
-      "ident": 192,
-      "group": "ctrlINDI",
-      "name": "g2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_p": {
-      "__class__": "ParamTocElement",
-      "ident": 193,
-      "group": "ctrlINDI",
-      "name": "ref_err_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_q": {
-      "__class__": "ParamTocElement",
-      "ident": 194,
-      "group": "ctrlINDI",
-      "name": "ref_err_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_r": {
-      "__class__": "ParamTocElement",
-      "ident": 195,
-      "group": "ctrlINDI",
-      "name": "ref_err_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_p": {
-      "__class__": "ParamTocElement",
-      "ident": 196,
-      "group": "ctrlINDI",
-      "name": "ref_rate_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_q": {
-      "__class__": "ParamTocElement",
-      "ident": 197,
-      "group": "ctrlINDI",
-      "name": "ref_rate_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_r": {
-      "__class__": "ParamTocElement",
-      "ident": 198,
-      "group": "ctrlINDI",
-      "name": "ref_rate_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_p": {
-      "__class__": "ParamTocElement",
-      "ident": 199,
-      "group": "ctrlINDI",
-      "name": "act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_q": {
-      "__class__": "ParamTocElement",
-      "ident": 200,
-      "group": "ctrlINDI",
-      "name": "act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_r": {
-      "__class__": "ParamTocElement",
-      "ident": 201,
-      "group": "ctrlINDI",
-      "name": "act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff": {
-      "__class__": "ParamTocElement",
-      "ident": 202,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff_r": {
-      "__class__": "ParamTocElement",
-      "ident": 203,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "outerLoopActive": {
-      "__class__": "ParamTocElement",
-      "ident": 204,
-      "group": "ctrlINDI",
-      "name": "outerLoopActive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ctrlMel": {
-    "kp_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 205,
-      "group": "ctrlMel",
-      "name": "kp_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 206,
-      "group": "ctrlMel",
-      "name": "kd_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 207,
-      "group": "ctrlMel",
-      "name": "ki_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 208,
-      "group": "ctrlMel",
-      "name": "i_range_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kp_z": {
-      "__class__": "ParamTocElement",
-      "ident": 209,
-      "group": "ctrlMel",
-      "name": "kp_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_z": {
-      "__class__": "ParamTocElement",
-      "ident": 210,
-      "group": "ctrlMel",
-      "name": "kd_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_z": {
-      "__class__": "ParamTocElement",
-      "ident": 211,
-      "group": "ctrlMel",
-      "name": "ki_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_z": {
-      "__class__": "ParamTocElement",
-      "ident": 212,
-      "group": "ctrlMel",
-      "name": "i_range_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mass": {
-      "__class__": "ParamTocElement",
-      "ident": 213,
-      "group": "ctrlMel",
-      "name": "mass",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "massThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 214,
-      "group": "ctrlMel",
-      "name": "massThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 215,
-      "group": "ctrlMel",
-      "name": "kR_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_z": {
-      "__class__": "ParamTocElement",
-      "ident": 216,
-      "group": "ctrlMel",
-      "name": "kR_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 217,
-      "group": "ctrlMel",
-      "name": "kw_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_z": {
-      "__class__": "ParamTocElement",
-      "ident": 218,
-      "group": "ctrlMel",
-      "name": "kw_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 219,
-      "group": "ctrlMel",
-      "name": "ki_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 220,
-      "group": "ctrlMel",
-      "name": "ki_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_omega_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 221,
-      "group": "ctrlMel",
-      "name": "kd_omega_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 222,
-      "group": "ctrlMel",
-      "name": "i_range_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 223,
-      "group": "ctrlMel",
-      "name": "i_range_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlAtt": {
-    "tau_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 224,
-      "group": "ctrlAtt",
-      "name": "tau_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 225,
-      "group": "ctrlAtt",
-      "name": "zeta_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_z": {
-      "__class__": "ParamTocElement",
-      "ident": 226,
-      "group": "ctrlAtt",
-      "name": "tau_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_z": {
-      "__class__": "ParamTocElement",
-      "ident": 227,
-      "group": "ctrlAtt",
-      "name": "zeta_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 228,
-      "group": "ctrlAtt",
-      "name": "tau_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "mixing_factor": {
-      "__class__": "ParamTocElement",
-      "ident": 229,
-      "group": "ctrlAtt",
-      "name": "mixing_factor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "coll_fairness": {
-      "__class__": "ParamTocElement",
-      "ident": 230,
-      "group": "ctrlAtt",
-      "name": "coll_fairness",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "posCtrlIndi": {
-    "K_xi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 231,
-      "group": "posCtrlIndi",
-      "name": "K_xi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 232,
-      "group": "posCtrlIndi",
-      "name": "K_xi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 233,
-      "group": "posCtrlIndi",
-      "name": "K_xi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 234,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 235,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 236,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pq_clamping": {
-      "__class__": "ParamTocElement",
-      "ident": 237,
-      "group": "posCtrlIndi",
-      "name": "pq_clamping",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "posCtlPid": {
-    "xKp": {
-      "__class__": "ParamTocElement",
-      "ident": 238,
-      "group": "posCtlPid",
-      "name": "xKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKi": {
-      "__class__": "ParamTocElement",
-      "ident": 239,
-      "group": "posCtlPid",
-      "name": "xKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKd": {
-      "__class__": "ParamTocElement",
-      "ident": 240,
-      "group": "posCtlPid",
-      "name": "xKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKff": {
-      "__class__": "ParamTocElement",
-      "ident": 241,
-      "group": "posCtlPid",
-      "name": "xKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKp": {
-      "__class__": "ParamTocElement",
-      "ident": 242,
-      "group": "posCtlPid",
-      "name": "yKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKi": {
-      "__class__": "ParamTocElement",
-      "ident": 243,
-      "group": "posCtlPid",
-      "name": "yKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKd": {
-      "__class__": "ParamTocElement",
-      "ident": 244,
-      "group": "posCtlPid",
-      "name": "yKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKff": {
-      "__class__": "ParamTocElement",
-      "ident": 245,
-      "group": "posCtlPid",
-      "name": "yKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKp": {
-      "__class__": "ParamTocElement",
-      "ident": 246,
-      "group": "posCtlPid",
-      "name": "zKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKi": {
-      "__class__": "ParamTocElement",
-      "ident": 247,
-      "group": "posCtlPid",
-      "name": "zKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKd": {
-      "__class__": "ParamTocElement",
-      "ident": 248,
-      "group": "posCtlPid",
-      "name": "zKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKff": {
-      "__class__": "ParamTocElement",
-      "ident": 249,
-      "group": "posCtlPid",
-      "name": "zKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "thrustBase": {
-      "__class__": "ParamTocElement",
-      "ident": 250,
-      "group": "posCtlPid",
-      "name": "thrustBase",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "thrustMin": {
-      "__class__": "ParamTocElement",
-      "ident": 251,
-      "group": "posCtlPid",
-      "name": "thrustMin",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "rLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 252,
-      "group": "posCtlPid",
-      "name": "rLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 253,
-      "group": "posCtlPid",
-      "name": "pLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 254,
-      "group": "posCtlPid",
-      "name": "xVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 255,
-      "group": "posCtlPid",
-      "name": "yVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 256,
-      "group": "posCtlPid",
-      "name": "zVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "velCtlPid": {
-    "vxKp": {
-      "__class__": "ParamTocElement",
-      "ident": 257,
-      "group": "velCtlPid",
-      "name": "vxKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKi": {
-      "__class__": "ParamTocElement",
-      "ident": 258,
-      "group": "velCtlPid",
-      "name": "vxKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKd": {
-      "__class__": "ParamTocElement",
-      "ident": 259,
-      "group": "velCtlPid",
-      "name": "vxKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 260,
-      "group": "velCtlPid",
-      "name": "vxKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKp": {
-      "__class__": "ParamTocElement",
-      "ident": 261,
-      "group": "velCtlPid",
-      "name": "vyKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKi": {
-      "__class__": "ParamTocElement",
-      "ident": 262,
-      "group": "velCtlPid",
-      "name": "vyKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKd": {
-      "__class__": "ParamTocElement",
-      "ident": 263,
-      "group": "velCtlPid",
-      "name": "vyKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 264,
-      "group": "velCtlPid",
-      "name": "vyKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKp": {
-      "__class__": "ParamTocElement",
-      "ident": 265,
-      "group": "velCtlPid",
-      "name": "vzKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKi": {
-      "__class__": "ParamTocElement",
-      "ident": 266,
-      "group": "velCtlPid",
-      "name": "vzKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKd": {
-      "__class__": "ParamTocElement",
-      "ident": 267,
-      "group": "velCtlPid",
-      "name": "vzKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 268,
-      "group": "velCtlPid",
-      "name": "vzKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "posEstAlt": {
-    "estAlphaAsl": {
-      "__class__": "ParamTocElement",
-      "ident": 269,
-      "group": "posEstAlt",
-      "name": "estAlphaAsl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "estAlphaZr": {
-      "__class__": "ParamTocElement",
-      "ident": 270,
-      "group": "posEstAlt",
-      "name": "estAlphaZr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velFactor": {
-      "__class__": "ParamTocElement",
-      "ident": 271,
-      "group": "posEstAlt",
-      "name": "velFactor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velZAlpha": {
-      "__class__": "ParamTocElement",
-      "ident": 272,
-      "group": "posEstAlt",
-      "name": "velZAlpha",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vAccDeadband": {
-      "__class__": "ParamTocElement",
-      "ident": 273,
-      "group": "posEstAlt",
-      "name": "vAccDeadband",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "firmware": {
-    "revision0": {
-      "__class__": "ParamTocElement",
-      "ident": 274,
-      "group": "firmware",
-      "name": "revision0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "revision1": {
-      "__class__": "ParamTocElement",
-      "ident": 275,
-      "group": "firmware",
-      "name": "revision1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "modified": {
-      "__class__": "ParamTocElement",
-      "ident": 276,
-      "group": "firmware",
-      "name": "modified",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  }
-}
\ No newline at end of file
diff --git i/src/webots_pkg/test/software/cache/39041F30.json w/src/webots_pkg/test/software/cache/39041F30.json
deleted file mode 100644
index ea9e30f..0000000
--- i/src/webots_pkg/test/software/cache/39041F30.json
+++ /dev/null
@@ -1,4463 +0,0 @@
-{
-  "activeMarker": {
-    "btSns": {
-      "__class__": "LogTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "btSns",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "i2cOk": {
-      "__class__": "LogTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "i2cOk",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "motion": {
-    "motion": {
-      "__class__": "LogTocElement",
-      "ident": 2,
-      "group": "motion",
-      "name": "motion",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "deltaX": {
-      "__class__": "LogTocElement",
-      "ident": 3,
-      "group": "motion",
-      "name": "deltaX",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "deltaY": {
-      "__class__": "LogTocElement",
-      "ident": 4,
-      "group": "motion",
-      "name": "deltaY",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "shutter": {
-      "__class__": "LogTocElement",
-      "ident": 5,
-      "group": "motion",
-      "name": "shutter",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "maxRaw": {
-      "__class__": "LogTocElement",
-      "ident": 6,
-      "group": "motion",
-      "name": "maxRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "minRaw": {
-      "__class__": "LogTocElement",
-      "ident": 7,
-      "group": "motion",
-      "name": "minRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Rawsum": {
-      "__class__": "LogTocElement",
-      "ident": 8,
-      "group": "motion",
-      "name": "Rawsum",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "outlierCount": {
-      "__class__": "LogTocElement",
-      "ident": 9,
-      "group": "motion",
-      "name": "outlierCount",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "squal": {
-      "__class__": "LogTocElement",
-      "ident": 10,
-      "group": "motion",
-      "name": "squal",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "std": {
-      "__class__": "LogTocElement",
-      "ident": 11,
-      "group": "motion",
-      "name": "std",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ring": {
-    "fadeTime": {
-      "__class__": "LogTocElement",
-      "ident": 12,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "LogTocElement",
-      "ident": 13,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "spiWr": {
-      "__class__": "LogTocElement",
-      "ident": 14,
-      "group": "loco",
-      "name": "spiWr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiRe": {
-      "__class__": "LogTocElement",
-      "ident": 15,
-      "group": "loco",
-      "name": "spiRe",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ranging": {
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 16,
-      "group": "ranging",
-      "name": "state",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "distance0": {
-      "__class__": "LogTocElement",
-      "ident": 17,
-      "group": "ranging",
-      "name": "distance0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance1": {
-      "__class__": "LogTocElement",
-      "ident": 18,
-      "group": "ranging",
-      "name": "distance1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance2": {
-      "__class__": "LogTocElement",
-      "ident": 19,
-      "group": "ranging",
-      "name": "distance2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance3": {
-      "__class__": "LogTocElement",
-      "ident": 20,
-      "group": "ranging",
-      "name": "distance3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance4": {
-      "__class__": "LogTocElement",
-      "ident": 21,
-      "group": "ranging",
-      "name": "distance4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance5": {
-      "__class__": "LogTocElement",
-      "ident": 22,
-      "group": "ranging",
-      "name": "distance5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance6": {
-      "__class__": "LogTocElement",
-      "ident": 23,
-      "group": "ranging",
-      "name": "distance6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance7": {
-      "__class__": "LogTocElement",
-      "ident": 24,
-      "group": "ranging",
-      "name": "distance7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure0": {
-      "__class__": "LogTocElement",
-      "ident": 25,
-      "group": "ranging",
-      "name": "pressure0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure1": {
-      "__class__": "LogTocElement",
-      "ident": 26,
-      "group": "ranging",
-      "name": "pressure1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure2": {
-      "__class__": "LogTocElement",
-      "ident": 27,
-      "group": "ranging",
-      "name": "pressure2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure3": {
-      "__class__": "LogTocElement",
-      "ident": 28,
-      "group": "ranging",
-      "name": "pressure3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure4": {
-      "__class__": "LogTocElement",
-      "ident": 29,
-      "group": "ranging",
-      "name": "pressure4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure5": {
-      "__class__": "LogTocElement",
-      "ident": 30,
-      "group": "ranging",
-      "name": "pressure5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure6": {
-      "__class__": "LogTocElement",
-      "ident": 31,
-      "group": "ranging",
-      "name": "pressure6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure7": {
-      "__class__": "LogTocElement",
-      "ident": 32,
-      "group": "ranging",
-      "name": "pressure7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "tdoa2": {
-    "d7-0": {
-      "__class__": "LogTocElement",
-      "ident": 33,
-      "group": "tdoa2",
-      "name": "d7-0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d0-1": {
-      "__class__": "LogTocElement",
-      "ident": 34,
-      "group": "tdoa2",
-      "name": "d0-1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d1-2": {
-      "__class__": "LogTocElement",
-      "ident": 35,
-      "group": "tdoa2",
-      "name": "d1-2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d2-3": {
-      "__class__": "LogTocElement",
-      "ident": 36,
-      "group": "tdoa2",
-      "name": "d2-3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d3-4": {
-      "__class__": "LogTocElement",
-      "ident": 37,
-      "group": "tdoa2",
-      "name": "d3-4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d4-5": {
-      "__class__": "LogTocElement",
-      "ident": 38,
-      "group": "tdoa2",
-      "name": "d4-5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d5-6": {
-      "__class__": "LogTocElement",
-      "ident": 39,
-      "group": "tdoa2",
-      "name": "d5-6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d6-7": {
-      "__class__": "LogTocElement",
-      "ident": 40,
-      "group": "tdoa2",
-      "name": "d6-7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc0": {
-      "__class__": "LogTocElement",
-      "ident": 41,
-      "group": "tdoa2",
-      "name": "cc0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc1": {
-      "__class__": "LogTocElement",
-      "ident": 42,
-      "group": "tdoa2",
-      "name": "cc1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc2": {
-      "__class__": "LogTocElement",
-      "ident": 43,
-      "group": "tdoa2",
-      "name": "cc2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc3": {
-      "__class__": "LogTocElement",
-      "ident": 44,
-      "group": "tdoa2",
-      "name": "cc3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc4": {
-      "__class__": "LogTocElement",
-      "ident": 45,
-      "group": "tdoa2",
-      "name": "cc4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc5": {
-      "__class__": "LogTocElement",
-      "ident": 46,
-      "group": "tdoa2",
-      "name": "cc5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc6": {
-      "__class__": "LogTocElement",
-      "ident": 47,
-      "group": "tdoa2",
-      "name": "cc6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc7": {
-      "__class__": "LogTocElement",
-      "ident": 48,
-      "group": "tdoa2",
-      "name": "cc7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "dist7-0": {
-      "__class__": "LogTocElement",
-      "ident": 49,
-      "group": "tdoa2",
-      "name": "dist7-0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist0-1": {
-      "__class__": "LogTocElement",
-      "ident": 50,
-      "group": "tdoa2",
-      "name": "dist0-1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist1-2": {
-      "__class__": "LogTocElement",
-      "ident": 51,
-      "group": "tdoa2",
-      "name": "dist1-2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist2-3": {
-      "__class__": "LogTocElement",
-      "ident": 52,
-      "group": "tdoa2",
-      "name": "dist2-3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist3-4": {
-      "__class__": "LogTocElement",
-      "ident": 53,
-      "group": "tdoa2",
-      "name": "dist3-4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist4-5": {
-      "__class__": "LogTocElement",
-      "ident": 54,
-      "group": "tdoa2",
-      "name": "dist4-5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist5-6": {
-      "__class__": "LogTocElement",
-      "ident": 55,
-      "group": "tdoa2",
-      "name": "dist5-6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist6-7": {
-      "__class__": "LogTocElement",
-      "ident": 56,
-      "group": "tdoa2",
-      "name": "dist6-7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "twr": {
-    "rangingSuccessRate0": {
-      "__class__": "LogTocElement",
-      "ident": 57,
-      "group": "twr",
-      "name": "rangingSuccessRate0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec0": {
-      "__class__": "LogTocElement",
-      "ident": 58,
-      "group": "twr",
-      "name": "rangingPerSec0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate1": {
-      "__class__": "LogTocElement",
-      "ident": 59,
-      "group": "twr",
-      "name": "rangingSuccessRate1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec1": {
-      "__class__": "LogTocElement",
-      "ident": 60,
-      "group": "twr",
-      "name": "rangingPerSec1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate2": {
-      "__class__": "LogTocElement",
-      "ident": 61,
-      "group": "twr",
-      "name": "rangingSuccessRate2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec2": {
-      "__class__": "LogTocElement",
-      "ident": 62,
-      "group": "twr",
-      "name": "rangingPerSec2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate3": {
-      "__class__": "LogTocElement",
-      "ident": 63,
-      "group": "twr",
-      "name": "rangingSuccessRate3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec3": {
-      "__class__": "LogTocElement",
-      "ident": 64,
-      "group": "twr",
-      "name": "rangingPerSec3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate4": {
-      "__class__": "LogTocElement",
-      "ident": 65,
-      "group": "twr",
-      "name": "rangingSuccessRate4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec4": {
-      "__class__": "LogTocElement",
-      "ident": 66,
-      "group": "twr",
-      "name": "rangingPerSec4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate5": {
-      "__class__": "LogTocElement",
-      "ident": 67,
-      "group": "twr",
-      "name": "rangingSuccessRate5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec5": {
-      "__class__": "LogTocElement",
-      "ident": 68,
-      "group": "twr",
-      "name": "rangingPerSec5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "oa": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 69,
-      "group": "oa",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 70,
-      "group": "oa",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 71,
-      "group": "oa",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 72,
-      "group": "oa",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 73,
-      "group": "oa",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "usd": {
-    "spiWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 74,
-      "group": "usd",
-      "name": "spiWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiReBps": {
-      "__class__": "LogTocElement",
-      "ident": 75,
-      "group": "usd",
-      "name": "spiReBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "fatWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 76,
-      "group": "usd",
-      "name": "fatWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "motor": {
-    "m1": {
-      "__class__": "LogTocElement",
-      "ident": 77,
-      "group": "motor",
-      "name": "m1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m2": {
-      "__class__": "LogTocElement",
-      "ident": 78,
-      "group": "motor",
-      "name": "m2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m3": {
-      "__class__": "LogTocElement",
-      "ident": 79,
-      "group": "motor",
-      "name": "m3",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m4": {
-      "__class__": "LogTocElement",
-      "ident": 80,
-      "group": "motor",
-      "name": "m4",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m1req": {
-      "__class__": "LogTocElement",
-      "ident": 81,
-      "group": "motor",
-      "name": "m1req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m2req": {
-      "__class__": "LogTocElement",
-      "ident": 82,
-      "group": "motor",
-      "name": "m2req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m3req": {
-      "__class__": "LogTocElement",
-      "ident": 83,
-      "group": "motor",
-      "name": "m3req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m4req": {
-      "__class__": "LogTocElement",
-      "ident": 84,
-      "group": "motor",
-      "name": "m4req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "pm": {
-    "vbat": {
-      "__class__": "LogTocElement",
-      "ident": 85,
-      "group": "pm",
-      "name": "vbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 86,
-      "group": "pm",
-      "name": "vbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extVbat": {
-      "__class__": "LogTocElement",
-      "ident": 87,
-      "group": "pm",
-      "name": "extVbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "extVbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 88,
-      "group": "pm",
-      "name": "extVbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extCurr": {
-      "__class__": "LogTocElement",
-      "ident": 89,
-      "group": "pm",
-      "name": "extCurr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "chargeCurrent": {
-      "__class__": "LogTocElement",
-      "ident": 90,
-      "group": "pm",
-      "name": "chargeCurrent",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 91,
-      "group": "pm",
-      "name": "state",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    },
-    "batteryLevel": {
-      "__class__": "LogTocElement",
-      "ident": 92,
-      "group": "pm",
-      "name": "batteryLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "radio": {
-    "rssi": {
-      "__class__": "LogTocElement",
-      "ident": 93,
-      "group": "radio",
-      "name": "rssi",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isConnected": {
-      "__class__": "LogTocElement",
-      "ident": 94,
-      "group": "radio",
-      "name": "isConnected",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "gyro": {
-    "xRaw": {
-      "__class__": "LogTocElement",
-      "ident": 95,
-      "group": "gyro",
-      "name": "xRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "yRaw": {
-      "__class__": "LogTocElement",
-      "ident": 96,
-      "group": "gyro",
-      "name": "yRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "zRaw": {
-      "__class__": "LogTocElement",
-      "ident": 97,
-      "group": "gyro",
-      "name": "zRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "xVariance": {
-      "__class__": "LogTocElement",
-      "ident": 98,
-      "group": "gyro",
-      "name": "xVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yVariance": {
-      "__class__": "LogTocElement",
-      "ident": 99,
-      "group": "gyro",
-      "name": "yVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVariance": {
-      "__class__": "LogTocElement",
-      "ident": 100,
-      "group": "gyro",
-      "name": "zVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 101,
-      "group": "gyro",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 102,
-      "group": "gyro",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 103,
-      "group": "gyro",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "colAv": {
-    "latency": {
-      "__class__": "LogTocElement",
-      "ident": 104,
-      "group": "colAv",
-      "name": "latency",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "ext_pos": {
-    "X": {
-      "__class__": "LogTocElement",
-      "ident": 105,
-      "group": "ext_pos",
-      "name": "X",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Y": {
-      "__class__": "LogTocElement",
-      "ident": 106,
-      "group": "ext_pos",
-      "name": "Y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Z": {
-      "__class__": "LogTocElement",
-      "ident": 107,
-      "group": "ext_pos",
-      "name": "Z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrv": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 108,
-      "group": "locSrv",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 109,
-      "group": "locSrv",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 110,
-      "group": "locSrv",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 111,
-      "group": "locSrv",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 112,
-      "group": "locSrv",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 113,
-      "group": "locSrv",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 114,
-      "group": "locSrv",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrvZ": {
-    "tick": {
-      "__class__": "LogTocElement",
-      "ident": 115,
-      "group": "locSrvZ",
-      "name": "tick",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "crtp": {
-    "rxRate": {
-      "__class__": "LogTocElement",
-      "ident": 116,
-      "group": "crtp",
-      "name": "rxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "txRate": {
-      "__class__": "LogTocElement",
-      "ident": 117,
-      "group": "crtp",
-      "name": "txRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "extrx": {
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 118,
-      "group": "extrx",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 119,
-      "group": "extrx",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 120,
-      "group": "extrx",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 121,
-      "group": "extrx",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 122,
-      "group": "extrx",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 123,
-      "group": "extrx",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVel": {
-      "__class__": "LogTocElement",
-      "ident": 124,
-      "group": "extrx",
-      "name": "zVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "AltHold": {
-      "__class__": "LogTocElement",
-      "ident": 125,
-      "group": "extrx",
-      "name": "AltHold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Arm": {
-      "__class__": "LogTocElement",
-      "ident": 126,
-      "group": "extrx",
-      "name": "Arm",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "extrx_raw": {
-    "ch0": {
-      "__class__": "LogTocElement",
-      "ident": 127,
-      "group": "extrx_raw",
-      "name": "ch0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch1": {
-      "__class__": "LogTocElement",
-      "ident": 128,
-      "group": "extrx_raw",
-      "name": "ch1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch2": {
-      "__class__": "LogTocElement",
-      "ident": 129,
-      "group": "extrx_raw",
-      "name": "ch2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch3": {
-      "__class__": "LogTocElement",
-      "ident": 130,
-      "group": "extrx_raw",
-      "name": "ch3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch4": {
-      "__class__": "LogTocElement",
-      "ident": 131,
-      "group": "extrx_raw",
-      "name": "ch4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch5": {
-      "__class__": "LogTocElement",
-      "ident": 132,
-      "group": "extrx_raw",
-      "name": "ch5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch6": {
-      "__class__": "LogTocElement",
-      "ident": 133,
-      "group": "extrx_raw",
-      "name": "ch6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch7": {
-      "__class__": "LogTocElement",
-      "ident": 134,
-      "group": "extrx_raw",
-      "name": "ch7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "health": {
-    "motorVarXM1": {
-      "__class__": "LogTocElement",
-      "ident": 135,
-      "group": "health",
-      "name": "motorVarXM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM1": {
-      "__class__": "LogTocElement",
-      "ident": 136,
-      "group": "health",
-      "name": "motorVarYM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM2": {
-      "__class__": "LogTocElement",
-      "ident": 137,
-      "group": "health",
-      "name": "motorVarXM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM2": {
-      "__class__": "LogTocElement",
-      "ident": 138,
-      "group": "health",
-      "name": "motorVarYM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM3": {
-      "__class__": "LogTocElement",
-      "ident": 139,
-      "group": "health",
-      "name": "motorVarXM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM3": {
-      "__class__": "LogTocElement",
-      "ident": 140,
-      "group": "health",
-      "name": "motorVarYM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM4": {
-      "__class__": "LogTocElement",
-      "ident": 141,
-      "group": "health",
-      "name": "motorVarXM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM4": {
-      "__class__": "LogTocElement",
-      "ident": 142,
-      "group": "health",
-      "name": "motorVarYM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorPass": {
-      "__class__": "LogTocElement",
-      "ident": 143,
-      "group": "health",
-      "name": "motorPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "batterySag": {
-      "__class__": "LogTocElement",
-      "ident": 144,
-      "group": "health",
-      "name": "batterySag",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "batteryPass": {
-      "__class__": "LogTocElement",
-      "ident": 145,
-      "group": "health",
-      "name": "batteryPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "motorTestCount": {
-      "__class__": "LogTocElement",
-      "ident": 146,
-      "group": "health",
-      "name": "motorTestCount",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "memTst": {
-    "errCntW": {
-      "__class__": "LogTocElement",
-      "ident": 147,
-      "group": "memTst",
-      "name": "errCntW",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "range": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 148,
-      "group": "range",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 149,
-      "group": "range",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 150,
-      "group": "range",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 151,
-      "group": "range",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 152,
-      "group": "range",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "zrange": {
-      "__class__": "LogTocElement",
-      "ident": 153,
-      "group": "range",
-      "name": "zrange",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "sensfusion6": {
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 154,
-      "group": "sensfusion6",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 155,
-      "group": "sensfusion6",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 156,
-      "group": "sensfusion6",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 157,
-      "group": "sensfusion6",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityX": {
-      "__class__": "LogTocElement",
-      "ident": 158,
-      "group": "sensfusion6",
-      "name": "gravityX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityY": {
-      "__class__": "LogTocElement",
-      "ident": 159,
-      "group": "sensfusion6",
-      "name": "gravityY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityZ": {
-      "__class__": "LogTocElement",
-      "ident": 160,
-      "group": "sensfusion6",
-      "name": "gravityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accZbase": {
-      "__class__": "LogTocElement",
-      "ident": 161,
-      "group": "sensfusion6",
-      "name": "accZbase",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "isInit": {
-      "__class__": "LogTocElement",
-      "ident": 162,
-      "group": "sensfusion6",
-      "name": "isInit",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isCalibrated": {
-      "__class__": "LogTocElement",
-      "ident": 163,
-      "group": "sensfusion6",
-      "name": "isCalibrated",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "acc": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 164,
-      "group": "acc",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 165,
-      "group": "acc",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 166,
-      "group": "acc",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "baro": {
-    "asl": {
-      "__class__": "LogTocElement",
-      "ident": 167,
-      "group": "baro",
-      "name": "asl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "temp": {
-      "__class__": "LogTocElement",
-      "ident": 168,
-      "group": "baro",
-      "name": "temp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure": {
-      "__class__": "LogTocElement",
-      "ident": 169,
-      "group": "baro",
-      "name": "pressure",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "controller": {
-    "ctr_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 170,
-      "group": "controller",
-      "name": "ctr_yaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 171,
-      "group": "controller",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 172,
-      "group": "controller",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 173,
-      "group": "controller",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 174,
-      "group": "controller",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 175,
-      "group": "controller",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 176,
-      "group": "controller",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 177,
-      "group": "controller",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 178,
-      "group": "controller",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "actuatorThrust": {
-      "__class__": "LogTocElement",
-      "ident": 179,
-      "group": "controller",
-      "name": "actuatorThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 180,
-      "group": "controller",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 181,
-      "group": "controller",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 182,
-      "group": "controller",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 183,
-      "group": "controller",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 184,
-      "group": "controller",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 185,
-      "group": "controller",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrltarget": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 186,
-      "group": "ctrltarget",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 187,
-      "group": "ctrltarget",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 188,
-      "group": "ctrltarget",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 189,
-      "group": "ctrltarget",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 190,
-      "group": "ctrltarget",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 191,
-      "group": "ctrltarget",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 192,
-      "group": "ctrltarget",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 193,
-      "group": "ctrltarget",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 194,
-      "group": "ctrltarget",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 195,
-      "group": "ctrltarget",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 196,
-      "group": "ctrltarget",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 197,
-      "group": "ctrltarget",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrltargetZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 198,
-      "group": "ctrltargetZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 199,
-      "group": "ctrltargetZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 200,
-      "group": "ctrltargetZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 201,
-      "group": "ctrltargetZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 202,
-      "group": "ctrltargetZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 203,
-      "group": "ctrltargetZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 204,
-      "group": "ctrltargetZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 205,
-      "group": "ctrltargetZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 206,
-      "group": "ctrltargetZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "mag": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 207,
-      "group": "mag",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 208,
-      "group": "mag",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 209,
-      "group": "mag",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stabilizer": {
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 210,
-      "group": "stabilizer",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 211,
-      "group": "stabilizer",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 212,
-      "group": "stabilizer",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 213,
-      "group": "stabilizer",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtStab": {
-      "__class__": "LogTocElement",
-      "ident": 214,
-      "group": "stabilizer",
-      "name": "rtStab",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "intToOut": {
-      "__class__": "LogTocElement",
-      "ident": 215,
-      "group": "stabilizer",
-      "name": "intToOut",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "stateEstimate": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 216,
-      "group": "stateEstimate",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 217,
-      "group": "stateEstimate",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 218,
-      "group": "stateEstimate",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 219,
-      "group": "stateEstimate",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 220,
-      "group": "stateEstimate",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 221,
-      "group": "stateEstimate",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 222,
-      "group": "stateEstimate",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 223,
-      "group": "stateEstimate",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 224,
-      "group": "stateEstimate",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 225,
-      "group": "stateEstimate",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 226,
-      "group": "stateEstimate",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 227,
-      "group": "stateEstimate",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 228,
-      "group": "stateEstimate",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 229,
-      "group": "stateEstimate",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 230,
-      "group": "stateEstimate",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 231,
-      "group": "stateEstimate",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stateEstimateZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 232,
-      "group": "stateEstimateZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 233,
-      "group": "stateEstimateZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 234,
-      "group": "stateEstimateZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 235,
-      "group": "stateEstimateZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 236,
-      "group": "stateEstimateZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 237,
-      "group": "stateEstimateZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 238,
-      "group": "stateEstimateZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 239,
-      "group": "stateEstimateZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 240,
-      "group": "stateEstimateZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "quat": {
-      "__class__": "LogTocElement",
-      "ident": 241,
-      "group": "stateEstimateZ",
-      "name": "quat",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "rateRoll": {
-      "__class__": "LogTocElement",
-      "ident": 242,
-      "group": "stateEstimateZ",
-      "name": "rateRoll",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ratePitch": {
-      "__class__": "LogTocElement",
-      "ident": 243,
-      "group": "stateEstimateZ",
-      "name": "ratePitch",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "rateYaw": {
-      "__class__": "LogTocElement",
-      "ident": 244,
-      "group": "stateEstimateZ",
-      "name": "rateYaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "sys": {
-    "canfly": {
-      "__class__": "LogTocElement",
-      "ident": 245,
-      "group": "sys",
-      "name": "canfly",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isFlying": {
-      "__class__": "LogTocElement",
-      "ident": 246,
-      "group": "sys",
-      "name": "isFlying",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isTumbled": {
-      "__class__": "LogTocElement",
-      "ident": 247,
-      "group": "sys",
-      "name": "isTumbled",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "armed": {
-      "__class__": "LogTocElement",
-      "ident": 248,
-      "group": "sys",
-      "name": "armed",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    },
-    "testLogParam": {
-      "__class__": "LogTocElement",
-      "ident": 249,
-      "group": "sys",
-      "name": "testLogParam",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    }
-  },
-  "tdoaEngine": {
-    "stRx": {
-      "__class__": "LogTocElement",
-      "ident": 250,
-      "group": "tdoaEngine",
-      "name": "stRx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stEst": {
-      "__class__": "LogTocElement",
-      "ident": 251,
-      "group": "tdoaEngine",
-      "name": "stEst",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stTime": {
-      "__class__": "LogTocElement",
-      "ident": 252,
-      "group": "tdoaEngine",
-      "name": "stTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stFound": {
-      "__class__": "LogTocElement",
-      "ident": 253,
-      "group": "tdoaEngine",
-      "name": "stFound",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stCc": {
-      "__class__": "LogTocElement",
-      "ident": 254,
-      "group": "tdoaEngine",
-      "name": "stCc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stHit": {
-      "__class__": "LogTocElement",
-      "ident": 255,
-      "group": "tdoaEngine",
-      "name": "stHit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stMiss": {
-      "__class__": "LogTocElement",
-      "ident": 256,
-      "group": "tdoaEngine",
-      "name": "stMiss",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc": {
-      "__class__": "LogTocElement",
-      "ident": 257,
-      "group": "tdoaEngine",
-      "name": "cc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "tof": {
-      "__class__": "LogTocElement",
-      "ident": 258,
-      "group": "tdoaEngine",
-      "name": "tof",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "tdoa": {
-      "__class__": "LogTocElement",
-      "ident": 259,
-      "group": "tdoaEngine",
-      "name": "tdoa",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman_pred": {
-    "predNX": {
-      "__class__": "LogTocElement",
-      "ident": 260,
-      "group": "kalman_pred",
-      "name": "predNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "predNY": {
-      "__class__": "LogTocElement",
-      "ident": 261,
-      "group": "kalman_pred",
-      "name": "predNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNX": {
-      "__class__": "LogTocElement",
-      "ident": 262,
-      "group": "kalman_pred",
-      "name": "measNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNY": {
-      "__class__": "LogTocElement",
-      "ident": 263,
-      "group": "kalman_pred",
-      "name": "measNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "lighthouse": {
-    "validAngles": {
-      "__class__": "LogTocElement",
-      "ident": 264,
-      "group": "lighthouse",
-      "name": "validAngles",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rawAngle0x": {
-      "__class__": "LogTocElement",
-      "ident": 265,
-      "group": "lighthouse",
-      "name": "rawAngle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0y": {
-      "__class__": "LogTocElement",
-      "ident": 266,
-      "group": "lighthouse",
-      "name": "rawAngle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1x": {
-      "__class__": "LogTocElement",
-      "ident": 267,
-      "group": "lighthouse",
-      "name": "rawAngle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1y": {
-      "__class__": "LogTocElement",
-      "ident": 268,
-      "group": "lighthouse",
-      "name": "rawAngle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x": {
-      "__class__": "LogTocElement",
-      "ident": 269,
-      "group": "lighthouse",
-      "name": "angle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y": {
-      "__class__": "LogTocElement",
-      "ident": 270,
-      "group": "lighthouse",
-      "name": "angle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x": {
-      "__class__": "LogTocElement",
-      "ident": 271,
-      "group": "lighthouse",
-      "name": "angle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y": {
-      "__class__": "LogTocElement",
-      "ident": 272,
-      "group": "lighthouse",
-      "name": "angle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_1": {
-      "__class__": "LogTocElement",
-      "ident": 273,
-      "group": "lighthouse",
-      "name": "angle0x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_1": {
-      "__class__": "LogTocElement",
-      "ident": 274,
-      "group": "lighthouse",
-      "name": "angle0y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_1": {
-      "__class__": "LogTocElement",
-      "ident": 275,
-      "group": "lighthouse",
-      "name": "angle1x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_1": {
-      "__class__": "LogTocElement",
-      "ident": 276,
-      "group": "lighthouse",
-      "name": "angle1y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_2": {
-      "__class__": "LogTocElement",
-      "ident": 277,
-      "group": "lighthouse",
-      "name": "angle0x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_2": {
-      "__class__": "LogTocElement",
-      "ident": 278,
-      "group": "lighthouse",
-      "name": "angle0y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_2": {
-      "__class__": "LogTocElement",
-      "ident": 279,
-      "group": "lighthouse",
-      "name": "angle1x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_2": {
-      "__class__": "LogTocElement",
-      "ident": 280,
-      "group": "lighthouse",
-      "name": "angle1y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_3": {
-      "__class__": "LogTocElement",
-      "ident": 281,
-      "group": "lighthouse",
-      "name": "angle0x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_3": {
-      "__class__": "LogTocElement",
-      "ident": 282,
-      "group": "lighthouse",
-      "name": "angle0y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_3": {
-      "__class__": "LogTocElement",
-      "ident": 283,
-      "group": "lighthouse",
-      "name": "angle1x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_3": {
-      "__class__": "LogTocElement",
-      "ident": 284,
-      "group": "lighthouse",
-      "name": "angle1y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 285,
-      "group": "lighthouse",
-      "name": "rawAngle0xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 286,
-      "group": "lighthouse",
-      "name": "rawAngle0ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 287,
-      "group": "lighthouse",
-      "name": "rawAngle1xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 288,
-      "group": "lighthouse",
-      "name": "rawAngle1ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 289,
-      "group": "lighthouse",
-      "name": "angle0x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 290,
-      "group": "lighthouse",
-      "name": "angle0y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 291,
-      "group": "lighthouse",
-      "name": "angle1x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 292,
-      "group": "lighthouse",
-      "name": "angle1y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "width0": {
-      "__class__": "LogTocElement",
-      "ident": 293,
-      "group": "lighthouse",
-      "name": "width0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width1": {
-      "__class__": "LogTocElement",
-      "ident": 294,
-      "group": "lighthouse",
-      "name": "width1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width2": {
-      "__class__": "LogTocElement",
-      "ident": 295,
-      "group": "lighthouse",
-      "name": "width2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width3": {
-      "__class__": "LogTocElement",
-      "ident": 296,
-      "group": "lighthouse",
-      "name": "width3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "comSync": {
-      "__class__": "LogTocElement",
-      "ident": 297,
-      "group": "lighthouse",
-      "name": "comSync",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "bsAvailable": {
-      "__class__": "LogTocElement",
-      "ident": 298,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsReceive": {
-      "__class__": "LogTocElement",
-      "ident": 299,
-      "group": "lighthouse",
-      "name": "bsReceive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsActive": {
-      "__class__": "LogTocElement",
-      "ident": 300,
-      "group": "lighthouse",
-      "name": "bsActive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalUd": {
-      "__class__": "LogTocElement",
-      "ident": 301,
-      "group": "lighthouse",
-      "name": "bsCalUd",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalCon": {
-      "__class__": "LogTocElement",
-      "ident": 302,
-      "group": "lighthouse",
-      "name": "bsCalCon",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "status": {
-      "__class__": "LogTocElement",
-      "ident": 303,
-      "group": "lighthouse",
-      "name": "status",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "posRt": {
-      "__class__": "LogTocElement",
-      "ident": 304,
-      "group": "lighthouse",
-      "name": "posRt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs0Rt": {
-      "__class__": "LogTocElement",
-      "ident": 305,
-      "group": "lighthouse",
-      "name": "estBs0Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs1Rt": {
-      "__class__": "LogTocElement",
-      "ident": 306,
-      "group": "lighthouse",
-      "name": "estBs1Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 307,
-      "group": "lighthouse",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 308,
-      "group": "lighthouse",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 309,
-      "group": "lighthouse",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "delta": {
-      "__class__": "LogTocElement",
-      "ident": 310,
-      "group": "lighthouse",
-      "name": "delta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bsGeoVal": {
-      "__class__": "LogTocElement",
-      "ident": 311,
-      "group": "lighthouse",
-      "name": "bsGeoVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalVal": {
-      "__class__": "LogTocElement",
-      "ident": 312,
-      "group": "lighthouse",
-      "name": "bsCalVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "disProb": {
-      "__class__": "LogTocElement",
-      "ident": 313,
-      "group": "lighthouse",
-      "name": "disProb",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_attitude": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 314,
-      "group": "pid_attitude",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 315,
-      "group": "pid_attitude",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 316,
-      "group": "pid_attitude",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 317,
-      "group": "pid_attitude",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 318,
-      "group": "pid_attitude",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 319,
-      "group": "pid_attitude",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 320,
-      "group": "pid_attitude",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 321,
-      "group": "pid_attitude",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 322,
-      "group": "pid_attitude",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 323,
-      "group": "pid_attitude",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 324,
-      "group": "pid_attitude",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 325,
-      "group": "pid_attitude",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_rate": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 326,
-      "group": "pid_rate",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 327,
-      "group": "pid_rate",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 328,
-      "group": "pid_rate",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 329,
-      "group": "pid_rate",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 330,
-      "group": "pid_rate",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 331,
-      "group": "pid_rate",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 332,
-      "group": "pid_rate",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 333,
-      "group": "pid_rate",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 334,
-      "group": "pid_rate",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 335,
-      "group": "pid_rate",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 336,
-      "group": "pid_rate",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 337,
-      "group": "pid_rate",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlINDI": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 338,
-      "group": "ctrlINDI",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 339,
-      "group": "ctrlINDI",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 340,
-      "group": "ctrlINDI",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 341,
-      "group": "ctrlINDI",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 342,
-      "group": "ctrlINDI",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 343,
-      "group": "ctrlINDI",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 344,
-      "group": "ctrlINDI",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_p": {
-      "__class__": "LogTocElement",
-      "ident": 345,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_q": {
-      "__class__": "LogTocElement",
-      "ident": 346,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_r": {
-      "__class__": "LogTocElement",
-      "ident": 347,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_p": {
-      "__class__": "LogTocElement",
-      "ident": 348,
-      "group": "ctrlINDI",
-      "name": "du_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_q": {
-      "__class__": "LogTocElement",
-      "ident": 349,
-      "group": "ctrlINDI",
-      "name": "du_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_r": {
-      "__class__": "LogTocElement",
-      "ident": 350,
-      "group": "ctrlINDI",
-      "name": "du_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_p": {
-      "__class__": "LogTocElement",
-      "ident": 351,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_q": {
-      "__class__": "LogTocElement",
-      "ident": 352,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_r": {
-      "__class__": "LogTocElement",
-      "ident": 353,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[0]": {
-      "__class__": "LogTocElement",
-      "ident": 354,
-      "group": "ctrlINDI",
-      "name": "rate_d[0]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[1]": {
-      "__class__": "LogTocElement",
-      "ident": 355,
-      "group": "ctrlINDI",
-      "name": "rate_d[1]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[2]": {
-      "__class__": "LogTocElement",
-      "ident": 356,
-      "group": "ctrlINDI",
-      "name": "rate_d[2]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_p": {
-      "__class__": "LogTocElement",
-      "ident": 357,
-      "group": "ctrlINDI",
-      "name": "uf_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_q": {
-      "__class__": "LogTocElement",
-      "ident": 358,
-      "group": "ctrlINDI",
-      "name": "uf_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_r": {
-      "__class__": "LogTocElement",
-      "ident": 359,
-      "group": "ctrlINDI",
-      "name": "uf_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_p": {
-      "__class__": "LogTocElement",
-      "ident": 360,
-      "group": "ctrlINDI",
-      "name": "Omega_f_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_q": {
-      "__class__": "LogTocElement",
-      "ident": 361,
-      "group": "ctrlINDI",
-      "name": "Omega_f_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_r": {
-      "__class__": "LogTocElement",
-      "ident": 362,
-      "group": "ctrlINDI",
-      "name": "Omega_f_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_p": {
-      "__class__": "LogTocElement",
-      "ident": 363,
-      "group": "ctrlINDI",
-      "name": "n_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_q": {
-      "__class__": "LogTocElement",
-      "ident": 364,
-      "group": "ctrlINDI",
-      "name": "n_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_r": {
-      "__class__": "LogTocElement",
-      "ident": 365,
-      "group": "ctrlINDI",
-      "name": "n_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlMel": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 366,
-      "group": "ctrlMel",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 367,
-      "group": "ctrlMel",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 368,
-      "group": "ctrlMel",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 369,
-      "group": "ctrlMel",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 370,
-      "group": "ctrlMel",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 371,
-      "group": "ctrlMel",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 372,
-      "group": "ctrlMel",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 373,
-      "group": "ctrlMel",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdx": {
-      "__class__": "LogTocElement",
-      "ident": 374,
-      "group": "ctrlMel",
-      "name": "zdx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdy": {
-      "__class__": "LogTocElement",
-      "ident": 375,
-      "group": "ctrlMel",
-      "name": "zdy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdz": {
-      "__class__": "LogTocElement",
-      "ident": 376,
-      "group": "ctrlMel",
-      "name": "zdz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_x": {
-      "__class__": "LogTocElement",
-      "ident": 377,
-      "group": "ctrlMel",
-      "name": "i_err_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_y": {
-      "__class__": "LogTocElement",
-      "ident": 378,
-      "group": "ctrlMel",
-      "name": "i_err_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_z": {
-      "__class__": "LogTocElement",
-      "ident": 379,
-      "group": "ctrlMel",
-      "name": "i_err_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtrlIndi": {
-    "posRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 380,
-      "group": "posCtrlIndi",
-      "name": "posRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 381,
-      "group": "posCtrlIndi",
-      "name": "posRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 382,
-      "group": "posCtrlIndi",
-      "name": "posRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_x": {
-      "__class__": "LogTocElement",
-      "ident": 383,
-      "group": "posCtrlIndi",
-      "name": "velS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_y": {
-      "__class__": "LogTocElement",
-      "ident": 384,
-      "group": "posCtrlIndi",
-      "name": "velS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_z": {
-      "__class__": "LogTocElement",
-      "ident": 385,
-      "group": "posCtrlIndi",
-      "name": "velS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 386,
-      "group": "posCtrlIndi",
-      "name": "velRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 387,
-      "group": "posCtrlIndi",
-      "name": "velRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 388,
-      "group": "posCtrlIndi",
-      "name": "velRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_roll": {
-      "__class__": "LogTocElement",
-      "ident": 389,
-      "group": "posCtrlIndi",
-      "name": "angS_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 390,
-      "group": "posCtrlIndi",
-      "name": "angS_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 391,
-      "group": "posCtrlIndi",
-      "name": "angS_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_roll": {
-      "__class__": "LogTocElement",
-      "ident": 392,
-      "group": "posCtrlIndi",
-      "name": "angF_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 393,
-      "group": "posCtrlIndi",
-      "name": "angF_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 394,
-      "group": "posCtrlIndi",
-      "name": "angF_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 395,
-      "group": "posCtrlIndi",
-      "name": "accRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 396,
-      "group": "posCtrlIndi",
-      "name": "accRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 397,
-      "group": "posCtrlIndi",
-      "name": "accRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_x": {
-      "__class__": "LogTocElement",
-      "ident": 398,
-      "group": "posCtrlIndi",
-      "name": "accS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_y": {
-      "__class__": "LogTocElement",
-      "ident": 399,
-      "group": "posCtrlIndi",
-      "name": "accS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_z": {
-      "__class__": "LogTocElement",
-      "ident": 400,
-      "group": "posCtrlIndi",
-      "name": "accS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_x": {
-      "__class__": "LogTocElement",
-      "ident": 401,
-      "group": "posCtrlIndi",
-      "name": "accF_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_y": {
-      "__class__": "LogTocElement",
-      "ident": 402,
-      "group": "posCtrlIndi",
-      "name": "accF_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_z": {
-      "__class__": "LogTocElement",
-      "ident": 403,
-      "group": "posCtrlIndi",
-      "name": "accF_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_x": {
-      "__class__": "LogTocElement",
-      "ident": 404,
-      "group": "posCtrlIndi",
-      "name": "accFT_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_y": {
-      "__class__": "LogTocElement",
-      "ident": 405,
-      "group": "posCtrlIndi",
-      "name": "accFT_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_z": {
-      "__class__": "LogTocElement",
-      "ident": 406,
-      "group": "posCtrlIndi",
-      "name": "accFT_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_x": {
-      "__class__": "LogTocElement",
-      "ident": 407,
-      "group": "posCtrlIndi",
-      "name": "accErr_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_y": {
-      "__class__": "LogTocElement",
-      "ident": 408,
-      "group": "posCtrlIndi",
-      "name": "accErr_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_z": {
-      "__class__": "LogTocElement",
-      "ident": 409,
-      "group": "posCtrlIndi",
-      "name": "accErr_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "phi_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 410,
-      "group": "posCtrlIndi",
-      "name": "phi_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "theta_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 411,
-      "group": "posCtrlIndi",
-      "name": "theta_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 412,
-      "group": "posCtrlIndi",
-      "name": "T_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner": {
-      "__class__": "LogTocElement",
-      "ident": 413,
-      "group": "posCtrlIndi",
-      "name": "T_inner",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner_f": {
-      "__class__": "LogTocElement",
-      "ident": 414,
-      "group": "posCtrlIndi",
-      "name": "T_inner_f",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_incremented": {
-      "__class__": "LogTocElement",
-      "ident": 415,
-      "group": "posCtrlIndi",
-      "name": "T_incremented",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_phi": {
-      "__class__": "LogTocElement",
-      "ident": 416,
-      "group": "posCtrlIndi",
-      "name": "cmd_phi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_theta": {
-      "__class__": "LogTocElement",
-      "ident": 417,
-      "group": "posCtrlIndi",
-      "name": "cmd_theta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtl": {
-    "targetVX": {
-      "__class__": "LogTocElement",
-      "ident": 418,
-      "group": "posCtl",
-      "name": "targetVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVY": {
-      "__class__": "LogTocElement",
-      "ident": 419,
-      "group": "posCtl",
-      "name": "targetVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVZ": {
-      "__class__": "LogTocElement",
-      "ident": 420,
-      "group": "posCtl",
-      "name": "targetVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetX": {
-      "__class__": "LogTocElement",
-      "ident": 421,
-      "group": "posCtl",
-      "name": "targetX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetY": {
-      "__class__": "LogTocElement",
-      "ident": 422,
-      "group": "posCtl",
-      "name": "targetY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetZ": {
-      "__class__": "LogTocElement",
-      "ident": 423,
-      "group": "posCtl",
-      "name": "targetZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVX": {
-      "__class__": "LogTocElement",
-      "ident": 424,
-      "group": "posCtl",
-      "name": "bodyVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVY": {
-      "__class__": "LogTocElement",
-      "ident": 425,
-      "group": "posCtl",
-      "name": "bodyVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyX": {
-      "__class__": "LogTocElement",
-      "ident": 426,
-      "group": "posCtl",
-      "name": "bodyX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyY": {
-      "__class__": "LogTocElement",
-      "ident": 427,
-      "group": "posCtl",
-      "name": "bodyY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xp": {
-      "__class__": "LogTocElement",
-      "ident": 428,
-      "group": "posCtl",
-      "name": "Xp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xi": {
-      "__class__": "LogTocElement",
-      "ident": 429,
-      "group": "posCtl",
-      "name": "Xi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xd": {
-      "__class__": "LogTocElement",
-      "ident": 430,
-      "group": "posCtl",
-      "name": "Xd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xff": {
-      "__class__": "LogTocElement",
-      "ident": 431,
-      "group": "posCtl",
-      "name": "Xff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yp": {
-      "__class__": "LogTocElement",
-      "ident": 432,
-      "group": "posCtl",
-      "name": "Yp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yi": {
-      "__class__": "LogTocElement",
-      "ident": 433,
-      "group": "posCtl",
-      "name": "Yi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yd": {
-      "__class__": "LogTocElement",
-      "ident": 434,
-      "group": "posCtl",
-      "name": "Yd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yff": {
-      "__class__": "LogTocElement",
-      "ident": 435,
-      "group": "posCtl",
-      "name": "Yff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zp": {
-      "__class__": "LogTocElement",
-      "ident": 436,
-      "group": "posCtl",
-      "name": "Zp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zi": {
-      "__class__": "LogTocElement",
-      "ident": 437,
-      "group": "posCtl",
-      "name": "Zi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zd": {
-      "__class__": "LogTocElement",
-      "ident": 438,
-      "group": "posCtl",
-      "name": "Zd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zff": {
-      "__class__": "LogTocElement",
-      "ident": 439,
-      "group": "posCtl",
-      "name": "Zff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXp": {
-      "__class__": "LogTocElement",
-      "ident": 440,
-      "group": "posCtl",
-      "name": "VXp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXi": {
-      "__class__": "LogTocElement",
-      "ident": 441,
-      "group": "posCtl",
-      "name": "VXi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXd": {
-      "__class__": "LogTocElement",
-      "ident": 442,
-      "group": "posCtl",
-      "name": "VXd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXff": {
-      "__class__": "LogTocElement",
-      "ident": 443,
-      "group": "posCtl",
-      "name": "VXff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYp": {
-      "__class__": "LogTocElement",
-      "ident": 444,
-      "group": "posCtl",
-      "name": "VYp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYi": {
-      "__class__": "LogTocElement",
-      "ident": 445,
-      "group": "posCtl",
-      "name": "VYi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYd": {
-      "__class__": "LogTocElement",
-      "ident": 446,
-      "group": "posCtl",
-      "name": "VYd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYff": {
-      "__class__": "LogTocElement",
-      "ident": 447,
-      "group": "posCtl",
-      "name": "VYff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZp": {
-      "__class__": "LogTocElement",
-      "ident": 448,
-      "group": "posCtl",
-      "name": "VZp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZi": {
-      "__class__": "LogTocElement",
-      "ident": 449,
-      "group": "posCtl",
-      "name": "VZi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZd": {
-      "__class__": "LogTocElement",
-      "ident": 450,
-      "group": "posCtl",
-      "name": "VZd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZff": {
-      "__class__": "LogTocElement",
-      "ident": 451,
-      "group": "posCtl",
-      "name": "VZff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman": {
-    "stateX": {
-      "__class__": "LogTocElement",
-      "ident": 452,
-      "group": "kalman",
-      "name": "stateX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateY": {
-      "__class__": "LogTocElement",
-      "ident": 453,
-      "group": "kalman",
-      "name": "stateY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateZ": {
-      "__class__": "LogTocElement",
-      "ident": 454,
-      "group": "kalman",
-      "name": "stateZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePX": {
-      "__class__": "LogTocElement",
-      "ident": 455,
-      "group": "kalman",
-      "name": "statePX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePY": {
-      "__class__": "LogTocElement",
-      "ident": 456,
-      "group": "kalman",
-      "name": "statePY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePZ": {
-      "__class__": "LogTocElement",
-      "ident": 457,
-      "group": "kalman",
-      "name": "statePZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD0": {
-      "__class__": "LogTocElement",
-      "ident": 458,
-      "group": "kalman",
-      "name": "stateD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD1": {
-      "__class__": "LogTocElement",
-      "ident": 459,
-      "group": "kalman",
-      "name": "stateD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD2": {
-      "__class__": "LogTocElement",
-      "ident": 460,
-      "group": "kalman",
-      "name": "stateD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varX": {
-      "__class__": "LogTocElement",
-      "ident": 461,
-      "group": "kalman",
-      "name": "varX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varY": {
-      "__class__": "LogTocElement",
-      "ident": 462,
-      "group": "kalman",
-      "name": "varY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varZ": {
-      "__class__": "LogTocElement",
-      "ident": 463,
-      "group": "kalman",
-      "name": "varZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPX": {
-      "__class__": "LogTocElement",
-      "ident": 464,
-      "group": "kalman",
-      "name": "varPX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPY": {
-      "__class__": "LogTocElement",
-      "ident": 465,
-      "group": "kalman",
-      "name": "varPY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPZ": {
-      "__class__": "LogTocElement",
-      "ident": 466,
-      "group": "kalman",
-      "name": "varPZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD0": {
-      "__class__": "LogTocElement",
-      "ident": 467,
-      "group": "kalman",
-      "name": "varD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD1": {
-      "__class__": "LogTocElement",
-      "ident": 468,
-      "group": "kalman",
-      "name": "varD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD2": {
-      "__class__": "LogTocElement",
-      "ident": 469,
-      "group": "kalman",
-      "name": "varD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q0": {
-      "__class__": "LogTocElement",
-      "ident": 470,
-      "group": "kalman",
-      "name": "q0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q1": {
-      "__class__": "LogTocElement",
-      "ident": 471,
-      "group": "kalman",
-      "name": "q1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q2": {
-      "__class__": "LogTocElement",
-      "ident": 472,
-      "group": "kalman",
-      "name": "q2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q3": {
-      "__class__": "LogTocElement",
-      "ident": 473,
-      "group": "kalman",
-      "name": "q3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtUpdate": {
-      "__class__": "LogTocElement",
-      "ident": 474,
-      "group": "kalman",
-      "name": "rtUpdate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtPred": {
-      "__class__": "LogTocElement",
-      "ident": 475,
-      "group": "kalman",
-      "name": "rtPred",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtFinal": {
-      "__class__": "LogTocElement",
-      "ident": 476,
-      "group": "kalman",
-      "name": "rtFinal",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "outlierf": {
-    "lhWin": {
-      "__class__": "LogTocElement",
-      "ident": 477,
-      "group": "outlierf",
-      "name": "lhWin",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "estimator": {
-    "rtApnd": {
-      "__class__": "LogTocElement",
-      "ident": 478,
-      "group": "estimator",
-      "name": "rtApnd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtRej": {
-      "__class__": "LogTocElement",
-      "ident": 479,
-      "group": "estimator",
-      "name": "rtRej",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posEstAlt": {
-    "estimatedZ": {
-      "__class__": "LogTocElement",
-      "ident": 480,
-      "group": "posEstAlt",
-      "name": "estimatedZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estVZ": {
-      "__class__": "LogTocElement",
-      "ident": 481,
-      "group": "posEstAlt",
-      "name": "estVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velocityZ": {
-      "__class__": "LogTocElement",
-      "ident": 482,
-      "group": "posEstAlt",
-      "name": "velocityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "DTR_P2P": {
-    "rx_state": {
-      "__class__": "LogTocElement",
-      "ident": 483,
-      "group": "DTR_P2P",
-      "name": "rx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "tx_state": {
-      "__class__": "LogTocElement",
-      "ident": 484,
-      "group": "DTR_P2P",
-      "name": "tx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  }
-}
\ No newline at end of file
diff --git i/src/webots_pkg/test/software/cache/4D09B1EC.json w/src/webots_pkg/test/software/cache/4D09B1EC.json
deleted file mode 100644
index f1ad077..0000000
--- i/src/webots_pkg/test/software/cache/4D09B1EC.json
+++ /dev/null
@@ -1,4465 +0,0 @@
-{
-  "activeMarker": {
-    "btSns": {
-      "__class__": "LogTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "btSns",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "i2cOk": {
-      "__class__": "LogTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "i2cOk",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "motion": {
-    "motion": {
-      "__class__": "LogTocElement",
-      "ident": 2,
-      "group": "motion",
-      "name": "motion",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "deltaX": {
-      "__class__": "LogTocElement",
-      "ident": 3,
-      "group": "motion",
-      "name": "deltaX",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "deltaY": {
-      "__class__": "LogTocElement",
-      "ident": 4,
-      "group": "motion",
-      "name": "deltaY",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "shutter": {
-      "__class__": "LogTocElement",
-      "ident": 5,
-      "group": "motion",
-      "name": "shutter",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "maxRaw": {
-      "__class__": "LogTocElement",
-      "ident": 6,
-      "group": "motion",
-      "name": "maxRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "minRaw": {
-      "__class__": "LogTocElement",
-      "ident": 7,
-      "group": "motion",
-      "name": "minRaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Rawsum": {
-      "__class__": "LogTocElement",
-      "ident": 8,
-      "group": "motion",
-      "name": "Rawsum",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "outlierCount": {
-      "__class__": "LogTocElement",
-      "ident": 9,
-      "group": "motion",
-      "name": "outlierCount",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "squal": {
-      "__class__": "LogTocElement",
-      "ident": 10,
-      "group": "motion",
-      "name": "squal",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "std": {
-      "__class__": "LogTocElement",
-      "ident": 11,
-      "group": "motion",
-      "name": "std",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ring": {
-    "fadeTime": {
-      "__class__": "LogTocElement",
-      "ident": 12,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ranging": {
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 13,
-      "group": "ranging",
-      "name": "state",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "distance0": {
-      "__class__": "LogTocElement",
-      "ident": 14,
-      "group": "ranging",
-      "name": "distance0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance1": {
-      "__class__": "LogTocElement",
-      "ident": 15,
-      "group": "ranging",
-      "name": "distance1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance2": {
-      "__class__": "LogTocElement",
-      "ident": 16,
-      "group": "ranging",
-      "name": "distance2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance3": {
-      "__class__": "LogTocElement",
-      "ident": 17,
-      "group": "ranging",
-      "name": "distance3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance4": {
-      "__class__": "LogTocElement",
-      "ident": 18,
-      "group": "ranging",
-      "name": "distance4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance5": {
-      "__class__": "LogTocElement",
-      "ident": 19,
-      "group": "ranging",
-      "name": "distance5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance6": {
-      "__class__": "LogTocElement",
-      "ident": 20,
-      "group": "ranging",
-      "name": "distance6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "distance7": {
-      "__class__": "LogTocElement",
-      "ident": 21,
-      "group": "ranging",
-      "name": "distance7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure0": {
-      "__class__": "LogTocElement",
-      "ident": 22,
-      "group": "ranging",
-      "name": "pressure0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure1": {
-      "__class__": "LogTocElement",
-      "ident": 23,
-      "group": "ranging",
-      "name": "pressure1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure2": {
-      "__class__": "LogTocElement",
-      "ident": 24,
-      "group": "ranging",
-      "name": "pressure2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure3": {
-      "__class__": "LogTocElement",
-      "ident": 25,
-      "group": "ranging",
-      "name": "pressure3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure4": {
-      "__class__": "LogTocElement",
-      "ident": 26,
-      "group": "ranging",
-      "name": "pressure4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure5": {
-      "__class__": "LogTocElement",
-      "ident": 27,
-      "group": "ranging",
-      "name": "pressure5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure6": {
-      "__class__": "LogTocElement",
-      "ident": 28,
-      "group": "ranging",
-      "name": "pressure6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure7": {
-      "__class__": "LogTocElement",
-      "ident": 29,
-      "group": "ranging",
-      "name": "pressure7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "LogTocElement",
-      "ident": 30,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "spiWr": {
-      "__class__": "LogTocElement",
-      "ident": 31,
-      "group": "loco",
-      "name": "spiWr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiRe": {
-      "__class__": "LogTocElement",
-      "ident": 32,
-      "group": "loco",
-      "name": "spiRe",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "tdoa2": {
-    "d7-0": {
-      "__class__": "LogTocElement",
-      "ident": 33,
-      "group": "tdoa2",
-      "name": "d7-0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d0-1": {
-      "__class__": "LogTocElement",
-      "ident": 34,
-      "group": "tdoa2",
-      "name": "d0-1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d1-2": {
-      "__class__": "LogTocElement",
-      "ident": 35,
-      "group": "tdoa2",
-      "name": "d1-2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d2-3": {
-      "__class__": "LogTocElement",
-      "ident": 36,
-      "group": "tdoa2",
-      "name": "d2-3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d3-4": {
-      "__class__": "LogTocElement",
-      "ident": 37,
-      "group": "tdoa2",
-      "name": "d3-4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d4-5": {
-      "__class__": "LogTocElement",
-      "ident": 38,
-      "group": "tdoa2",
-      "name": "d4-5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d5-6": {
-      "__class__": "LogTocElement",
-      "ident": 39,
-      "group": "tdoa2",
-      "name": "d5-6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "d6-7": {
-      "__class__": "LogTocElement",
-      "ident": 40,
-      "group": "tdoa2",
-      "name": "d6-7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc0": {
-      "__class__": "LogTocElement",
-      "ident": 41,
-      "group": "tdoa2",
-      "name": "cc0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc1": {
-      "__class__": "LogTocElement",
-      "ident": 42,
-      "group": "tdoa2",
-      "name": "cc1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc2": {
-      "__class__": "LogTocElement",
-      "ident": 43,
-      "group": "tdoa2",
-      "name": "cc2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc3": {
-      "__class__": "LogTocElement",
-      "ident": 44,
-      "group": "tdoa2",
-      "name": "cc3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc4": {
-      "__class__": "LogTocElement",
-      "ident": 45,
-      "group": "tdoa2",
-      "name": "cc4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc5": {
-      "__class__": "LogTocElement",
-      "ident": 46,
-      "group": "tdoa2",
-      "name": "cc5",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc6": {
-      "__class__": "LogTocElement",
-      "ident": 47,
-      "group": "tdoa2",
-      "name": "cc6",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc7": {
-      "__class__": "LogTocElement",
-      "ident": 48,
-      "group": "tdoa2",
-      "name": "cc7",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "dist7-0": {
-      "__class__": "LogTocElement",
-      "ident": 49,
-      "group": "tdoa2",
-      "name": "dist7-0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist0-1": {
-      "__class__": "LogTocElement",
-      "ident": 50,
-      "group": "tdoa2",
-      "name": "dist0-1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist1-2": {
-      "__class__": "LogTocElement",
-      "ident": 51,
-      "group": "tdoa2",
-      "name": "dist1-2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist2-3": {
-      "__class__": "LogTocElement",
-      "ident": 52,
-      "group": "tdoa2",
-      "name": "dist2-3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist3-4": {
-      "__class__": "LogTocElement",
-      "ident": 53,
-      "group": "tdoa2",
-      "name": "dist3-4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist4-5": {
-      "__class__": "LogTocElement",
-      "ident": 54,
-      "group": "tdoa2",
-      "name": "dist4-5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist5-6": {
-      "__class__": "LogTocElement",
-      "ident": 55,
-      "group": "tdoa2",
-      "name": "dist5-6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "dist6-7": {
-      "__class__": "LogTocElement",
-      "ident": 56,
-      "group": "tdoa2",
-      "name": "dist6-7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "twr": {
-    "rangingSuccessRate0": {
-      "__class__": "LogTocElement",
-      "ident": 57,
-      "group": "twr",
-      "name": "rangingSuccessRate0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec0": {
-      "__class__": "LogTocElement",
-      "ident": 58,
-      "group": "twr",
-      "name": "rangingPerSec0",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate1": {
-      "__class__": "LogTocElement",
-      "ident": 59,
-      "group": "twr",
-      "name": "rangingSuccessRate1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec1": {
-      "__class__": "LogTocElement",
-      "ident": 60,
-      "group": "twr",
-      "name": "rangingPerSec1",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate2": {
-      "__class__": "LogTocElement",
-      "ident": 61,
-      "group": "twr",
-      "name": "rangingSuccessRate2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec2": {
-      "__class__": "LogTocElement",
-      "ident": 62,
-      "group": "twr",
-      "name": "rangingPerSec2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate3": {
-      "__class__": "LogTocElement",
-      "ident": 63,
-      "group": "twr",
-      "name": "rangingSuccessRate3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec3": {
-      "__class__": "LogTocElement",
-      "ident": 64,
-      "group": "twr",
-      "name": "rangingPerSec3",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate4": {
-      "__class__": "LogTocElement",
-      "ident": 65,
-      "group": "twr",
-      "name": "rangingSuccessRate4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec4": {
-      "__class__": "LogTocElement",
-      "ident": 66,
-      "group": "twr",
-      "name": "rangingPerSec4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingSuccessRate5": {
-      "__class__": "LogTocElement",
-      "ident": 67,
-      "group": "twr",
-      "name": "rangingSuccessRate5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rangingPerSec5": {
-      "__class__": "LogTocElement",
-      "ident": 68,
-      "group": "twr",
-      "name": "rangingPerSec5",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "oa": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 69,
-      "group": "oa",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 70,
-      "group": "oa",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 71,
-      "group": "oa",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 72,
-      "group": "oa",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 73,
-      "group": "oa",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "usd": {
-    "spiWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 74,
-      "group": "usd",
-      "name": "spiWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "spiReBps": {
-      "__class__": "LogTocElement",
-      "ident": 75,
-      "group": "usd",
-      "name": "spiReBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "fatWrBps": {
-      "__class__": "LogTocElement",
-      "ident": 76,
-      "group": "usd",
-      "name": "fatWrBps",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "motor": {
-    "m1": {
-      "__class__": "LogTocElement",
-      "ident": 77,
-      "group": "motor",
-      "name": "m1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m2": {
-      "__class__": "LogTocElement",
-      "ident": 78,
-      "group": "motor",
-      "name": "m2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m3": {
-      "__class__": "LogTocElement",
-      "ident": 79,
-      "group": "motor",
-      "name": "m3",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m4": {
-      "__class__": "LogTocElement",
-      "ident": 80,
-      "group": "motor",
-      "name": "m4",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "m1req": {
-      "__class__": "LogTocElement",
-      "ident": 81,
-      "group": "motor",
-      "name": "m1req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m2req": {
-      "__class__": "LogTocElement",
-      "ident": 82,
-      "group": "motor",
-      "name": "m2req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m3req": {
-      "__class__": "LogTocElement",
-      "ident": 83,
-      "group": "motor",
-      "name": "m3req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    },
-    "m4req": {
-      "__class__": "LogTocElement",
-      "ident": 84,
-      "group": "motor",
-      "name": "m4req",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "pm": {
-    "vbat": {
-      "__class__": "LogTocElement",
-      "ident": 85,
-      "group": "pm",
-      "name": "vbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 86,
-      "group": "pm",
-      "name": "vbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extVbat": {
-      "__class__": "LogTocElement",
-      "ident": 87,
-      "group": "pm",
-      "name": "extVbat",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "extVbatMV": {
-      "__class__": "LogTocElement",
-      "ident": 88,
-      "group": "pm",
-      "name": "extVbatMV",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "extCurr": {
-      "__class__": "LogTocElement",
-      "ident": 89,
-      "group": "pm",
-      "name": "extCurr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "chargeCurrent": {
-      "__class__": "LogTocElement",
-      "ident": 90,
-      "group": "pm",
-      "name": "chargeCurrent",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "state": {
-      "__class__": "LogTocElement",
-      "ident": 91,
-      "group": "pm",
-      "name": "state",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    },
-    "batteryLevel": {
-      "__class__": "LogTocElement",
-      "ident": 92,
-      "group": "pm",
-      "name": "batteryLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "radio": {
-    "rssi": {
-      "__class__": "LogTocElement",
-      "ident": 93,
-      "group": "radio",
-      "name": "rssi",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isConnected": {
-      "__class__": "LogTocElement",
-      "ident": 94,
-      "group": "radio",
-      "name": "isConnected",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "gyro": {
-    "xRaw": {
-      "__class__": "LogTocElement",
-      "ident": 95,
-      "group": "gyro",
-      "name": "xRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "yRaw": {
-      "__class__": "LogTocElement",
-      "ident": 96,
-      "group": "gyro",
-      "name": "yRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "zRaw": {
-      "__class__": "LogTocElement",
-      "ident": 97,
-      "group": "gyro",
-      "name": "zRaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "xVariance": {
-      "__class__": "LogTocElement",
-      "ident": 98,
-      "group": "gyro",
-      "name": "xVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yVariance": {
-      "__class__": "LogTocElement",
-      "ident": 99,
-      "group": "gyro",
-      "name": "yVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVariance": {
-      "__class__": "LogTocElement",
-      "ident": 100,
-      "group": "gyro",
-      "name": "zVariance",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 101,
-      "group": "gyro",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 102,
-      "group": "gyro",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 103,
-      "group": "gyro",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "colAv": {
-    "latency": {
-      "__class__": "LogTocElement",
-      "ident": 104,
-      "group": "colAv",
-      "name": "latency",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "ext_pos": {
-    "X": {
-      "__class__": "LogTocElement",
-      "ident": 105,
-      "group": "ext_pos",
-      "name": "X",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Y": {
-      "__class__": "LogTocElement",
-      "ident": 106,
-      "group": "ext_pos",
-      "name": "Y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Z": {
-      "__class__": "LogTocElement",
-      "ident": 107,
-      "group": "ext_pos",
-      "name": "Z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrv": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 108,
-      "group": "locSrv",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 109,
-      "group": "locSrv",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 110,
-      "group": "locSrv",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 111,
-      "group": "locSrv",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 112,
-      "group": "locSrv",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 113,
-      "group": "locSrv",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 114,
-      "group": "locSrv",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "locSrvZ": {
-    "tick": {
-      "__class__": "LogTocElement",
-      "ident": 115,
-      "group": "locSrvZ",
-      "name": "tick",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "crtp": {
-    "rxRate": {
-      "__class__": "LogTocElement",
-      "ident": 116,
-      "group": "crtp",
-      "name": "rxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "txRate": {
-      "__class__": "LogTocElement",
-      "ident": 117,
-      "group": "crtp",
-      "name": "txRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "extrx_raw": {
-    "ch0": {
-      "__class__": "LogTocElement",
-      "ident": 118,
-      "group": "extrx_raw",
-      "name": "ch0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch1": {
-      "__class__": "LogTocElement",
-      "ident": 119,
-      "group": "extrx_raw",
-      "name": "ch1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch2": {
-      "__class__": "LogTocElement",
-      "ident": 120,
-      "group": "extrx_raw",
-      "name": "ch2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch3": {
-      "__class__": "LogTocElement",
-      "ident": 121,
-      "group": "extrx_raw",
-      "name": "ch3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch4": {
-      "__class__": "LogTocElement",
-      "ident": 122,
-      "group": "extrx_raw",
-      "name": "ch4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch5": {
-      "__class__": "LogTocElement",
-      "ident": 123,
-      "group": "extrx_raw",
-      "name": "ch5",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch6": {
-      "__class__": "LogTocElement",
-      "ident": 124,
-      "group": "extrx_raw",
-      "name": "ch6",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "ch7": {
-      "__class__": "LogTocElement",
-      "ident": 125,
-      "group": "extrx_raw",
-      "name": "ch7",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "extrx": {
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 126,
-      "group": "extrx",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 127,
-      "group": "extrx",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 128,
-      "group": "extrx",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 129,
-      "group": "extrx",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 130,
-      "group": "extrx",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 131,
-      "group": "extrx",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zVel": {
-      "__class__": "LogTocElement",
-      "ident": 132,
-      "group": "extrx",
-      "name": "zVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "AltHold": {
-      "__class__": "LogTocElement",
-      "ident": 133,
-      "group": "extrx",
-      "name": "AltHold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "Arm": {
-      "__class__": "LogTocElement",
-      "ident": 134,
-      "group": "extrx",
-      "name": "Arm",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "health": {
-    "motorVarXM1": {
-      "__class__": "LogTocElement",
-      "ident": 135,
-      "group": "health",
-      "name": "motorVarXM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM1": {
-      "__class__": "LogTocElement",
-      "ident": 136,
-      "group": "health",
-      "name": "motorVarYM1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM2": {
-      "__class__": "LogTocElement",
-      "ident": 137,
-      "group": "health",
-      "name": "motorVarXM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM2": {
-      "__class__": "LogTocElement",
-      "ident": 138,
-      "group": "health",
-      "name": "motorVarYM2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM3": {
-      "__class__": "LogTocElement",
-      "ident": 139,
-      "group": "health",
-      "name": "motorVarXM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM3": {
-      "__class__": "LogTocElement",
-      "ident": 140,
-      "group": "health",
-      "name": "motorVarYM3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarXM4": {
-      "__class__": "LogTocElement",
-      "ident": 141,
-      "group": "health",
-      "name": "motorVarXM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorVarYM4": {
-      "__class__": "LogTocElement",
-      "ident": 142,
-      "group": "health",
-      "name": "motorVarYM4",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "motorPass": {
-      "__class__": "LogTocElement",
-      "ident": 143,
-      "group": "health",
-      "name": "motorPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "batterySag": {
-      "__class__": "LogTocElement",
-      "ident": 144,
-      "group": "health",
-      "name": "batterySag",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "batteryPass": {
-      "__class__": "LogTocElement",
-      "ident": 145,
-      "group": "health",
-      "name": "batteryPass",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "motorTestCount": {
-      "__class__": "LogTocElement",
-      "ident": 146,
-      "group": "health",
-      "name": "motorTestCount",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "memTst": {
-    "errCntW": {
-      "__class__": "LogTocElement",
-      "ident": 147,
-      "group": "memTst",
-      "name": "errCntW",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "range": {
-    "front": {
-      "__class__": "LogTocElement",
-      "ident": 148,
-      "group": "range",
-      "name": "front",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "back": {
-      "__class__": "LogTocElement",
-      "ident": 149,
-      "group": "range",
-      "name": "back",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "up": {
-      "__class__": "LogTocElement",
-      "ident": 150,
-      "group": "range",
-      "name": "up",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "left": {
-      "__class__": "LogTocElement",
-      "ident": 151,
-      "group": "range",
-      "name": "left",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "right": {
-      "__class__": "LogTocElement",
-      "ident": 152,
-      "group": "range",
-      "name": "right",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "zrange": {
-      "__class__": "LogTocElement",
-      "ident": 153,
-      "group": "range",
-      "name": "zrange",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "sensfusion6": {
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 154,
-      "group": "sensfusion6",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 155,
-      "group": "sensfusion6",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 156,
-      "group": "sensfusion6",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 157,
-      "group": "sensfusion6",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityX": {
-      "__class__": "LogTocElement",
-      "ident": 158,
-      "group": "sensfusion6",
-      "name": "gravityX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityY": {
-      "__class__": "LogTocElement",
-      "ident": 159,
-      "group": "sensfusion6",
-      "name": "gravityY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "gravityZ": {
-      "__class__": "LogTocElement",
-      "ident": 160,
-      "group": "sensfusion6",
-      "name": "gravityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accZbase": {
-      "__class__": "LogTocElement",
-      "ident": 161,
-      "group": "sensfusion6",
-      "name": "accZbase",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "isInit": {
-      "__class__": "LogTocElement",
-      "ident": 162,
-      "group": "sensfusion6",
-      "name": "isInit",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isCalibrated": {
-      "__class__": "LogTocElement",
-      "ident": 163,
-      "group": "sensfusion6",
-      "name": "isCalibrated",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  },
-  "ctrltarget": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 164,
-      "group": "ctrltarget",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 165,
-      "group": "ctrltarget",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 166,
-      "group": "ctrltarget",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 167,
-      "group": "ctrltarget",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 168,
-      "group": "ctrltarget",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 169,
-      "group": "ctrltarget",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 170,
-      "group": "ctrltarget",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 171,
-      "group": "ctrltarget",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 172,
-      "group": "ctrltarget",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 173,
-      "group": "ctrltarget",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 174,
-      "group": "ctrltarget",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 175,
-      "group": "ctrltarget",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrltargetZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 176,
-      "group": "ctrltargetZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 177,
-      "group": "ctrltargetZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 178,
-      "group": "ctrltargetZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 179,
-      "group": "ctrltargetZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 180,
-      "group": "ctrltargetZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 181,
-      "group": "ctrltargetZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 182,
-      "group": "ctrltargetZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 183,
-      "group": "ctrltargetZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 184,
-      "group": "ctrltargetZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "stabilizer": {
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 185,
-      "group": "stabilizer",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 186,
-      "group": "stabilizer",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 187,
-      "group": "stabilizer",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "thrust": {
-      "__class__": "LogTocElement",
-      "ident": 188,
-      "group": "stabilizer",
-      "name": "thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtStab": {
-      "__class__": "LogTocElement",
-      "ident": 189,
-      "group": "stabilizer",
-      "name": "rtStab",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "intToOut": {
-      "__class__": "LogTocElement",
-      "ident": 190,
-      "group": "stabilizer",
-      "name": "intToOut",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    }
-  },
-  "acc": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 191,
-      "group": "acc",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 192,
-      "group": "acc",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 193,
-      "group": "acc",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "baro": {
-    "asl": {
-      "__class__": "LogTocElement",
-      "ident": 194,
-      "group": "baro",
-      "name": "asl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "temp": {
-      "__class__": "LogTocElement",
-      "ident": 195,
-      "group": "baro",
-      "name": "temp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pressure": {
-      "__class__": "LogTocElement",
-      "ident": 196,
-      "group": "baro",
-      "name": "pressure",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "mag": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 197,
-      "group": "mag",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 198,
-      "group": "mag",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 199,
-      "group": "mag",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "controller": {
-    "ctr_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 200,
-      "group": "controller",
-      "name": "ctr_yaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 201,
-      "group": "controller",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 202,
-      "group": "controller",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 203,
-      "group": "controller",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 204,
-      "group": "controller",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 205,
-      "group": "controller",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 206,
-      "group": "controller",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 207,
-      "group": "controller",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 208,
-      "group": "controller",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "actuatorThrust": {
-      "__class__": "LogTocElement",
-      "ident": 209,
-      "group": "controller",
-      "name": "actuatorThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 210,
-      "group": "controller",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 211,
-      "group": "controller",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 212,
-      "group": "controller",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rollRate": {
-      "__class__": "LogTocElement",
-      "ident": 213,
-      "group": "controller",
-      "name": "rollRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitchRate": {
-      "__class__": "LogTocElement",
-      "ident": 214,
-      "group": "controller",
-      "name": "pitchRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yawRate": {
-      "__class__": "LogTocElement",
-      "ident": 215,
-      "group": "controller",
-      "name": "yawRate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stateEstimate": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 216,
-      "group": "stateEstimate",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 217,
-      "group": "stateEstimate",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 218,
-      "group": "stateEstimate",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 219,
-      "group": "stateEstimate",
-      "name": "vx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 220,
-      "group": "stateEstimate",
-      "name": "vy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 221,
-      "group": "stateEstimate",
-      "name": "vz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 222,
-      "group": "stateEstimate",
-      "name": "ax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 223,
-      "group": "stateEstimate",
-      "name": "ay",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 224,
-      "group": "stateEstimate",
-      "name": "az",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll": {
-      "__class__": "LogTocElement",
-      "ident": 225,
-      "group": "stateEstimate",
-      "name": "roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch": {
-      "__class__": "LogTocElement",
-      "ident": 226,
-      "group": "stateEstimate",
-      "name": "pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw": {
-      "__class__": "LogTocElement",
-      "ident": 227,
-      "group": "stateEstimate",
-      "name": "yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qx": {
-      "__class__": "LogTocElement",
-      "ident": 228,
-      "group": "stateEstimate",
-      "name": "qx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qy": {
-      "__class__": "LogTocElement",
-      "ident": 229,
-      "group": "stateEstimate",
-      "name": "qy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qz": {
-      "__class__": "LogTocElement",
-      "ident": 230,
-      "group": "stateEstimate",
-      "name": "qz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "qw": {
-      "__class__": "LogTocElement",
-      "ident": 231,
-      "group": "stateEstimate",
-      "name": "qw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "stateEstimateZ": {
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 232,
-      "group": "stateEstimateZ",
-      "name": "x",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 233,
-      "group": "stateEstimateZ",
-      "name": "y",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 234,
-      "group": "stateEstimateZ",
-      "name": "z",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vx": {
-      "__class__": "LogTocElement",
-      "ident": 235,
-      "group": "stateEstimateZ",
-      "name": "vx",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vy": {
-      "__class__": "LogTocElement",
-      "ident": 236,
-      "group": "stateEstimateZ",
-      "name": "vy",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "vz": {
-      "__class__": "LogTocElement",
-      "ident": 237,
-      "group": "stateEstimateZ",
-      "name": "vz",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ax": {
-      "__class__": "LogTocElement",
-      "ident": 238,
-      "group": "stateEstimateZ",
-      "name": "ax",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ay": {
-      "__class__": "LogTocElement",
-      "ident": 239,
-      "group": "stateEstimateZ",
-      "name": "ay",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "az": {
-      "__class__": "LogTocElement",
-      "ident": 240,
-      "group": "stateEstimateZ",
-      "name": "az",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "quat": {
-      "__class__": "LogTocElement",
-      "ident": 241,
-      "group": "stateEstimateZ",
-      "name": "quat",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0
-    },
-    "rateRoll": {
-      "__class__": "LogTocElement",
-      "ident": 242,
-      "group": "stateEstimateZ",
-      "name": "rateRoll",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "ratePitch": {
-      "__class__": "LogTocElement",
-      "ident": 243,
-      "group": "stateEstimateZ",
-      "name": "ratePitch",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    },
-    "rateYaw": {
-      "__class__": "LogTocElement",
-      "ident": 244,
-      "group": "stateEstimateZ",
-      "name": "rateYaw",
-      "ctype": "int16_t",
-      "pytype": "<h",
-      "access": 0
-    }
-  },
-  "sys": {
-    "canfly": {
-      "__class__": "LogTocElement",
-      "ident": 245,
-      "group": "sys",
-      "name": "canfly",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isFlying": {
-      "__class__": "LogTocElement",
-      "ident": 246,
-      "group": "sys",
-      "name": "isFlying",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "isTumbled": {
-      "__class__": "LogTocElement",
-      "ident": 247,
-      "group": "sys",
-      "name": "isTumbled",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "testLogParam": {
-      "__class__": "LogTocElement",
-      "ident": 248,
-      "group": "sys",
-      "name": "testLogParam",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0
-    }
-  },
-  "supervisor": {
-    "info": {
-      "__class__": "LogTocElement",
-      "ident": 249,
-      "group": "supervisor",
-      "name": "info",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    }
-  },
-  "tdoaEngine": {
-    "stRx": {
-      "__class__": "LogTocElement",
-      "ident": 250,
-      "group": "tdoaEngine",
-      "name": "stRx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stEst": {
-      "__class__": "LogTocElement",
-      "ident": 251,
-      "group": "tdoaEngine",
-      "name": "stEst",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stTime": {
-      "__class__": "LogTocElement",
-      "ident": 252,
-      "group": "tdoaEngine",
-      "name": "stTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stFound": {
-      "__class__": "LogTocElement",
-      "ident": 253,
-      "group": "tdoaEngine",
-      "name": "stFound",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stCc": {
-      "__class__": "LogTocElement",
-      "ident": 254,
-      "group": "tdoaEngine",
-      "name": "stCc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stHit": {
-      "__class__": "LogTocElement",
-      "ident": 255,
-      "group": "tdoaEngine",
-      "name": "stHit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stMiss": {
-      "__class__": "LogTocElement",
-      "ident": 256,
-      "group": "tdoaEngine",
-      "name": "stMiss",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cc": {
-      "__class__": "LogTocElement",
-      "ident": 257,
-      "group": "tdoaEngine",
-      "name": "cc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "tof": {
-      "__class__": "LogTocElement",
-      "ident": 258,
-      "group": "tdoaEngine",
-      "name": "tof",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "tdoa": {
-      "__class__": "LogTocElement",
-      "ident": 259,
-      "group": "tdoaEngine",
-      "name": "tdoa",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman_pred": {
-    "predNX": {
-      "__class__": "LogTocElement",
-      "ident": 260,
-      "group": "kalman_pred",
-      "name": "predNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "predNY": {
-      "__class__": "LogTocElement",
-      "ident": 261,
-      "group": "kalman_pred",
-      "name": "predNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNX": {
-      "__class__": "LogTocElement",
-      "ident": 262,
-      "group": "kalman_pred",
-      "name": "measNX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "measNY": {
-      "__class__": "LogTocElement",
-      "ident": 263,
-      "group": "kalman_pred",
-      "name": "measNY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "lighthouse": {
-    "validAngles": {
-      "__class__": "LogTocElement",
-      "ident": 264,
-      "group": "lighthouse",
-      "name": "validAngles",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "rawAngle0x": {
-      "__class__": "LogTocElement",
-      "ident": 265,
-      "group": "lighthouse",
-      "name": "rawAngle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0y": {
-      "__class__": "LogTocElement",
-      "ident": 266,
-      "group": "lighthouse",
-      "name": "rawAngle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1x": {
-      "__class__": "LogTocElement",
-      "ident": 267,
-      "group": "lighthouse",
-      "name": "rawAngle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1y": {
-      "__class__": "LogTocElement",
-      "ident": 268,
-      "group": "lighthouse",
-      "name": "rawAngle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x": {
-      "__class__": "LogTocElement",
-      "ident": 269,
-      "group": "lighthouse",
-      "name": "angle0x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y": {
-      "__class__": "LogTocElement",
-      "ident": 270,
-      "group": "lighthouse",
-      "name": "angle0y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x": {
-      "__class__": "LogTocElement",
-      "ident": 271,
-      "group": "lighthouse",
-      "name": "angle1x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y": {
-      "__class__": "LogTocElement",
-      "ident": 272,
-      "group": "lighthouse",
-      "name": "angle1y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_1": {
-      "__class__": "LogTocElement",
-      "ident": 273,
-      "group": "lighthouse",
-      "name": "angle0x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_1": {
-      "__class__": "LogTocElement",
-      "ident": 274,
-      "group": "lighthouse",
-      "name": "angle0y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_1": {
-      "__class__": "LogTocElement",
-      "ident": 275,
-      "group": "lighthouse",
-      "name": "angle1x_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_1": {
-      "__class__": "LogTocElement",
-      "ident": 276,
-      "group": "lighthouse",
-      "name": "angle1y_1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_2": {
-      "__class__": "LogTocElement",
-      "ident": 277,
-      "group": "lighthouse",
-      "name": "angle0x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_2": {
-      "__class__": "LogTocElement",
-      "ident": 278,
-      "group": "lighthouse",
-      "name": "angle0y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_2": {
-      "__class__": "LogTocElement",
-      "ident": 279,
-      "group": "lighthouse",
-      "name": "angle1x_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_2": {
-      "__class__": "LogTocElement",
-      "ident": 280,
-      "group": "lighthouse",
-      "name": "angle1y_2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_3": {
-      "__class__": "LogTocElement",
-      "ident": 281,
-      "group": "lighthouse",
-      "name": "angle0x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_3": {
-      "__class__": "LogTocElement",
-      "ident": 282,
-      "group": "lighthouse",
-      "name": "angle0y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_3": {
-      "__class__": "LogTocElement",
-      "ident": 283,
-      "group": "lighthouse",
-      "name": "angle1x_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_3": {
-      "__class__": "LogTocElement",
-      "ident": 284,
-      "group": "lighthouse",
-      "name": "angle1y_3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 285,
-      "group": "lighthouse",
-      "name": "rawAngle0xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle0ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 286,
-      "group": "lighthouse",
-      "name": "rawAngle0ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1xlh2": {
-      "__class__": "LogTocElement",
-      "ident": 287,
-      "group": "lighthouse",
-      "name": "rawAngle1xlh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rawAngle1ylh2": {
-      "__class__": "LogTocElement",
-      "ident": 288,
-      "group": "lighthouse",
-      "name": "rawAngle1ylh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 289,
-      "group": "lighthouse",
-      "name": "angle0x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle0y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 290,
-      "group": "lighthouse",
-      "name": "angle0y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1x_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 291,
-      "group": "lighthouse",
-      "name": "angle1x_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angle1y_0lh2": {
-      "__class__": "LogTocElement",
-      "ident": 292,
-      "group": "lighthouse",
-      "name": "angle1y_0lh2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "width0": {
-      "__class__": "LogTocElement",
-      "ident": 293,
-      "group": "lighthouse",
-      "name": "width0",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width1": {
-      "__class__": "LogTocElement",
-      "ident": 294,
-      "group": "lighthouse",
-      "name": "width1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width2": {
-      "__class__": "LogTocElement",
-      "ident": 295,
-      "group": "lighthouse",
-      "name": "width2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "width3": {
-      "__class__": "LogTocElement",
-      "ident": 296,
-      "group": "lighthouse",
-      "name": "width3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "comSync": {
-      "__class__": "LogTocElement",
-      "ident": 297,
-      "group": "lighthouse",
-      "name": "comSync",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "bsAvailable": {
-      "__class__": "LogTocElement",
-      "ident": 298,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsReceive": {
-      "__class__": "LogTocElement",
-      "ident": 299,
-      "group": "lighthouse",
-      "name": "bsReceive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsActive": {
-      "__class__": "LogTocElement",
-      "ident": 300,
-      "group": "lighthouse",
-      "name": "bsActive",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalUd": {
-      "__class__": "LogTocElement",
-      "ident": 301,
-      "group": "lighthouse",
-      "name": "bsCalUd",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalCon": {
-      "__class__": "LogTocElement",
-      "ident": 302,
-      "group": "lighthouse",
-      "name": "bsCalCon",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "status": {
-      "__class__": "LogTocElement",
-      "ident": 303,
-      "group": "lighthouse",
-      "name": "status",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "posRt": {
-      "__class__": "LogTocElement",
-      "ident": 304,
-      "group": "lighthouse",
-      "name": "posRt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs0Rt": {
-      "__class__": "LogTocElement",
-      "ident": 305,
-      "group": "lighthouse",
-      "name": "estBs0Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estBs1Rt": {
-      "__class__": "LogTocElement",
-      "ident": 306,
-      "group": "lighthouse",
-      "name": "estBs1Rt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "x": {
-      "__class__": "LogTocElement",
-      "ident": 307,
-      "group": "lighthouse",
-      "name": "x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "y": {
-      "__class__": "LogTocElement",
-      "ident": 308,
-      "group": "lighthouse",
-      "name": "y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "z": {
-      "__class__": "LogTocElement",
-      "ident": 309,
-      "group": "lighthouse",
-      "name": "z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "delta": {
-      "__class__": "LogTocElement",
-      "ident": 310,
-      "group": "lighthouse",
-      "name": "delta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bsGeoVal": {
-      "__class__": "LogTocElement",
-      "ident": 311,
-      "group": "lighthouse",
-      "name": "bsGeoVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "bsCalVal": {
-      "__class__": "LogTocElement",
-      "ident": 312,
-      "group": "lighthouse",
-      "name": "bsCalVal",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0
-    },
-    "disProb": {
-      "__class__": "LogTocElement",
-      "ident": 313,
-      "group": "lighthouse",
-      "name": "disProb",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_attitude": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 314,
-      "group": "pid_attitude",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 315,
-      "group": "pid_attitude",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 316,
-      "group": "pid_attitude",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 317,
-      "group": "pid_attitude",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 318,
-      "group": "pid_attitude",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 319,
-      "group": "pid_attitude",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 320,
-      "group": "pid_attitude",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 321,
-      "group": "pid_attitude",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 322,
-      "group": "pid_attitude",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 323,
-      "group": "pid_attitude",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 324,
-      "group": "pid_attitude",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 325,
-      "group": "pid_attitude",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "pid_rate": {
-    "roll_outP": {
-      "__class__": "LogTocElement",
-      "ident": 326,
-      "group": "pid_rate",
-      "name": "roll_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outI": {
-      "__class__": "LogTocElement",
-      "ident": 327,
-      "group": "pid_rate",
-      "name": "roll_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outD": {
-      "__class__": "LogTocElement",
-      "ident": 328,
-      "group": "pid_rate",
-      "name": "roll_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "roll_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 329,
-      "group": "pid_rate",
-      "name": "roll_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outP": {
-      "__class__": "LogTocElement",
-      "ident": 330,
-      "group": "pid_rate",
-      "name": "pitch_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outI": {
-      "__class__": "LogTocElement",
-      "ident": 331,
-      "group": "pid_rate",
-      "name": "pitch_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outD": {
-      "__class__": "LogTocElement",
-      "ident": 332,
-      "group": "pid_rate",
-      "name": "pitch_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "pitch_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 333,
-      "group": "pid_rate",
-      "name": "pitch_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outP": {
-      "__class__": "LogTocElement",
-      "ident": 334,
-      "group": "pid_rate",
-      "name": "yaw_outP",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outI": {
-      "__class__": "LogTocElement",
-      "ident": 335,
-      "group": "pid_rate",
-      "name": "yaw_outI",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outD": {
-      "__class__": "LogTocElement",
-      "ident": 336,
-      "group": "pid_rate",
-      "name": "yaw_outD",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "yaw_outFF": {
-      "__class__": "LogTocElement",
-      "ident": 337,
-      "group": "pid_rate",
-      "name": "yaw_outFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlINDI": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 338,
-      "group": "ctrlINDI",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 339,
-      "group": "ctrlINDI",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 340,
-      "group": "ctrlINDI",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 341,
-      "group": "ctrlINDI",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 342,
-      "group": "ctrlINDI",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 343,
-      "group": "ctrlINDI",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 344,
-      "group": "ctrlINDI",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_p": {
-      "__class__": "LogTocElement",
-      "ident": 345,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_q": {
-      "__class__": "LogTocElement",
-      "ident": 346,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "u_act_dyn_r": {
-      "__class__": "LogTocElement",
-      "ident": 347,
-      "group": "ctrlINDI",
-      "name": "u_act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_p": {
-      "__class__": "LogTocElement",
-      "ident": 348,
-      "group": "ctrlINDI",
-      "name": "du_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_q": {
-      "__class__": "LogTocElement",
-      "ident": 349,
-      "group": "ctrlINDI",
-      "name": "du_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "du_r": {
-      "__class__": "LogTocElement",
-      "ident": 350,
-      "group": "ctrlINDI",
-      "name": "du_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_p": {
-      "__class__": "LogTocElement",
-      "ident": 351,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_q": {
-      "__class__": "LogTocElement",
-      "ident": 352,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "ang_accel_ref_r": {
-      "__class__": "LogTocElement",
-      "ident": 353,
-      "group": "ctrlINDI",
-      "name": "ang_accel_ref_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[0]": {
-      "__class__": "LogTocElement",
-      "ident": 354,
-      "group": "ctrlINDI",
-      "name": "rate_d[0]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[1]": {
-      "__class__": "LogTocElement",
-      "ident": 355,
-      "group": "ctrlINDI",
-      "name": "rate_d[1]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rate_d[2]": {
-      "__class__": "LogTocElement",
-      "ident": 356,
-      "group": "ctrlINDI",
-      "name": "rate_d[2]",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_p": {
-      "__class__": "LogTocElement",
-      "ident": 357,
-      "group": "ctrlINDI",
-      "name": "uf_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_q": {
-      "__class__": "LogTocElement",
-      "ident": 358,
-      "group": "ctrlINDI",
-      "name": "uf_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "uf_r": {
-      "__class__": "LogTocElement",
-      "ident": 359,
-      "group": "ctrlINDI",
-      "name": "uf_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_p": {
-      "__class__": "LogTocElement",
-      "ident": 360,
-      "group": "ctrlINDI",
-      "name": "Omega_f_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_q": {
-      "__class__": "LogTocElement",
-      "ident": 361,
-      "group": "ctrlINDI",
-      "name": "Omega_f_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Omega_f_r": {
-      "__class__": "LogTocElement",
-      "ident": 362,
-      "group": "ctrlINDI",
-      "name": "Omega_f_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_p": {
-      "__class__": "LogTocElement",
-      "ident": 363,
-      "group": "ctrlINDI",
-      "name": "n_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_q": {
-      "__class__": "LogTocElement",
-      "ident": 364,
-      "group": "ctrlINDI",
-      "name": "n_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "n_r": {
-      "__class__": "LogTocElement",
-      "ident": 365,
-      "group": "ctrlINDI",
-      "name": "n_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "ctrlMel": {
-    "cmd_thrust": {
-      "__class__": "LogTocElement",
-      "ident": 366,
-      "group": "ctrlMel",
-      "name": "cmd_thrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_roll": {
-      "__class__": "LogTocElement",
-      "ident": 367,
-      "group": "ctrlMel",
-      "name": "cmd_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 368,
-      "group": "ctrlMel",
-      "name": "cmd_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 369,
-      "group": "ctrlMel",
-      "name": "cmd_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_roll": {
-      "__class__": "LogTocElement",
-      "ident": 370,
-      "group": "ctrlMel",
-      "name": "r_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 371,
-      "group": "ctrlMel",
-      "name": "r_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "r_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 372,
-      "group": "ctrlMel",
-      "name": "r_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accelz": {
-      "__class__": "LogTocElement",
-      "ident": 373,
-      "group": "ctrlMel",
-      "name": "accelz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdx": {
-      "__class__": "LogTocElement",
-      "ident": 374,
-      "group": "ctrlMel",
-      "name": "zdx",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdy": {
-      "__class__": "LogTocElement",
-      "ident": 375,
-      "group": "ctrlMel",
-      "name": "zdy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "zdz": {
-      "__class__": "LogTocElement",
-      "ident": 376,
-      "group": "ctrlMel",
-      "name": "zdz",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_x": {
-      "__class__": "LogTocElement",
-      "ident": 377,
-      "group": "ctrlMel",
-      "name": "i_err_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_y": {
-      "__class__": "LogTocElement",
-      "ident": 378,
-      "group": "ctrlMel",
-      "name": "i_err_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "i_err_z": {
-      "__class__": "LogTocElement",
-      "ident": 379,
-      "group": "ctrlMel",
-      "name": "i_err_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtrlIndi": {
-    "posRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 380,
-      "group": "posCtrlIndi",
-      "name": "posRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 381,
-      "group": "posCtrlIndi",
-      "name": "posRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "posRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 382,
-      "group": "posCtrlIndi",
-      "name": "posRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_x": {
-      "__class__": "LogTocElement",
-      "ident": 383,
-      "group": "posCtrlIndi",
-      "name": "velS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_y": {
-      "__class__": "LogTocElement",
-      "ident": 384,
-      "group": "posCtrlIndi",
-      "name": "velS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velS_z": {
-      "__class__": "LogTocElement",
-      "ident": 385,
-      "group": "posCtrlIndi",
-      "name": "velS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 386,
-      "group": "posCtrlIndi",
-      "name": "velRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 387,
-      "group": "posCtrlIndi",
-      "name": "velRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 388,
-      "group": "posCtrlIndi",
-      "name": "velRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_roll": {
-      "__class__": "LogTocElement",
-      "ident": 389,
-      "group": "posCtrlIndi",
-      "name": "angS_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 390,
-      "group": "posCtrlIndi",
-      "name": "angS_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angS_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 391,
-      "group": "posCtrlIndi",
-      "name": "angS_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_roll": {
-      "__class__": "LogTocElement",
-      "ident": 392,
-      "group": "posCtrlIndi",
-      "name": "angF_roll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_pitch": {
-      "__class__": "LogTocElement",
-      "ident": 393,
-      "group": "posCtrlIndi",
-      "name": "angF_pitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "angF_yaw": {
-      "__class__": "LogTocElement",
-      "ident": 394,
-      "group": "posCtrlIndi",
-      "name": "angF_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_x": {
-      "__class__": "LogTocElement",
-      "ident": 395,
-      "group": "posCtrlIndi",
-      "name": "accRef_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_y": {
-      "__class__": "LogTocElement",
-      "ident": 396,
-      "group": "posCtrlIndi",
-      "name": "accRef_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accRef_z": {
-      "__class__": "LogTocElement",
-      "ident": 397,
-      "group": "posCtrlIndi",
-      "name": "accRef_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_x": {
-      "__class__": "LogTocElement",
-      "ident": 398,
-      "group": "posCtrlIndi",
-      "name": "accS_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_y": {
-      "__class__": "LogTocElement",
-      "ident": 399,
-      "group": "posCtrlIndi",
-      "name": "accS_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accS_z": {
-      "__class__": "LogTocElement",
-      "ident": 400,
-      "group": "posCtrlIndi",
-      "name": "accS_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_x": {
-      "__class__": "LogTocElement",
-      "ident": 401,
-      "group": "posCtrlIndi",
-      "name": "accF_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_y": {
-      "__class__": "LogTocElement",
-      "ident": 402,
-      "group": "posCtrlIndi",
-      "name": "accF_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accF_z": {
-      "__class__": "LogTocElement",
-      "ident": 403,
-      "group": "posCtrlIndi",
-      "name": "accF_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_x": {
-      "__class__": "LogTocElement",
-      "ident": 404,
-      "group": "posCtrlIndi",
-      "name": "accFT_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_y": {
-      "__class__": "LogTocElement",
-      "ident": 405,
-      "group": "posCtrlIndi",
-      "name": "accFT_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accFT_z": {
-      "__class__": "LogTocElement",
-      "ident": 406,
-      "group": "posCtrlIndi",
-      "name": "accFT_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_x": {
-      "__class__": "LogTocElement",
-      "ident": 407,
-      "group": "posCtrlIndi",
-      "name": "accErr_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_y": {
-      "__class__": "LogTocElement",
-      "ident": 408,
-      "group": "posCtrlIndi",
-      "name": "accErr_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "accErr_z": {
-      "__class__": "LogTocElement",
-      "ident": 409,
-      "group": "posCtrlIndi",
-      "name": "accErr_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "phi_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 410,
-      "group": "posCtrlIndi",
-      "name": "phi_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "theta_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 411,
-      "group": "posCtrlIndi",
-      "name": "theta_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_tilde": {
-      "__class__": "LogTocElement",
-      "ident": 412,
-      "group": "posCtrlIndi",
-      "name": "T_tilde",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner": {
-      "__class__": "LogTocElement",
-      "ident": 413,
-      "group": "posCtrlIndi",
-      "name": "T_inner",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_inner_f": {
-      "__class__": "LogTocElement",
-      "ident": 414,
-      "group": "posCtrlIndi",
-      "name": "T_inner_f",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "T_incremented": {
-      "__class__": "LogTocElement",
-      "ident": 415,
-      "group": "posCtrlIndi",
-      "name": "T_incremented",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_phi": {
-      "__class__": "LogTocElement",
-      "ident": 416,
-      "group": "posCtrlIndi",
-      "name": "cmd_phi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "cmd_theta": {
-      "__class__": "LogTocElement",
-      "ident": 417,
-      "group": "posCtrlIndi",
-      "name": "cmd_theta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posCtl": {
-    "targetVX": {
-      "__class__": "LogTocElement",
-      "ident": 418,
-      "group": "posCtl",
-      "name": "targetVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVY": {
-      "__class__": "LogTocElement",
-      "ident": 419,
-      "group": "posCtl",
-      "name": "targetVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetVZ": {
-      "__class__": "LogTocElement",
-      "ident": 420,
-      "group": "posCtl",
-      "name": "targetVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetX": {
-      "__class__": "LogTocElement",
-      "ident": 421,
-      "group": "posCtl",
-      "name": "targetX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetY": {
-      "__class__": "LogTocElement",
-      "ident": 422,
-      "group": "posCtl",
-      "name": "targetY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "targetZ": {
-      "__class__": "LogTocElement",
-      "ident": 423,
-      "group": "posCtl",
-      "name": "targetZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVX": {
-      "__class__": "LogTocElement",
-      "ident": 424,
-      "group": "posCtl",
-      "name": "bodyVX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyVY": {
-      "__class__": "LogTocElement",
-      "ident": 425,
-      "group": "posCtl",
-      "name": "bodyVY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyX": {
-      "__class__": "LogTocElement",
-      "ident": 426,
-      "group": "posCtl",
-      "name": "bodyX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "bodyY": {
-      "__class__": "LogTocElement",
-      "ident": 427,
-      "group": "posCtl",
-      "name": "bodyY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xp": {
-      "__class__": "LogTocElement",
-      "ident": 428,
-      "group": "posCtl",
-      "name": "Xp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xi": {
-      "__class__": "LogTocElement",
-      "ident": 429,
-      "group": "posCtl",
-      "name": "Xi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xd": {
-      "__class__": "LogTocElement",
-      "ident": 430,
-      "group": "posCtl",
-      "name": "Xd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Xff": {
-      "__class__": "LogTocElement",
-      "ident": 431,
-      "group": "posCtl",
-      "name": "Xff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yp": {
-      "__class__": "LogTocElement",
-      "ident": 432,
-      "group": "posCtl",
-      "name": "Yp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yi": {
-      "__class__": "LogTocElement",
-      "ident": 433,
-      "group": "posCtl",
-      "name": "Yi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yd": {
-      "__class__": "LogTocElement",
-      "ident": 434,
-      "group": "posCtl",
-      "name": "Yd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Yff": {
-      "__class__": "LogTocElement",
-      "ident": 435,
-      "group": "posCtl",
-      "name": "Yff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zp": {
-      "__class__": "LogTocElement",
-      "ident": 436,
-      "group": "posCtl",
-      "name": "Zp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zi": {
-      "__class__": "LogTocElement",
-      "ident": 437,
-      "group": "posCtl",
-      "name": "Zi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zd": {
-      "__class__": "LogTocElement",
-      "ident": 438,
-      "group": "posCtl",
-      "name": "Zd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "Zff": {
-      "__class__": "LogTocElement",
-      "ident": 439,
-      "group": "posCtl",
-      "name": "Zff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXp": {
-      "__class__": "LogTocElement",
-      "ident": 440,
-      "group": "posCtl",
-      "name": "VXp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXi": {
-      "__class__": "LogTocElement",
-      "ident": 441,
-      "group": "posCtl",
-      "name": "VXi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXd": {
-      "__class__": "LogTocElement",
-      "ident": 442,
-      "group": "posCtl",
-      "name": "VXd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VXff": {
-      "__class__": "LogTocElement",
-      "ident": 443,
-      "group": "posCtl",
-      "name": "VXff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYp": {
-      "__class__": "LogTocElement",
-      "ident": 444,
-      "group": "posCtl",
-      "name": "VYp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYi": {
-      "__class__": "LogTocElement",
-      "ident": 445,
-      "group": "posCtl",
-      "name": "VYi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYd": {
-      "__class__": "LogTocElement",
-      "ident": 446,
-      "group": "posCtl",
-      "name": "VYd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VYff": {
-      "__class__": "LogTocElement",
-      "ident": 447,
-      "group": "posCtl",
-      "name": "VYff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZp": {
-      "__class__": "LogTocElement",
-      "ident": 448,
-      "group": "posCtl",
-      "name": "VZp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZi": {
-      "__class__": "LogTocElement",
-      "ident": 449,
-      "group": "posCtl",
-      "name": "VZi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZd": {
-      "__class__": "LogTocElement",
-      "ident": 450,
-      "group": "posCtl",
-      "name": "VZd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "VZff": {
-      "__class__": "LogTocElement",
-      "ident": 451,
-      "group": "posCtl",
-      "name": "VZff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "kalman": {
-    "stateX": {
-      "__class__": "LogTocElement",
-      "ident": 452,
-      "group": "kalman",
-      "name": "stateX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateY": {
-      "__class__": "LogTocElement",
-      "ident": 453,
-      "group": "kalman",
-      "name": "stateY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateZ": {
-      "__class__": "LogTocElement",
-      "ident": 454,
-      "group": "kalman",
-      "name": "stateZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePX": {
-      "__class__": "LogTocElement",
-      "ident": 455,
-      "group": "kalman",
-      "name": "statePX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePY": {
-      "__class__": "LogTocElement",
-      "ident": 456,
-      "group": "kalman",
-      "name": "statePY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "statePZ": {
-      "__class__": "LogTocElement",
-      "ident": 457,
-      "group": "kalman",
-      "name": "statePZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD0": {
-      "__class__": "LogTocElement",
-      "ident": 458,
-      "group": "kalman",
-      "name": "stateD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD1": {
-      "__class__": "LogTocElement",
-      "ident": 459,
-      "group": "kalman",
-      "name": "stateD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "stateD2": {
-      "__class__": "LogTocElement",
-      "ident": 460,
-      "group": "kalman",
-      "name": "stateD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varX": {
-      "__class__": "LogTocElement",
-      "ident": 461,
-      "group": "kalman",
-      "name": "varX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varY": {
-      "__class__": "LogTocElement",
-      "ident": 462,
-      "group": "kalman",
-      "name": "varY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varZ": {
-      "__class__": "LogTocElement",
-      "ident": 463,
-      "group": "kalman",
-      "name": "varZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPX": {
-      "__class__": "LogTocElement",
-      "ident": 464,
-      "group": "kalman",
-      "name": "varPX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPY": {
-      "__class__": "LogTocElement",
-      "ident": 465,
-      "group": "kalman",
-      "name": "varPY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varPZ": {
-      "__class__": "LogTocElement",
-      "ident": 466,
-      "group": "kalman",
-      "name": "varPZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD0": {
-      "__class__": "LogTocElement",
-      "ident": 467,
-      "group": "kalman",
-      "name": "varD0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD1": {
-      "__class__": "LogTocElement",
-      "ident": 468,
-      "group": "kalman",
-      "name": "varD1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "varD2": {
-      "__class__": "LogTocElement",
-      "ident": 469,
-      "group": "kalman",
-      "name": "varD2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q0": {
-      "__class__": "LogTocElement",
-      "ident": 470,
-      "group": "kalman",
-      "name": "q0",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q1": {
-      "__class__": "LogTocElement",
-      "ident": 471,
-      "group": "kalman",
-      "name": "q1",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q2": {
-      "__class__": "LogTocElement",
-      "ident": 472,
-      "group": "kalman",
-      "name": "q2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "q3": {
-      "__class__": "LogTocElement",
-      "ident": 473,
-      "group": "kalman",
-      "name": "q3",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtUpdate": {
-      "__class__": "LogTocElement",
-      "ident": 474,
-      "group": "kalman",
-      "name": "rtUpdate",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtPred": {
-      "__class__": "LogTocElement",
-      "ident": 475,
-      "group": "kalman",
-      "name": "rtPred",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtFinal": {
-      "__class__": "LogTocElement",
-      "ident": 476,
-      "group": "kalman",
-      "name": "rtFinal",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "outlierf": {
-    "lhWin": {
-      "__class__": "LogTocElement",
-      "ident": 477,
-      "group": "outlierf",
-      "name": "lhWin",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0
-    }
-  },
-  "estimator": {
-    "rtApnd": {
-      "__class__": "LogTocElement",
-      "ident": 478,
-      "group": "estimator",
-      "name": "rtApnd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "rtRej": {
-      "__class__": "LogTocElement",
-      "ident": 479,
-      "group": "estimator",
-      "name": "rtRej",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "posEstAlt": {
-    "estimatedZ": {
-      "__class__": "LogTocElement",
-      "ident": 480,
-      "group": "posEstAlt",
-      "name": "estimatedZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "estVZ": {
-      "__class__": "LogTocElement",
-      "ident": 481,
-      "group": "posEstAlt",
-      "name": "estVZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    },
-    "velocityZ": {
-      "__class__": "LogTocElement",
-      "ident": 482,
-      "group": "posEstAlt",
-      "name": "velocityZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0
-    }
-  },
-  "DTR_P2P": {
-    "rx_state": {
-      "__class__": "LogTocElement",
-      "ident": 483,
-      "group": "DTR_P2P",
-      "name": "rx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    },
-    "tx_state": {
-      "__class__": "LogTocElement",
-      "ident": 484,
-      "group": "DTR_P2P",
-      "name": "tx_state",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0
-    }
-  }
-}
\ No newline at end of file
diff --git i/src/webots_pkg/test/software/cache/9FA714B3.json w/src/webots_pkg/test/software/cache/9FA714B3.json
deleted file mode 100644
index 3c86bf4..0000000
--- i/src/webots_pkg/test/software/cache/9FA714B3.json
+++ /dev/null
@@ -1,2862 +0,0 @@
-{
-  "activeMarker": {
-    "front": {
-      "__class__": "ParamTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "front",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "back": {
-      "__class__": "ParamTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "back",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "left": {
-      "__class__": "ParamTocElement",
-      "ident": 2,
-      "group": "activeMarker",
-      "name": "left",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "right": {
-      "__class__": "ParamTocElement",
-      "ident": 3,
-      "group": "activeMarker",
-      "name": "right",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 4,
-      "group": "activeMarker",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "poll": {
-      "__class__": "ParamTocElement",
-      "ident": 5,
-      "group": "activeMarker",
-      "name": "poll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "deck": {
-    "bcActiveMarker": {
-      "__class__": "ParamTocElement",
-      "ident": 6,
-      "group": "deck",
-      "name": "bcActiveMarker",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcAI": {
-      "__class__": "ParamTocElement",
-      "ident": 7,
-      "group": "deck",
-      "name": "bcAI",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcBuzzer": {
-      "__class__": "ParamTocElement",
-      "ident": 8,
-      "group": "deck",
-      "name": "bcBuzzer",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow": {
-      "__class__": "ParamTocElement",
-      "ident": 9,
-      "group": "deck",
-      "name": "bcFlow",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow2": {
-      "__class__": "ParamTocElement",
-      "ident": 10,
-      "group": "deck",
-      "name": "bcFlow2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLedRing": {
-      "__class__": "ParamTocElement",
-      "ident": 11,
-      "group": "deck",
-      "name": "bcLedRing",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLighthouse4": {
-      "__class__": "ParamTocElement",
-      "ident": 12,
-      "group": "deck",
-      "name": "bcLighthouse4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcDWM1000": {
-      "__class__": "ParamTocElement",
-      "ident": 13,
-      "group": "deck",
-      "name": "bcDWM1000",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLoco": {
-      "__class__": "ParamTocElement",
-      "ident": 14,
-      "group": "deck",
-      "name": "bcLoco",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcMultiranger": {
-      "__class__": "ParamTocElement",
-      "ident": 15,
-      "group": "deck",
-      "name": "bcMultiranger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcOA": {
-      "__class__": "ParamTocElement",
-      "ident": 16,
-      "group": "deck",
-      "name": "bcOA",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcUSD": {
-      "__class__": "ParamTocElement",
-      "ident": 17,
-      "group": "deck",
-      "name": "bcUSD",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger": {
-      "__class__": "ParamTocElement",
-      "ident": 18,
-      "group": "deck",
-      "name": "bcZRanger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger2": {
-      "__class__": "ParamTocElement",
-      "ident": 19,
-      "group": "deck",
-      "name": "bcZRanger2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "motion": {
-    "disable": {
-      "__class__": "ParamTocElement",
-      "ident": 20,
-      "group": "motion",
-      "name": "disable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "adaptive": {
-      "__class__": "ParamTocElement",
-      "ident": 21,
-      "group": "motion",
-      "name": "adaptive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "flowStdFixed": {
-      "__class__": "ParamTocElement",
-      "ident": 22,
-      "group": "motion",
-      "name": "flowStdFixed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ring": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 23,
-      "group": "ring",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 24,
-      "group": "ring",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "solidRed": {
-      "__class__": "ParamTocElement",
-      "ident": 25,
-      "group": "ring",
-      "name": "solidRed",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidGreen": {
-      "__class__": "ParamTocElement",
-      "ident": 26,
-      "group": "ring",
-      "name": "solidGreen",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidBlue": {
-      "__class__": "ParamTocElement",
-      "ident": 27,
-      "group": "ring",
-      "name": "solidBlue",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "headlightEnable": {
-      "__class__": "ParamTocElement",
-      "ident": 28,
-      "group": "ring",
-      "name": "headlightEnable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "emptyCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 29,
-      "group": "ring",
-      "name": "emptyCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fullCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 30,
-      "group": "ring",
-      "name": "fullCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fadeColor": {
-      "__class__": "ParamTocElement",
-      "ident": 31,
-      "group": "ring",
-      "name": "fadeColor",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": false
-    },
-    "fadeTime": {
-      "__class__": "ParamTocElement",
-      "ident": 32,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "system": {
-    "highlight": {
-      "__class__": "ParamTocElement",
-      "ident": 33,
-      "group": "system",
-      "name": "highlight",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageStats": {
-      "__class__": "ParamTocElement",
-      "ident": 34,
-      "group": "system",
-      "name": "storageStats",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageReformat": {
-      "__class__": "ParamTocElement",
-      "ident": 35,
-      "group": "system",
-      "name": "storageReformat",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "taskDump": {
-      "__class__": "ParamTocElement",
-      "ident": 36,
-      "group": "system",
-      "name": "taskDump",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "selftestPassed": {
-      "__class__": "ParamTocElement",
-      "ident": 37,
-      "group": "system",
-      "name": "selftestPassed",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 1,
-      "extended": false
-    },
-    "forceArm": {
-      "__class__": "ParamTocElement",
-      "ident": 38,
-      "group": "system",
-      "name": "forceArm",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "assertInfo": {
-      "__class__": "ParamTocElement",
-      "ident": 39,
-      "group": "system",
-      "name": "assertInfo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "testLogParam": {
-      "__class__": "ParamTocElement",
-      "ident": 40,
-      "group": "system",
-      "name": "testLogParam",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 41,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa2": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 42,
-      "group": "tdoa2",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa3": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 43,
-      "group": "tdoa3",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "multiranger": {
-    "filterMask": {
-      "__class__": "ParamTocElement",
-      "ident": 44,
-      "group": "multiranger",
-      "name": "filterMask",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usd": {
-    "canLog": {
-      "__class__": "ParamTocElement",
-      "ident": 45,
-      "group": "usd",
-      "name": "canLog",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "logging": {
-      "__class__": "ParamTocElement",
-      "ident": 46,
-      "group": "usd",
-      "name": "logging",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "led": {
-    "bitmask": {
-      "__class__": "ParamTocElement",
-      "ident": 47,
-      "group": "led",
-      "name": "bitmask",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "motorPowerSet": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 48,
-      "group": "motorPowerSet",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "m1": {
-      "__class__": "ParamTocElement",
-      "ident": 49,
-      "group": "motorPowerSet",
-      "name": "m1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m2": {
-      "__class__": "ParamTocElement",
-      "ident": 50,
-      "group": "motorPowerSet",
-      "name": "m2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m3": {
-      "__class__": "ParamTocElement",
-      "ident": 51,
-      "group": "motorPowerSet",
-      "name": "m3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m4": {
-      "__class__": "ParamTocElement",
-      "ident": 52,
-      "group": "motorPowerSet",
-      "name": "m4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pm": {
-    "lowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 53,
-      "group": "pm",
-      "name": "lowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "criticalLowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 54,
-      "group": "pm",
-      "name": "criticalLowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "imu_sensors": {
-    "BMP388": {
-      "__class__": "ParamTocElement",
-      "ident": 55,
-      "group": "imu_sensors",
-      "name": "BMP388",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 56,
-      "group": "imu_sensors",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 57,
-      "group": "imu_sensors",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 58,
-      "group": "imu_sensors",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 59,
-      "group": "imu_sensors",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 60,
-      "group": "imu_sensors",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "imu_tests": {
-    "MPU6500": {
-      "__class__": "ParamTocElement",
-      "ident": 61,
-      "group": "imu_tests",
-      "name": "MPU6500",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 62,
-      "group": "imu_tests",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 63,
-      "group": "imu_tests",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 64,
-      "group": "imu_tests",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 65,
-      "group": "imu_tests",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 66,
-      "group": "imu_tests",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "syslink": {
-    "probe": {
-      "__class__": "ParamTocElement",
-      "ident": 67,
-      "group": "syslink",
-      "name": "probe",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usec": {
-    "reset": {
-      "__class__": "ParamTocElement",
-      "ident": 68,
-      "group": "usec",
-      "name": "reset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "colAv": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 69,
-      "group": "colAv",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidX": {
-      "__class__": "ParamTocElement",
-      "ident": 70,
-      "group": "colAv",
-      "name": "ellipsoidX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidY": {
-      "__class__": "ParamTocElement",
-      "ident": 71,
-      "group": "colAv",
-      "name": "ellipsoidY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidZ": {
-      "__class__": "ParamTocElement",
-      "ident": 72,
-      "group": "colAv",
-      "name": "ellipsoidZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinX": {
-      "__class__": "ParamTocElement",
-      "ident": 73,
-      "group": "colAv",
-      "name": "bboxMinX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinY": {
-      "__class__": "ParamTocElement",
-      "ident": 74,
-      "group": "colAv",
-      "name": "bboxMinY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinZ": {
-      "__class__": "ParamTocElement",
-      "ident": 75,
-      "group": "colAv",
-      "name": "bboxMinZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxX": {
-      "__class__": "ParamTocElement",
-      "ident": 76,
-      "group": "colAv",
-      "name": "bboxMaxX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxY": {
-      "__class__": "ParamTocElement",
-      "ident": 77,
-      "group": "colAv",
-      "name": "bboxMaxY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxZ": {
-      "__class__": "ParamTocElement",
-      "ident": 78,
-      "group": "colAv",
-      "name": "bboxMaxZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "horizon": {
-      "__class__": "ParamTocElement",
-      "ident": 79,
-      "group": "colAv",
-      "name": "horizon",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxSpeed": {
-      "__class__": "ParamTocElement",
-      "ident": 80,
-      "group": "colAv",
-      "name": "maxSpeed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sidestepThrsh": {
-      "__class__": "ParamTocElement",
-      "ident": 81,
-      "group": "colAv",
-      "name": "sidestepThrsh",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxPeerLocAge": {
-      "__class__": "ParamTocElement",
-      "ident": 82,
-      "group": "colAv",
-      "name": "maxPeerLocAge",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    },
-    "vorTol": {
-      "__class__": "ParamTocElement",
-      "ident": 83,
-      "group": "colAv",
-      "name": "vorTol",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vorIters": {
-      "__class__": "ParamTocElement",
-      "ident": 84,
-      "group": "colAv",
-      "name": "vorIters",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "commander": {
-    "enHighLevel": {
-      "__class__": "ParamTocElement",
-      "ident": 85,
-      "group": "commander",
-      "name": "enHighLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cppm": {
-    "rateRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 86,
-      "group": "cppm",
-      "name": "rateRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ratePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 87,
-      "group": "cppm",
-      "name": "ratePitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angPitch": {
-      "__class__": "ParamTocElement",
-      "ident": 88,
-      "group": "cppm",
-      "name": "angPitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 89,
-      "group": "cppm",
-      "name": "angRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 90,
-      "group": "cppm",
-      "name": "rateYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "hlCommander": {
-    "vtoff": {
-      "__class__": "ParamTocElement",
-      "ident": 91,
-      "group": "hlCommander",
-      "name": "vtoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vland": {
-      "__class__": "ParamTocElement",
-      "ident": 92,
-      "group": "hlCommander",
-      "name": "vland",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "flightmode": {
-    "althold": {
-      "__class__": "ParamTocElement",
-      "ident": 93,
-      "group": "flightmode",
-      "name": "althold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "poshold": {
-      "__class__": "ParamTocElement",
-      "ident": 94,
-      "group": "flightmode",
-      "name": "poshold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "posSet": {
-      "__class__": "ParamTocElement",
-      "ident": 95,
-      "group": "flightmode",
-      "name": "posSet",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "yawMode": {
-      "__class__": "ParamTocElement",
-      "ident": 96,
-      "group": "flightmode",
-      "name": "yawMode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 97,
-      "group": "flightmode",
-      "name": "stabModeRoll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 98,
-      "group": "flightmode",
-      "name": "stabModePitch",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 99,
-      "group": "flightmode",
-      "name": "stabModeYaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "locSrv": {
-    "enRangeStreamFP32": {
-      "__class__": "ParamTocElement",
-      "ident": 100,
-      "group": "locSrv",
-      "name": "enRangeStreamFP32",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "enLhAngleStream": {
-      "__class__": "ParamTocElement",
-      "ident": 101,
-      "group": "locSrv",
-      "name": "enLhAngleStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "extPosStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 102,
-      "group": "locSrv",
-      "name": "extPosStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "extQuatStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 103,
-      "group": "locSrv",
-      "name": "extQuatStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "crtpsrv": {
-    "echoDelay": {
-      "__class__": "ParamTocElement",
-      "ident": 104,
-      "group": "crtpsrv",
-      "name": "echoDelay",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "health": {
-    "startPropTest": {
-      "__class__": "ParamTocElement",
-      "ident": 105,
-      "group": "health",
-      "name": "startPropTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "startBatTest": {
-      "__class__": "ParamTocElement",
-      "ident": 106,
-      "group": "health",
-      "name": "startBatTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "propTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 107,
-      "group": "health",
-      "name": "propTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "batTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 108,
-      "group": "health",
-      "name": "batTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "kalman": {
-    "maxPos": {
-      "__class__": "ParamTocElement",
-      "ident": 109,
-      "group": "kalman",
-      "name": "maxPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxVel": {
-      "__class__": "ParamTocElement",
-      "ident": 110,
-      "group": "kalman",
-      "name": "maxVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "resetEstimation": {
-      "__class__": "ParamTocElement",
-      "ident": 111,
-      "group": "kalman",
-      "name": "resetEstimation",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTdoa": {
-      "__class__": "ParamTocElement",
-      "ident": 112,
-      "group": "kalman",
-      "name": "robustTdoa",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTwr": {
-      "__class__": "ParamTocElement",
-      "ident": 113,
-      "group": "kalman",
-      "name": "robustTwr",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "pNAcc_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 114,
-      "group": "kalman",
-      "name": "pNAcc_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAcc_z": {
-      "__class__": "ParamTocElement",
-      "ident": 115,
-      "group": "kalman",
-      "name": "pNAcc_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNVel": {
-      "__class__": "ParamTocElement",
-      "ident": 116,
-      "group": "kalman",
-      "name": "pNVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNPos": {
-      "__class__": "ParamTocElement",
-      "ident": 117,
-      "group": "kalman",
-      "name": "pNPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAtt": {
-      "__class__": "ParamTocElement",
-      "ident": 118,
-      "group": "kalman",
-      "name": "pNAtt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNBaro": {
-      "__class__": "ParamTocElement",
-      "ident": 119,
-      "group": "kalman",
-      "name": "mNBaro",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_rollpitch": {
-      "__class__": "ParamTocElement",
-      "ident": 120,
-      "group": "kalman",
-      "name": "mNGyro_rollpitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_yaw": {
-      "__class__": "ParamTocElement",
-      "ident": 121,
-      "group": "kalman",
-      "name": "mNGyro_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "initialX": {
-      "__class__": "ParamTocElement",
-      "ident": 122,
-      "group": "kalman",
-      "name": "initialX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialY": {
-      "__class__": "ParamTocElement",
-      "ident": 123,
-      "group": "kalman",
-      "name": "initialY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialZ": {
-      "__class__": "ParamTocElement",
-      "ident": 124,
-      "group": "kalman",
-      "name": "initialZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 125,
-      "group": "kalman",
-      "name": "initialYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "memTst": {
-    "resetW": {
-      "__class__": "ParamTocElement",
-      "ident": 126,
-      "group": "memTst",
-      "name": "resetW",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "powerDist": {
-    "idleThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 127,
-      "group": "powerDist",
-      "name": "idleThrust",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "quadSysId": {
-    "thrustToTorque": {
-      "__class__": "ParamTocElement",
-      "ident": 128,
-      "group": "quadSysId",
-      "name": "thrustToTorque",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustA": {
-      "__class__": "ParamTocElement",
-      "ident": 129,
-      "group": "quadSysId",
-      "name": "pwmToThrustA",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustB": {
-      "__class__": "ParamTocElement",
-      "ident": 130,
-      "group": "quadSysId",
-      "name": "pwmToThrustB",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "armLength": {
-      "__class__": "ParamTocElement",
-      "ident": 131,
-      "group": "quadSysId",
-      "name": "armLength",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sensfusion6": {
-    "kp": {
-      "__class__": "ParamTocElement",
-      "ident": 132,
-      "group": "sensfusion6",
-      "name": "kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki": {
-      "__class__": "ParamTocElement",
-      "ident": 133,
-      "group": "sensfusion6",
-      "name": "ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "baseZacc": {
-      "__class__": "ParamTocElement",
-      "ident": 134,
-      "group": "sensfusion6",
-      "name": "baseZacc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sound": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 135,
-      "group": "sound",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 136,
-      "group": "sound",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "freq": {
-      "__class__": "ParamTocElement",
-      "ident": 137,
-      "group": "sound",
-      "name": "freq",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "stabilizer": {
-    "estimator": {
-      "__class__": "ParamTocElement",
-      "ident": 138,
-      "group": "stabilizer",
-      "name": "estimator",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "controller": {
-      "__class__": "ParamTocElement",
-      "ident": 139,
-      "group": "stabilizer",
-      "name": "controller",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stop": {
-      "__class__": "ParamTocElement",
-      "ident": 140,
-      "group": "stabilizer",
-      "name": "stop",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cpu": {
-    "flash": {
-      "__class__": "ParamTocElement",
-      "ident": 141,
-      "group": "cpu",
-      "name": "flash",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "id0": {
-      "__class__": "ParamTocElement",
-      "ident": 142,
-      "group": "cpu",
-      "name": "id0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id1": {
-      "__class__": "ParamTocElement",
-      "ident": 143,
-      "group": "cpu",
-      "name": "id1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id2": {
-      "__class__": "ParamTocElement",
-      "ident": 144,
-      "group": "cpu",
-      "name": "id2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "tdoaEngine": {
-    "logId": {
-      "__class__": "ParamTocElement",
-      "ident": 145,
-      "group": "tdoaEngine",
-      "name": "logId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "logOthrId": {
-      "__class__": "ParamTocElement",
-      "ident": 146,
-      "group": "tdoaEngine",
-      "name": "logOthrId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "matchAlgo": {
-      "__class__": "ParamTocElement",
-      "ident": 147,
-      "group": "tdoaEngine",
-      "name": "matchAlgo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "lighthouse": {
-    "method": {
-      "__class__": "ParamTocElement",
-      "ident": 148,
-      "group": "lighthouse",
-      "name": "method",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsCalibReset": {
-      "__class__": "ParamTocElement",
-      "ident": 149,
-      "group": "lighthouse",
-      "name": "bsCalibReset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "systemType": {
-      "__class__": "ParamTocElement",
-      "ident": 150,
-      "group": "lighthouse",
-      "name": "systemType",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsAvailable": {
-      "__class__": "ParamTocElement",
-      "ident": 151,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "sweepStd": {
-      "__class__": "ParamTocElement",
-      "ident": 152,
-      "group": "lighthouse",
-      "name": "sweepStd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sweepStd2": {
-      "__class__": "ParamTocElement",
-      "ident": 153,
-      "group": "lighthouse",
-      "name": "sweepStd2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "enLhRawStream": {
-      "__class__": "ParamTocElement",
-      "ident": 154,
-      "group": "lighthouse",
-      "name": "enLhRawStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "lh2maxRate": {
-      "__class__": "ParamTocElement",
-      "ident": 155,
-      "group": "lighthouse",
-      "name": "lh2maxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pid_attitude": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 156,
-      "group": "pid_attitude",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 157,
-      "group": "pid_attitude",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 158,
-      "group": "pid_attitude",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 159,
-      "group": "pid_attitude",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 160,
-      "group": "pid_attitude",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 161,
-      "group": "pid_attitude",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 162,
-      "group": "pid_attitude",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 163,
-      "group": "pid_attitude",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 164,
-      "group": "pid_attitude",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 165,
-      "group": "pid_attitude",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 166,
-      "group": "pid_attitude",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 167,
-      "group": "pid_attitude",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yawMaxDelta": {
-      "__class__": "ParamTocElement",
-      "ident": 168,
-      "group": "pid_attitude",
-      "name": "yawMaxDelta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 169,
-      "group": "pid_attitude",
-      "name": "attFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 170,
-      "group": "pid_attitude",
-      "name": "attFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "pid_rate": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 171,
-      "group": "pid_rate",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 172,
-      "group": "pid_rate",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 173,
-      "group": "pid_rate",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 174,
-      "group": "pid_rate",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 175,
-      "group": "pid_rate",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 176,
-      "group": "pid_rate",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 177,
-      "group": "pid_rate",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 178,
-      "group": "pid_rate",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 179,
-      "group": "pid_rate",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 180,
-      "group": "pid_rate",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 181,
-      "group": "pid_rate",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 182,
-      "group": "pid_rate",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 183,
-      "group": "pid_rate",
-      "name": "rateFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "omxFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 184,
-      "group": "pid_rate",
-      "name": "omxFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omyFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 185,
-      "group": "pid_rate",
-      "name": "omyFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omzFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 186,
-      "group": "pid_rate",
-      "name": "omzFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlINDI": {
-    "thrust_threshold": {
-      "__class__": "ParamTocElement",
-      "ident": 187,
-      "group": "ctrlINDI",
-      "name": "thrust_threshold",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bound_ctrl_input": {
-      "__class__": "ParamTocElement",
-      "ident": 188,
-      "group": "ctrlINDI",
-      "name": "bound_ctrl_input",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_p": {
-      "__class__": "ParamTocElement",
-      "ident": 189,
-      "group": "ctrlINDI",
-      "name": "g1_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_q": {
-      "__class__": "ParamTocElement",
-      "ident": 190,
-      "group": "ctrlINDI",
-      "name": "g1_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_r": {
-      "__class__": "ParamTocElement",
-      "ident": 191,
-      "group": "ctrlINDI",
-      "name": "g1_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g2": {
-      "__class__": "ParamTocElement",
-      "ident": 192,
-      "group": "ctrlINDI",
-      "name": "g2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_p": {
-      "__class__": "ParamTocElement",
-      "ident": 193,
-      "group": "ctrlINDI",
-      "name": "ref_err_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_q": {
-      "__class__": "ParamTocElement",
-      "ident": 194,
-      "group": "ctrlINDI",
-      "name": "ref_err_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_r": {
-      "__class__": "ParamTocElement",
-      "ident": 195,
-      "group": "ctrlINDI",
-      "name": "ref_err_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_p": {
-      "__class__": "ParamTocElement",
-      "ident": 196,
-      "group": "ctrlINDI",
-      "name": "ref_rate_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_q": {
-      "__class__": "ParamTocElement",
-      "ident": 197,
-      "group": "ctrlINDI",
-      "name": "ref_rate_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_r": {
-      "__class__": "ParamTocElement",
-      "ident": 198,
-      "group": "ctrlINDI",
-      "name": "ref_rate_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_p": {
-      "__class__": "ParamTocElement",
-      "ident": 199,
-      "group": "ctrlINDI",
-      "name": "act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_q": {
-      "__class__": "ParamTocElement",
-      "ident": 200,
-      "group": "ctrlINDI",
-      "name": "act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_r": {
-      "__class__": "ParamTocElement",
-      "ident": 201,
-      "group": "ctrlINDI",
-      "name": "act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff": {
-      "__class__": "ParamTocElement",
-      "ident": 202,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff_r": {
-      "__class__": "ParamTocElement",
-      "ident": 203,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "outerLoopActive": {
-      "__class__": "ParamTocElement",
-      "ident": 204,
-      "group": "ctrlINDI",
-      "name": "outerLoopActive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ctrlMel": {
-    "kp_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 205,
-      "group": "ctrlMel",
-      "name": "kp_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 206,
-      "group": "ctrlMel",
-      "name": "kd_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 207,
-      "group": "ctrlMel",
-      "name": "ki_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 208,
-      "group": "ctrlMel",
-      "name": "i_range_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kp_z": {
-      "__class__": "ParamTocElement",
-      "ident": 209,
-      "group": "ctrlMel",
-      "name": "kp_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_z": {
-      "__class__": "ParamTocElement",
-      "ident": 210,
-      "group": "ctrlMel",
-      "name": "kd_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_z": {
-      "__class__": "ParamTocElement",
-      "ident": 211,
-      "group": "ctrlMel",
-      "name": "ki_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_z": {
-      "__class__": "ParamTocElement",
-      "ident": 212,
-      "group": "ctrlMel",
-      "name": "i_range_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mass": {
-      "__class__": "ParamTocElement",
-      "ident": 213,
-      "group": "ctrlMel",
-      "name": "mass",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "massThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 214,
-      "group": "ctrlMel",
-      "name": "massThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 215,
-      "group": "ctrlMel",
-      "name": "kR_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_z": {
-      "__class__": "ParamTocElement",
-      "ident": 216,
-      "group": "ctrlMel",
-      "name": "kR_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 217,
-      "group": "ctrlMel",
-      "name": "kw_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_z": {
-      "__class__": "ParamTocElement",
-      "ident": 218,
-      "group": "ctrlMel",
-      "name": "kw_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 219,
-      "group": "ctrlMel",
-      "name": "ki_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 220,
-      "group": "ctrlMel",
-      "name": "ki_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_omega_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 221,
-      "group": "ctrlMel",
-      "name": "kd_omega_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 222,
-      "group": "ctrlMel",
-      "name": "i_range_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 223,
-      "group": "ctrlMel",
-      "name": "i_range_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlAtt": {
-    "tau_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 224,
-      "group": "ctrlAtt",
-      "name": "tau_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 225,
-      "group": "ctrlAtt",
-      "name": "zeta_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_z": {
-      "__class__": "ParamTocElement",
-      "ident": 226,
-      "group": "ctrlAtt",
-      "name": "tau_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_z": {
-      "__class__": "ParamTocElement",
-      "ident": 227,
-      "group": "ctrlAtt",
-      "name": "zeta_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 228,
-      "group": "ctrlAtt",
-      "name": "tau_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "mixing_factor": {
-      "__class__": "ParamTocElement",
-      "ident": 229,
-      "group": "ctrlAtt",
-      "name": "mixing_factor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "coll_fairness": {
-      "__class__": "ParamTocElement",
-      "ident": 230,
-      "group": "ctrlAtt",
-      "name": "coll_fairness",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "posCtrlIndi": {
-    "K_xi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 231,
-      "group": "posCtrlIndi",
-      "name": "K_xi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 232,
-      "group": "posCtrlIndi",
-      "name": "K_xi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 233,
-      "group": "posCtrlIndi",
-      "name": "K_xi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 234,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 235,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 236,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pq_clamping": {
-      "__class__": "ParamTocElement",
-      "ident": 237,
-      "group": "posCtrlIndi",
-      "name": "pq_clamping",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "posCtlPid": {
-    "xKp": {
-      "__class__": "ParamTocElement",
-      "ident": 238,
-      "group": "posCtlPid",
-      "name": "xKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKi": {
-      "__class__": "ParamTocElement",
-      "ident": 239,
-      "group": "posCtlPid",
-      "name": "xKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKd": {
-      "__class__": "ParamTocElement",
-      "ident": 240,
-      "group": "posCtlPid",
-      "name": "xKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKff": {
-      "__class__": "ParamTocElement",
-      "ident": 241,
-      "group": "posCtlPid",
-      "name": "xKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKp": {
-      "__class__": "ParamTocElement",
-      "ident": 242,
-      "group": "posCtlPid",
-      "name": "yKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKi": {
-      "__class__": "ParamTocElement",
-      "ident": 243,
-      "group": "posCtlPid",
-      "name": "yKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKd": {
-      "__class__": "ParamTocElement",
-      "ident": 244,
-      "group": "posCtlPid",
-      "name": "yKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKff": {
-      "__class__": "ParamTocElement",
-      "ident": 245,
-      "group": "posCtlPid",
-      "name": "yKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKp": {
-      "__class__": "ParamTocElement",
-      "ident": 246,
-      "group": "posCtlPid",
-      "name": "zKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKi": {
-      "__class__": "ParamTocElement",
-      "ident": 247,
-      "group": "posCtlPid",
-      "name": "zKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKd": {
-      "__class__": "ParamTocElement",
-      "ident": 248,
-      "group": "posCtlPid",
-      "name": "zKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKff": {
-      "__class__": "ParamTocElement",
-      "ident": 249,
-      "group": "posCtlPid",
-      "name": "zKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "thrustBase": {
-      "__class__": "ParamTocElement",
-      "ident": 250,
-      "group": "posCtlPid",
-      "name": "thrustBase",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "thrustMin": {
-      "__class__": "ParamTocElement",
-      "ident": 251,
-      "group": "posCtlPid",
-      "name": "thrustMin",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "rLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 252,
-      "group": "posCtlPid",
-      "name": "rLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 253,
-      "group": "posCtlPid",
-      "name": "pLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 254,
-      "group": "posCtlPid",
-      "name": "xVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 255,
-      "group": "posCtlPid",
-      "name": "yVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 256,
-      "group": "posCtlPid",
-      "name": "zVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "velCtlPid": {
-    "vxKp": {
-      "__class__": "ParamTocElement",
-      "ident": 257,
-      "group": "velCtlPid",
-      "name": "vxKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKi": {
-      "__class__": "ParamTocElement",
-      "ident": 258,
-      "group": "velCtlPid",
-      "name": "vxKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKd": {
-      "__class__": "ParamTocElement",
-      "ident": 259,
-      "group": "velCtlPid",
-      "name": "vxKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 260,
-      "group": "velCtlPid",
-      "name": "vxKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKp": {
-      "__class__": "ParamTocElement",
-      "ident": 261,
-      "group": "velCtlPid",
-      "name": "vyKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKi": {
-      "__class__": "ParamTocElement",
-      "ident": 262,
-      "group": "velCtlPid",
-      "name": "vyKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKd": {
-      "__class__": "ParamTocElement",
-      "ident": 263,
-      "group": "velCtlPid",
-      "name": "vyKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 264,
-      "group": "velCtlPid",
-      "name": "vyKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKp": {
-      "__class__": "ParamTocElement",
-      "ident": 265,
-      "group": "velCtlPid",
-      "name": "vzKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKi": {
-      "__class__": "ParamTocElement",
-      "ident": 266,
-      "group": "velCtlPid",
-      "name": "vzKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKd": {
-      "__class__": "ParamTocElement",
-      "ident": 267,
-      "group": "velCtlPid",
-      "name": "vzKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 268,
-      "group": "velCtlPid",
-      "name": "vzKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "posEstAlt": {
-    "estAlphaAsl": {
-      "__class__": "ParamTocElement",
-      "ident": 269,
-      "group": "posEstAlt",
-      "name": "estAlphaAsl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "estAlphaZr": {
-      "__class__": "ParamTocElement",
-      "ident": 270,
-      "group": "posEstAlt",
-      "name": "estAlphaZr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velFactor": {
-      "__class__": "ParamTocElement",
-      "ident": 271,
-      "group": "posEstAlt",
-      "name": "velFactor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velZAlpha": {
-      "__class__": "ParamTocElement",
-      "ident": 272,
-      "group": "posEstAlt",
-      "name": "velZAlpha",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vAccDeadband": {
-      "__class__": "ParamTocElement",
-      "ident": 273,
-      "group": "posEstAlt",
-      "name": "vAccDeadband",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "firmware": {
-    "revision0": {
-      "__class__": "ParamTocElement",
-      "ident": 274,
-      "group": "firmware",
-      "name": "revision0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "revision1": {
-      "__class__": "ParamTocElement",
-      "ident": 275,
-      "group": "firmware",
-      "name": "revision1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "modified": {
-      "__class__": "ParamTocElement",
-      "ident": 276,
-      "group": "firmware",
-      "name": "modified",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  }
-}
\ No newline at end of file
diff --git i/src/webots_pkg/test/software/cache/C6165696.json w/src/webots_pkg/test/software/cache/C6165696.json
deleted file mode 100644
index 6bb840d..0000000
--- i/src/webots_pkg/test/software/cache/C6165696.json
+++ /dev/null
@@ -1,2884 +0,0 @@
-{
-  "activeMarker": {
-    "front": {
-      "__class__": "ParamTocElement",
-      "ident": 0,
-      "group": "activeMarker",
-      "name": "front",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "back": {
-      "__class__": "ParamTocElement",
-      "ident": 1,
-      "group": "activeMarker",
-      "name": "back",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "left": {
-      "__class__": "ParamTocElement",
-      "ident": 2,
-      "group": "activeMarker",
-      "name": "left",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "right": {
-      "__class__": "ParamTocElement",
-      "ident": 3,
-      "group": "activeMarker",
-      "name": "right",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 4,
-      "group": "activeMarker",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "poll": {
-      "__class__": "ParamTocElement",
-      "ident": 5,
-      "group": "activeMarker",
-      "name": "poll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "deck": {
-    "bcActiveMarker": {
-      "__class__": "ParamTocElement",
-      "ident": 6,
-      "group": "deck",
-      "name": "bcActiveMarker",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcAI": {
-      "__class__": "ParamTocElement",
-      "ident": 7,
-      "group": "deck",
-      "name": "bcAI",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcBuzzer": {
-      "__class__": "ParamTocElement",
-      "ident": 8,
-      "group": "deck",
-      "name": "bcBuzzer",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow": {
-      "__class__": "ParamTocElement",
-      "ident": 9,
-      "group": "deck",
-      "name": "bcFlow",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcFlow2": {
-      "__class__": "ParamTocElement",
-      "ident": 10,
-      "group": "deck",
-      "name": "bcFlow2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLedRing": {
-      "__class__": "ParamTocElement",
-      "ident": 11,
-      "group": "deck",
-      "name": "bcLedRing",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLighthouse4": {
-      "__class__": "ParamTocElement",
-      "ident": 12,
-      "group": "deck",
-      "name": "bcLighthouse4",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcDWM1000": {
-      "__class__": "ParamTocElement",
-      "ident": 13,
-      "group": "deck",
-      "name": "bcDWM1000",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcLoco": {
-      "__class__": "ParamTocElement",
-      "ident": 14,
-      "group": "deck",
-      "name": "bcLoco",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcMultiranger": {
-      "__class__": "ParamTocElement",
-      "ident": 15,
-      "group": "deck",
-      "name": "bcMultiranger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcOA": {
-      "__class__": "ParamTocElement",
-      "ident": 16,
-      "group": "deck",
-      "name": "bcOA",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcUSD": {
-      "__class__": "ParamTocElement",
-      "ident": 17,
-      "group": "deck",
-      "name": "bcUSD",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger": {
-      "__class__": "ParamTocElement",
-      "ident": 18,
-      "group": "deck",
-      "name": "bcZRanger",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "bcZRanger2": {
-      "__class__": "ParamTocElement",
-      "ident": 19,
-      "group": "deck",
-      "name": "bcZRanger2",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "motion": {
-    "disable": {
-      "__class__": "ParamTocElement",
-      "ident": 20,
-      "group": "motion",
-      "name": "disable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "adaptive": {
-      "__class__": "ParamTocElement",
-      "ident": 21,
-      "group": "motion",
-      "name": "adaptive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "flowStdFixed": {
-      "__class__": "ParamTocElement",
-      "ident": 22,
-      "group": "motion",
-      "name": "flowStdFixed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ring": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 23,
-      "group": "ring",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 24,
-      "group": "ring",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "solidRed": {
-      "__class__": "ParamTocElement",
-      "ident": 25,
-      "group": "ring",
-      "name": "solidRed",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidGreen": {
-      "__class__": "ParamTocElement",
-      "ident": 26,
-      "group": "ring",
-      "name": "solidGreen",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "solidBlue": {
-      "__class__": "ParamTocElement",
-      "ident": 27,
-      "group": "ring",
-      "name": "solidBlue",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "headlightEnable": {
-      "__class__": "ParamTocElement",
-      "ident": 28,
-      "group": "ring",
-      "name": "headlightEnable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "emptyCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 29,
-      "group": "ring",
-      "name": "emptyCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fullCharge": {
-      "__class__": "ParamTocElement",
-      "ident": 30,
-      "group": "ring",
-      "name": "fullCharge",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "fadeColor": {
-      "__class__": "ParamTocElement",
-      "ident": 31,
-      "group": "ring",
-      "name": "fadeColor",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": false
-    },
-    "fadeTime": {
-      "__class__": "ParamTocElement",
-      "ident": 32,
-      "group": "ring",
-      "name": "fadeTime",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "system": {
-    "highlight": {
-      "__class__": "ParamTocElement",
-      "ident": 33,
-      "group": "system",
-      "name": "highlight",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageStats": {
-      "__class__": "ParamTocElement",
-      "ident": 34,
-      "group": "system",
-      "name": "storageStats",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "storageReformat": {
-      "__class__": "ParamTocElement",
-      "ident": 35,
-      "group": "system",
-      "name": "storageReformat",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "arm": {
-      "__class__": "ParamTocElement",
-      "ident": 36,
-      "group": "system",
-      "name": "arm",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": false
-    },
-    "taskDump": {
-      "__class__": "ParamTocElement",
-      "ident": 37,
-      "group": "system",
-      "name": "taskDump",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "selftestPassed": {
-      "__class__": "ParamTocElement",
-      "ident": 38,
-      "group": "system",
-      "name": "selftestPassed",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 1,
-      "extended": false
-    },
-    "assertInfo": {
-      "__class__": "ParamTocElement",
-      "ident": 39,
-      "group": "system",
-      "name": "assertInfo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "testLogParam": {
-      "__class__": "ParamTocElement",
-      "ident": 40,
-      "group": "system",
-      "name": "testLogParam",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "doAssert": {
-      "__class__": "ParamTocElement",
-      "ident": 41,
-      "group": "system",
-      "name": "doAssert",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "loco": {
-    "mode": {
-      "__class__": "ParamTocElement",
-      "ident": 42,
-      "group": "loco",
-      "name": "mode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa2": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 43,
-      "group": "tdoa2",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "tdoa3": {
-    "stddev": {
-      "__class__": "ParamTocElement",
-      "ident": 44,
-      "group": "tdoa3",
-      "name": "stddev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "multiranger": {
-    "filterMask": {
-      "__class__": "ParamTocElement",
-      "ident": 45,
-      "group": "multiranger",
-      "name": "filterMask",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usd": {
-    "canLog": {
-      "__class__": "ParamTocElement",
-      "ident": 46,
-      "group": "usd",
-      "name": "canLog",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "logging": {
-      "__class__": "ParamTocElement",
-      "ident": 47,
-      "group": "usd",
-      "name": "logging",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "led": {
-    "bitmask": {
-      "__class__": "ParamTocElement",
-      "ident": 48,
-      "group": "led",
-      "name": "bitmask",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "motorPowerSet": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 49,
-      "group": "motorPowerSet",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "m1": {
-      "__class__": "ParamTocElement",
-      "ident": 50,
-      "group": "motorPowerSet",
-      "name": "m1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m2": {
-      "__class__": "ParamTocElement",
-      "ident": 51,
-      "group": "motorPowerSet",
-      "name": "m2",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m3": {
-      "__class__": "ParamTocElement",
-      "ident": 52,
-      "group": "motorPowerSet",
-      "name": "m3",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    },
-    "m4": {
-      "__class__": "ParamTocElement",
-      "ident": 53,
-      "group": "motorPowerSet",
-      "name": "m4",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pm": {
-    "lowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 54,
-      "group": "pm",
-      "name": "lowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "criticalLowVoltage": {
-      "__class__": "ParamTocElement",
-      "ident": 55,
-      "group": "pm",
-      "name": "criticalLowVoltage",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "imu_sensors": {
-    "BMP388": {
-      "__class__": "ParamTocElement",
-      "ident": 56,
-      "group": "imu_sensors",
-      "name": "BMP388",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 57,
-      "group": "imu_sensors",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 58,
-      "group": "imu_sensors",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 59,
-      "group": "imu_sensors",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 60,
-      "group": "imu_sensors",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 61,
-      "group": "imu_sensors",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "imu_tests": {
-    "MPU6500": {
-      "__class__": "ParamTocElement",
-      "ident": 62,
-      "group": "imu_tests",
-      "name": "MPU6500",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "AK8963": {
-      "__class__": "ParamTocElement",
-      "ident": 63,
-      "group": "imu_tests",
-      "name": "AK8963",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "LPS25H": {
-      "__class__": "ParamTocElement",
-      "ident": 64,
-      "group": "imu_tests",
-      "name": "LPS25H",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    },
-    "imuPhi": {
-      "__class__": "ParamTocElement",
-      "ident": 65,
-      "group": "imu_tests",
-      "name": "imuPhi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuTheta": {
-      "__class__": "ParamTocElement",
-      "ident": 66,
-      "group": "imu_tests",
-      "name": "imuTheta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "imuPsi": {
-      "__class__": "ParamTocElement",
-      "ident": 67,
-      "group": "imu_tests",
-      "name": "imuPsi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "syslink": {
-    "probe": {
-      "__class__": "ParamTocElement",
-      "ident": 68,
-      "group": "syslink",
-      "name": "probe",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "usec": {
-    "reset": {
-      "__class__": "ParamTocElement",
-      "ident": 69,
-      "group": "usec",
-      "name": "reset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "colAv": {
-    "enable": {
-      "__class__": "ParamTocElement",
-      "ident": 70,
-      "group": "colAv",
-      "name": "enable",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidX": {
-      "__class__": "ParamTocElement",
-      "ident": 71,
-      "group": "colAv",
-      "name": "ellipsoidX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidY": {
-      "__class__": "ParamTocElement",
-      "ident": 72,
-      "group": "colAv",
-      "name": "ellipsoidY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ellipsoidZ": {
-      "__class__": "ParamTocElement",
-      "ident": 73,
-      "group": "colAv",
-      "name": "ellipsoidZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinX": {
-      "__class__": "ParamTocElement",
-      "ident": 74,
-      "group": "colAv",
-      "name": "bboxMinX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinY": {
-      "__class__": "ParamTocElement",
-      "ident": 75,
-      "group": "colAv",
-      "name": "bboxMinY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMinZ": {
-      "__class__": "ParamTocElement",
-      "ident": 76,
-      "group": "colAv",
-      "name": "bboxMinZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxX": {
-      "__class__": "ParamTocElement",
-      "ident": 77,
-      "group": "colAv",
-      "name": "bboxMaxX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxY": {
-      "__class__": "ParamTocElement",
-      "ident": 78,
-      "group": "colAv",
-      "name": "bboxMaxY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bboxMaxZ": {
-      "__class__": "ParamTocElement",
-      "ident": 79,
-      "group": "colAv",
-      "name": "bboxMaxZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "horizon": {
-      "__class__": "ParamTocElement",
-      "ident": 80,
-      "group": "colAv",
-      "name": "horizon",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxSpeed": {
-      "__class__": "ParamTocElement",
-      "ident": 81,
-      "group": "colAv",
-      "name": "maxSpeed",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sidestepThrsh": {
-      "__class__": "ParamTocElement",
-      "ident": 82,
-      "group": "colAv",
-      "name": "sidestepThrsh",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxPeerLocAge": {
-      "__class__": "ParamTocElement",
-      "ident": 83,
-      "group": "colAv",
-      "name": "maxPeerLocAge",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    },
-    "vorTol": {
-      "__class__": "ParamTocElement",
-      "ident": 84,
-      "group": "colAv",
-      "name": "vorTol",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vorIters": {
-      "__class__": "ParamTocElement",
-      "ident": 85,
-      "group": "colAv",
-      "name": "vorIters",
-      "ctype": "int32_t",
-      "pytype": "<i",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "commander": {
-    "enHighLevel": {
-      "__class__": "ParamTocElement",
-      "ident": 86,
-      "group": "commander",
-      "name": "enHighLevel",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cppm": {
-    "rateRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 87,
-      "group": "cppm",
-      "name": "rateRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ratePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 88,
-      "group": "cppm",
-      "name": "ratePitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angPitch": {
-      "__class__": "ParamTocElement",
-      "ident": 89,
-      "group": "cppm",
-      "name": "angPitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "angRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 90,
-      "group": "cppm",
-      "name": "angRoll",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 91,
-      "group": "cppm",
-      "name": "rateYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "hlCommander": {
-    "vtoff": {
-      "__class__": "ParamTocElement",
-      "ident": 92,
-      "group": "hlCommander",
-      "name": "vtoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "vland": {
-      "__class__": "ParamTocElement",
-      "ident": 93,
-      "group": "hlCommander",
-      "name": "vland",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "flightmode": {
-    "althold": {
-      "__class__": "ParamTocElement",
-      "ident": 94,
-      "group": "flightmode",
-      "name": "althold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "poshold": {
-      "__class__": "ParamTocElement",
-      "ident": 95,
-      "group": "flightmode",
-      "name": "poshold",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "posSet": {
-      "__class__": "ParamTocElement",
-      "ident": 96,
-      "group": "flightmode",
-      "name": "posSet",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "yawMode": {
-      "__class__": "ParamTocElement",
-      "ident": 97,
-      "group": "flightmode",
-      "name": "yawMode",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeRoll": {
-      "__class__": "ParamTocElement",
-      "ident": 98,
-      "group": "flightmode",
-      "name": "stabModeRoll",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModePitch": {
-      "__class__": "ParamTocElement",
-      "ident": 99,
-      "group": "flightmode",
-      "name": "stabModePitch",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stabModeYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 100,
-      "group": "flightmode",
-      "name": "stabModeYaw",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "locSrv": {
-    "enRangeStreamFP32": {
-      "__class__": "ParamTocElement",
-      "ident": 101,
-      "group": "locSrv",
-      "name": "enRangeStreamFP32",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "enLhAngleStream": {
-      "__class__": "ParamTocElement",
-      "ident": 102,
-      "group": "locSrv",
-      "name": "enLhAngleStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "extPosStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 103,
-      "group": "locSrv",
-      "name": "extPosStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "extQuatStdDev": {
-      "__class__": "ParamTocElement",
-      "ident": 104,
-      "group": "locSrv",
-      "name": "extQuatStdDev",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "crtpsrv": {
-    "echoDelay": {
-      "__class__": "ParamTocElement",
-      "ident": 105,
-      "group": "crtpsrv",
-      "name": "echoDelay",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "health": {
-    "startPropTest": {
-      "__class__": "ParamTocElement",
-      "ident": 106,
-      "group": "health",
-      "name": "startPropTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "startBatTest": {
-      "__class__": "ParamTocElement",
-      "ident": 107,
-      "group": "health",
-      "name": "startBatTest",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "propTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 108,
-      "group": "health",
-      "name": "propTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "batTestPWMRatio": {
-      "__class__": "ParamTocElement",
-      "ident": 109,
-      "group": "health",
-      "name": "batTestPWMRatio",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "kalman": {
-    "maxPos": {
-      "__class__": "ParamTocElement",
-      "ident": 110,
-      "group": "kalman",
-      "name": "maxPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "maxVel": {
-      "__class__": "ParamTocElement",
-      "ident": 111,
-      "group": "kalman",
-      "name": "maxVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "resetEstimation": {
-      "__class__": "ParamTocElement",
-      "ident": 112,
-      "group": "kalman",
-      "name": "resetEstimation",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTdoa": {
-      "__class__": "ParamTocElement",
-      "ident": 113,
-      "group": "kalman",
-      "name": "robustTdoa",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "robustTwr": {
-      "__class__": "ParamTocElement",
-      "ident": 114,
-      "group": "kalman",
-      "name": "robustTwr",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "pNAcc_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 115,
-      "group": "kalman",
-      "name": "pNAcc_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAcc_z": {
-      "__class__": "ParamTocElement",
-      "ident": 116,
-      "group": "kalman",
-      "name": "pNAcc_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNVel": {
-      "__class__": "ParamTocElement",
-      "ident": 117,
-      "group": "kalman",
-      "name": "pNVel",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNPos": {
-      "__class__": "ParamTocElement",
-      "ident": 118,
-      "group": "kalman",
-      "name": "pNPos",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pNAtt": {
-      "__class__": "ParamTocElement",
-      "ident": 119,
-      "group": "kalman",
-      "name": "pNAtt",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNBaro": {
-      "__class__": "ParamTocElement",
-      "ident": 120,
-      "group": "kalman",
-      "name": "mNBaro",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_rollpitch": {
-      "__class__": "ParamTocElement",
-      "ident": 121,
-      "group": "kalman",
-      "name": "mNGyro_rollpitch",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mNGyro_yaw": {
-      "__class__": "ParamTocElement",
-      "ident": 122,
-      "group": "kalman",
-      "name": "mNGyro_yaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "initialX": {
-      "__class__": "ParamTocElement",
-      "ident": 123,
-      "group": "kalman",
-      "name": "initialX",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialY": {
-      "__class__": "ParamTocElement",
-      "ident": 124,
-      "group": "kalman",
-      "name": "initialY",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialZ": {
-      "__class__": "ParamTocElement",
-      "ident": 125,
-      "group": "kalman",
-      "name": "initialZ",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "initialYaw": {
-      "__class__": "ParamTocElement",
-      "ident": 126,
-      "group": "kalman",
-      "name": "initialYaw",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "memTst": {
-    "resetW": {
-      "__class__": "ParamTocElement",
-      "ident": 127,
-      "group": "memTst",
-      "name": "resetW",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "powerDist": {
-    "idleThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 128,
-      "group": "powerDist",
-      "name": "idleThrust",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "quadSysId": {
-    "thrustToTorque": {
-      "__class__": "ParamTocElement",
-      "ident": 129,
-      "group": "quadSysId",
-      "name": "thrustToTorque",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustA": {
-      "__class__": "ParamTocElement",
-      "ident": 130,
-      "group": "quadSysId",
-      "name": "pwmToThrustA",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pwmToThrustB": {
-      "__class__": "ParamTocElement",
-      "ident": 131,
-      "group": "quadSysId",
-      "name": "pwmToThrustB",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "armLength": {
-      "__class__": "ParamTocElement",
-      "ident": 132,
-      "group": "quadSysId",
-      "name": "armLength",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sensfusion6": {
-    "kp": {
-      "__class__": "ParamTocElement",
-      "ident": 133,
-      "group": "sensfusion6",
-      "name": "kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki": {
-      "__class__": "ParamTocElement",
-      "ident": 134,
-      "group": "sensfusion6",
-      "name": "ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "baseZacc": {
-      "__class__": "ParamTocElement",
-      "ident": 135,
-      "group": "sensfusion6",
-      "name": "baseZacc",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "sound": {
-    "effect": {
-      "__class__": "ParamTocElement",
-      "ident": 136,
-      "group": "sound",
-      "name": "effect",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": true
-    },
-    "neffect": {
-      "__class__": "ParamTocElement",
-      "ident": 137,
-      "group": "sound",
-      "name": "neffect",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "freq": {
-      "__class__": "ParamTocElement",
-      "ident": 138,
-      "group": "sound",
-      "name": "freq",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "stabilizer": {
-    "estimator": {
-      "__class__": "ParamTocElement",
-      "ident": 139,
-      "group": "stabilizer",
-      "name": "estimator",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "controller": {
-      "__class__": "ParamTocElement",
-      "ident": 140,
-      "group": "stabilizer",
-      "name": "controller",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "stop": {
-      "__class__": "ParamTocElement",
-      "ident": 141,
-      "group": "stabilizer",
-      "name": "stop",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "supervisor": {
-    "infdmp": {
-      "__class__": "ParamTocElement",
-      "ident": 142,
-      "group": "supervisor",
-      "name": "infdmp",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "cpu": {
-    "flash": {
-      "__class__": "ParamTocElement",
-      "ident": 143,
-      "group": "cpu",
-      "name": "flash",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "id0": {
-      "__class__": "ParamTocElement",
-      "ident": 144,
-      "group": "cpu",
-      "name": "id0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id1": {
-      "__class__": "ParamTocElement",
-      "ident": 145,
-      "group": "cpu",
-      "name": "id1",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "id2": {
-      "__class__": "ParamTocElement",
-      "ident": 146,
-      "group": "cpu",
-      "name": "id2",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    }
-  },
-  "tdoaEngine": {
-    "logId": {
-      "__class__": "ParamTocElement",
-      "ident": 147,
-      "group": "tdoaEngine",
-      "name": "logId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "logOthrId": {
-      "__class__": "ParamTocElement",
-      "ident": 148,
-      "group": "tdoaEngine",
-      "name": "logOthrId",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "matchAlgo": {
-      "__class__": "ParamTocElement",
-      "ident": 149,
-      "group": "tdoaEngine",
-      "name": "matchAlgo",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "lighthouse": {
-    "method": {
-      "__class__": "ParamTocElement",
-      "ident": 150,
-      "group": "lighthouse",
-      "name": "method",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsCalibReset": {
-      "__class__": "ParamTocElement",
-      "ident": 151,
-      "group": "lighthouse",
-      "name": "bsCalibReset",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "systemType": {
-      "__class__": "ParamTocElement",
-      "ident": 152,
-      "group": "lighthouse",
-      "name": "systemType",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "bsAvailable": {
-      "__class__": "ParamTocElement",
-      "ident": 153,
-      "group": "lighthouse",
-      "name": "bsAvailable",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "sweepStd": {
-      "__class__": "ParamTocElement",
-      "ident": 154,
-      "group": "lighthouse",
-      "name": "sweepStd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "sweepStd2": {
-      "__class__": "ParamTocElement",
-      "ident": 155,
-      "group": "lighthouse",
-      "name": "sweepStd2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "enLhRawStream": {
-      "__class__": "ParamTocElement",
-      "ident": 156,
-      "group": "lighthouse",
-      "name": "enLhRawStream",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    },
-    "lh2maxRate": {
-      "__class__": "ParamTocElement",
-      "ident": 157,
-      "group": "lighthouse",
-      "name": "lh2maxRate",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "pid_attitude": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 158,
-      "group": "pid_attitude",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 159,
-      "group": "pid_attitude",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 160,
-      "group": "pid_attitude",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 161,
-      "group": "pid_attitude",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 162,
-      "group": "pid_attitude",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 163,
-      "group": "pid_attitude",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 164,
-      "group": "pid_attitude",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 165,
-      "group": "pid_attitude",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 166,
-      "group": "pid_attitude",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 167,
-      "group": "pid_attitude",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 168,
-      "group": "pid_attitude",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 169,
-      "group": "pid_attitude",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yawMaxDelta": {
-      "__class__": "ParamTocElement",
-      "ident": 170,
-      "group": "pid_attitude",
-      "name": "yawMaxDelta",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 171,
-      "group": "pid_attitude",
-      "name": "attFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "attFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 172,
-      "group": "pid_attitude",
-      "name": "attFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "pid_rate": {
-    "roll_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 173,
-      "group": "pid_rate",
-      "name": "roll_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 174,
-      "group": "pid_rate",
-      "name": "roll_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 175,
-      "group": "pid_rate",
-      "name": "roll_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "roll_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 176,
-      "group": "pid_rate",
-      "name": "roll_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 177,
-      "group": "pid_rate",
-      "name": "pitch_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 178,
-      "group": "pid_rate",
-      "name": "pitch_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 179,
-      "group": "pid_rate",
-      "name": "pitch_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pitch_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 180,
-      "group": "pid_rate",
-      "name": "pitch_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kp": {
-      "__class__": "ParamTocElement",
-      "ident": 181,
-      "group": "pid_rate",
-      "name": "yaw_kp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_ki": {
-      "__class__": "ParamTocElement",
-      "ident": 182,
-      "group": "pid_rate",
-      "name": "yaw_ki",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kd": {
-      "__class__": "ParamTocElement",
-      "ident": 183,
-      "group": "pid_rate",
-      "name": "yaw_kd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yaw_kff": {
-      "__class__": "ParamTocElement",
-      "ident": 184,
-      "group": "pid_rate",
-      "name": "yaw_kff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "rateFiltEn": {
-      "__class__": "ParamTocElement",
-      "ident": 185,
-      "group": "pid_rate",
-      "name": "rateFiltEn",
-      "ctype": "int8_t",
-      "pytype": "<b",
-      "access": 0,
-      "extended": true
-    },
-    "omxFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 186,
-      "group": "pid_rate",
-      "name": "omxFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omyFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 187,
-      "group": "pid_rate",
-      "name": "omyFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "omzFiltCut": {
-      "__class__": "ParamTocElement",
-      "ident": 188,
-      "group": "pid_rate",
-      "name": "omzFiltCut",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlINDI": {
-    "thrust_threshold": {
-      "__class__": "ParamTocElement",
-      "ident": 189,
-      "group": "ctrlINDI",
-      "name": "thrust_threshold",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "bound_ctrl_input": {
-      "__class__": "ParamTocElement",
-      "ident": 190,
-      "group": "ctrlINDI",
-      "name": "bound_ctrl_input",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_p": {
-      "__class__": "ParamTocElement",
-      "ident": 191,
-      "group": "ctrlINDI",
-      "name": "g1_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_q": {
-      "__class__": "ParamTocElement",
-      "ident": 192,
-      "group": "ctrlINDI",
-      "name": "g1_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g1_r": {
-      "__class__": "ParamTocElement",
-      "ident": 193,
-      "group": "ctrlINDI",
-      "name": "g1_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "g2": {
-      "__class__": "ParamTocElement",
-      "ident": 194,
-      "group": "ctrlINDI",
-      "name": "g2",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_p": {
-      "__class__": "ParamTocElement",
-      "ident": 195,
-      "group": "ctrlINDI",
-      "name": "ref_err_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_q": {
-      "__class__": "ParamTocElement",
-      "ident": 196,
-      "group": "ctrlINDI",
-      "name": "ref_err_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_err_r": {
-      "__class__": "ParamTocElement",
-      "ident": 197,
-      "group": "ctrlINDI",
-      "name": "ref_err_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_p": {
-      "__class__": "ParamTocElement",
-      "ident": 198,
-      "group": "ctrlINDI",
-      "name": "ref_rate_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_q": {
-      "__class__": "ParamTocElement",
-      "ident": 199,
-      "group": "ctrlINDI",
-      "name": "ref_rate_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "ref_rate_r": {
-      "__class__": "ParamTocElement",
-      "ident": 200,
-      "group": "ctrlINDI",
-      "name": "ref_rate_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_p": {
-      "__class__": "ParamTocElement",
-      "ident": 201,
-      "group": "ctrlINDI",
-      "name": "act_dyn_p",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_q": {
-      "__class__": "ParamTocElement",
-      "ident": 202,
-      "group": "ctrlINDI",
-      "name": "act_dyn_q",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "act_dyn_r": {
-      "__class__": "ParamTocElement",
-      "ident": 203,
-      "group": "ctrlINDI",
-      "name": "act_dyn_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff": {
-      "__class__": "ParamTocElement",
-      "ident": 204,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "filt_cutoff_r": {
-      "__class__": "ParamTocElement",
-      "ident": 205,
-      "group": "ctrlINDI",
-      "name": "filt_cutoff_r",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "outerLoopActive": {
-      "__class__": "ParamTocElement",
-      "ident": 206,
-      "group": "ctrlINDI",
-      "name": "outerLoopActive",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "ctrlMel": {
-    "kp_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 207,
-      "group": "ctrlMel",
-      "name": "kp_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 208,
-      "group": "ctrlMel",
-      "name": "kd_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 209,
-      "group": "ctrlMel",
-      "name": "ki_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 210,
-      "group": "ctrlMel",
-      "name": "i_range_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kp_z": {
-      "__class__": "ParamTocElement",
-      "ident": 211,
-      "group": "ctrlMel",
-      "name": "kp_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_z": {
-      "__class__": "ParamTocElement",
-      "ident": 212,
-      "group": "ctrlMel",
-      "name": "kd_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_z": {
-      "__class__": "ParamTocElement",
-      "ident": 213,
-      "group": "ctrlMel",
-      "name": "ki_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_z": {
-      "__class__": "ParamTocElement",
-      "ident": 214,
-      "group": "ctrlMel",
-      "name": "i_range_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "mass": {
-      "__class__": "ParamTocElement",
-      "ident": 215,
-      "group": "ctrlMel",
-      "name": "mass",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "massThrust": {
-      "__class__": "ParamTocElement",
-      "ident": 216,
-      "group": "ctrlMel",
-      "name": "massThrust",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 217,
-      "group": "ctrlMel",
-      "name": "kR_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kR_z": {
-      "__class__": "ParamTocElement",
-      "ident": 218,
-      "group": "ctrlMel",
-      "name": "kR_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 219,
-      "group": "ctrlMel",
-      "name": "kw_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kw_z": {
-      "__class__": "ParamTocElement",
-      "ident": 220,
-      "group": "ctrlMel",
-      "name": "kw_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 221,
-      "group": "ctrlMel",
-      "name": "ki_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "ki_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 222,
-      "group": "ctrlMel",
-      "name": "ki_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "kd_omega_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 223,
-      "group": "ctrlMel",
-      "name": "kd_omega_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 224,
-      "group": "ctrlMel",
-      "name": "i_range_m_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "i_range_m_z": {
-      "__class__": "ParamTocElement",
-      "ident": 225,
-      "group": "ctrlMel",
-      "name": "i_range_m_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "ctrlAtt": {
-    "tau_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 226,
-      "group": "ctrlAtt",
-      "name": "tau_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_xy": {
-      "__class__": "ParamTocElement",
-      "ident": 227,
-      "group": "ctrlAtt",
-      "name": "zeta_xy",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_z": {
-      "__class__": "ParamTocElement",
-      "ident": 228,
-      "group": "ctrlAtt",
-      "name": "tau_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "zeta_z": {
-      "__class__": "ParamTocElement",
-      "ident": 229,
-      "group": "ctrlAtt",
-      "name": "zeta_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "tau_rp": {
-      "__class__": "ParamTocElement",
-      "ident": 230,
-      "group": "ctrlAtt",
-      "name": "tau_rp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "mixing_factor": {
-      "__class__": "ParamTocElement",
-      "ident": 231,
-      "group": "ctrlAtt",
-      "name": "mixing_factor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "coll_fairness": {
-      "__class__": "ParamTocElement",
-      "ident": 232,
-      "group": "ctrlAtt",
-      "name": "coll_fairness",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "posCtrlIndi": {
-    "K_xi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 233,
-      "group": "posCtrlIndi",
-      "name": "K_xi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 234,
-      "group": "posCtrlIndi",
-      "name": "K_xi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_xi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 235,
-      "group": "posCtrlIndi",
-      "name": "K_xi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_x": {
-      "__class__": "ParamTocElement",
-      "ident": 236,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_x",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_y": {
-      "__class__": "ParamTocElement",
-      "ident": 237,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_y",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "K_dxi_z": {
-      "__class__": "ParamTocElement",
-      "ident": 238,
-      "group": "posCtrlIndi",
-      "name": "K_dxi_z",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    },
-    "pq_clamping": {
-      "__class__": "ParamTocElement",
-      "ident": 239,
-      "group": "posCtrlIndi",
-      "name": "pq_clamping",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": false
-    }
-  },
-  "velCtlPid": {
-    "vxKp": {
-      "__class__": "ParamTocElement",
-      "ident": 240,
-      "group": "velCtlPid",
-      "name": "vxKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKi": {
-      "__class__": "ParamTocElement",
-      "ident": 241,
-      "group": "velCtlPid",
-      "name": "vxKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKd": {
-      "__class__": "ParamTocElement",
-      "ident": 242,
-      "group": "velCtlPid",
-      "name": "vxKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vxKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 243,
-      "group": "velCtlPid",
-      "name": "vxKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKp": {
-      "__class__": "ParamTocElement",
-      "ident": 244,
-      "group": "velCtlPid",
-      "name": "vyKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKi": {
-      "__class__": "ParamTocElement",
-      "ident": 245,
-      "group": "velCtlPid",
-      "name": "vyKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKd": {
-      "__class__": "ParamTocElement",
-      "ident": 246,
-      "group": "velCtlPid",
-      "name": "vyKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vyKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 247,
-      "group": "velCtlPid",
-      "name": "vyKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKp": {
-      "__class__": "ParamTocElement",
-      "ident": 248,
-      "group": "velCtlPid",
-      "name": "vzKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKi": {
-      "__class__": "ParamTocElement",
-      "ident": 249,
-      "group": "velCtlPid",
-      "name": "vzKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKd": {
-      "__class__": "ParamTocElement",
-      "ident": 250,
-      "group": "velCtlPid",
-      "name": "vzKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vzKFF": {
-      "__class__": "ParamTocElement",
-      "ident": 251,
-      "group": "velCtlPid",
-      "name": "vzKFF",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "posCtlPid": {
-    "xKp": {
-      "__class__": "ParamTocElement",
-      "ident": 252,
-      "group": "posCtlPid",
-      "name": "xKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKi": {
-      "__class__": "ParamTocElement",
-      "ident": 253,
-      "group": "posCtlPid",
-      "name": "xKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKd": {
-      "__class__": "ParamTocElement",
-      "ident": 254,
-      "group": "posCtlPid",
-      "name": "xKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xKff": {
-      "__class__": "ParamTocElement",
-      "ident": 255,
-      "group": "posCtlPid",
-      "name": "xKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKp": {
-      "__class__": "ParamTocElement",
-      "ident": 256,
-      "group": "posCtlPid",
-      "name": "yKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKi": {
-      "__class__": "ParamTocElement",
-      "ident": 257,
-      "group": "posCtlPid",
-      "name": "yKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKd": {
-      "__class__": "ParamTocElement",
-      "ident": 258,
-      "group": "posCtlPid",
-      "name": "yKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yKff": {
-      "__class__": "ParamTocElement",
-      "ident": 259,
-      "group": "posCtlPid",
-      "name": "yKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKp": {
-      "__class__": "ParamTocElement",
-      "ident": 260,
-      "group": "posCtlPid",
-      "name": "zKp",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKi": {
-      "__class__": "ParamTocElement",
-      "ident": 261,
-      "group": "posCtlPid",
-      "name": "zKi",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKd": {
-      "__class__": "ParamTocElement",
-      "ident": 262,
-      "group": "posCtlPid",
-      "name": "zKd",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zKff": {
-      "__class__": "ParamTocElement",
-      "ident": 263,
-      "group": "posCtlPid",
-      "name": "zKff",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "thrustBase": {
-      "__class__": "ParamTocElement",
-      "ident": 264,
-      "group": "posCtlPid",
-      "name": "thrustBase",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "thrustMin": {
-      "__class__": "ParamTocElement",
-      "ident": 265,
-      "group": "posCtlPid",
-      "name": "thrustMin",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 0,
-      "extended": true
-    },
-    "rLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 266,
-      "group": "posCtlPid",
-      "name": "rLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "pLimit": {
-      "__class__": "ParamTocElement",
-      "ident": 267,
-      "group": "posCtlPid",
-      "name": "pLimit",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "xVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 268,
-      "group": "posCtlPid",
-      "name": "xVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "yVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 269,
-      "group": "posCtlPid",
-      "name": "yVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "zVelMax": {
-      "__class__": "ParamTocElement",
-      "ident": 270,
-      "group": "posCtlPid",
-      "name": "zVelMax",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "posEstAlt": {
-    "estAlphaAsl": {
-      "__class__": "ParamTocElement",
-      "ident": 271,
-      "group": "posEstAlt",
-      "name": "estAlphaAsl",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "estAlphaZr": {
-      "__class__": "ParamTocElement",
-      "ident": 272,
-      "group": "posEstAlt",
-      "name": "estAlphaZr",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velFactor": {
-      "__class__": "ParamTocElement",
-      "ident": 273,
-      "group": "posEstAlt",
-      "name": "velFactor",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "velZAlpha": {
-      "__class__": "ParamTocElement",
-      "ident": 274,
-      "group": "posEstAlt",
-      "name": "velZAlpha",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    },
-    "vAccDeadband": {
-      "__class__": "ParamTocElement",
-      "ident": 275,
-      "group": "posEstAlt",
-      "name": "vAccDeadband",
-      "ctype": "float",
-      "pytype": "<f",
-      "access": 0,
-      "extended": true
-    }
-  },
-  "firmware": {
-    "revision0": {
-      "__class__": "ParamTocElement",
-      "ident": 276,
-      "group": "firmware",
-      "name": "revision0",
-      "ctype": "uint32_t",
-      "pytype": "<L",
-      "access": 1,
-      "extended": false
-    },
-    "revision1": {
-      "__class__": "ParamTocElement",
-      "ident": 277,
-      "group": "firmware",
-      "name": "revision1",
-      "ctype": "uint16_t",
-      "pytype": "<H",
-      "access": 1,
-      "extended": false
-    },
-    "modified": {
-      "__class__": "ParamTocElement",
-      "ident": 278,
-      "group": "firmware",
-      "name": "modified",
-      "ctype": "uint8_t",
-      "pytype": "<B",
-      "access": 1,
-      "extended": false
-    }
-  }
-}
\ No newline at end of file
