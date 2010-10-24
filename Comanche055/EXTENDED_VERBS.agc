# Copyright:	Public domain.
# Filename:	EXTENDED_VERBS.agc
# Purpose:	Part of the source code for Comanche, build 055. It
#		is part of the source code for the Command Module's
#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
# Assembler:	yaYUL
# Reference:	pp. 236-267
# Contact:	Ron Burkey <info@sandroid.org>,
#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
# Website:	http://www.ibiblio.org/apollo.
# Mod history:	2009-05-18 FB	Transcription Batch 3 Assignment.
#		2009-05-20 RSB	Corrections:  POODOO -> P00DOO,
#				GOTOPOOH -> GOTOP00H, added a couple of 
#				missing instructions in Verb 96.
#		2009-05-23 RSB	In SYSTEST, corrected TC FLAGWRD1 to 
#				CA FLAGWRD1.  Added a variety of SBANK=
#				statements prior to 2CADRs.  One day I'll
#				have to figure out what yaYUL is doing 
#				wrong with those ....
#		2010-08-29 JL	Fixed +3 and +8 pseudo-labels which were accidentally symbols.
#
# The contents of the "Comanche055" files, in general, are transcribed 
# from scanned documents. 
#
#	Assemble revision 055 of AGC program Comanche by NASA
#	2021113-051.  April 1, 1969.  
#
#	This AGC program shall also be referred to as Colossus 2A
#
#	Prepared by
#			Massachusetts Institute of Technology
#			75 Cambridge Parkway
#			Cambridge, Massachusetts
#
#	under NASA contract NAS 9-4065.
#
# Refer directly to the online document mentioned above for further
# information.  Please report any errors to info@sandroid.org.

# Page 236
		BANK	7
		SETLOC	EXTVERBS
		BANK
		
		EBANK=	OGC
		
		COUNT*	$$/EXTVB
		
# FAN-OUT

GOEXTVB		INDEX	MPAC		# VERB-40 IS IN MPAC
		TC	LST2FAN		# FAN AS BEFROE.
		
LST2FAN		TC	VBZERO		# VB40 ZERO (USED WITH NOUN 20 ONLY)
		TC	VBCOARK		# VB41 COARSE ALIGN (USED WITH NOUN 20 OR
					#				91 ONLY)
		TC	IMUFINEK	# VB42 FINE ALIGN IMU
		TC	IMUATTCK	# VB43 LOAD IMU ATTITUDE ERROR METERS.
		TC	SETSURF		# VB44 SET SURFACE FLAG
		TC	RESTSRF		# VB45 RESET SURFACE FLAG
		TC	STABLISH	# VB46 ESTABLISH G+C CONTROL
		TC	LMTOCMSV	# VB47 MOVE LM STATE VECTOR INTO CM
		TC	DAPDISP		# VB48 LOAD A/P DATA
		TCF	CREWMANU	# VB49 START AUTOMATIC ATTITUDE MANEUVER
		TC	GOLOADLV	# VB50 PLEASE PERFORM
		TC	GOLOADLV	# VB51 PLEASE MARK
		TC	V52		# VB52 SET OFFSET NO. FOR P22
		TC	GOLOADLV	# VB53 PLEASE PERFORM COAS MARK
		TC	GOTOR23		# VB54 PLEASE MARK (R-21 BACKUP)
		TC	ALINTIME	# VB55 ALIGN TIME
		TC	TRACKTRM	# VB56 TERMINATE TRACKING (P20 + P25)
		TC	GOTOR21		# VB57 START R21 REND TRACK SIGHT MARK ROUT
		TC	ENATMA		# VB58 ENABLE AUTOMATIC ATTITUDE MANEUVER
		TC	GOLOADLV	# VB59 PLEASE CALIBRATE
		TC	V60		# VB60 SET CPHIX (N17) EQUAL TO CDU
		TC	V61		# VB61 SELECT MODE I
		TC	V62		# VB62 SELECT MODE II, ERROR WRT N22
		TC	V63		# VB63 SELECT MODE III, ERROR WRT N17
		TC	VB64		# VB64 CALCULATE, DISPLAY S-BAND ANT ANGLES
		TC	CKOPTVB		# V 65 E OPTICAL VERIFICATION FOR PRELAUNC
		TC	ATTACHED	# VB66 ATTACHED. MOVE THIS TO OTHER STATE
		TC	V67		# VB67 W MATRIX MONITOR
		TC	STROKON		# VB68 CSM STROKE TEST ON.
VERB69		TC	VERB69		# VB69 CAUSE RESTART
		TC	V70UPDAT	# VB70 UPDATE LIFTOFF TIME.
		TC	V71UPDAT	# VB71 UNIVERSAL UPDATE -- BLOCK ADDRESS
		TC	V72UPDAT	# VB72 UNIVERSAL UPDATE -- SINGLE ADDRESS
		TC	V73UPDAT	# VB73 UPDATE AGC TIME (OCTAL)
		TC	DNEDUMP		# VB74 INITIALIZE DOWN-TELEMETRY PROGRAM
					#	FOR ERASABLE DUMP.
		TC	LFTFLGON	# VB75 SET LIFTOFF FLAG.
# Page 237
		TC	SETPRFLG	# VB76 SET PREFERRED ATTITUDE FLAG
		TC	RESETPRF	# VB77 RESET PREFERRED ATT. FLAG
		TC	CHAZFOGC	# CHANGE GYROCOMPASS LAUNCH AZIMUTH V78
		TC	ALM/END		# V79 SPARE
		TC	LEMVEC		# VB80 UPDATE LEM STATE VECTOR
		TC	CSMVEC		# VB81 UPDATE CSM STATE VECTOR
		TC	V82PERF		# VB82 REQUEST ORBIT PARAM DISPLAY (R30)
		TC	V83PERF		# VB83 RANGE, RANGE RATE, +X AXIS  (R31)
		TC	ALM/END		# V84  SPARE
		TC	V85PERF		# VB85 RANGE, RANGE RATE, SLOS	   (R32)
		TC	V86PERF		# VB86 BACKUP MARK REJECT
		TC	SETVHFLG	# VB87 SET VHF RANGE FLAG
		TC	RESETVHF	# VB88 RESET VHF RANGE FLAG
		TC	V89PERF		# V89-ALIGN X OR PRF CSM AXIS TO LOS (R63)
		TC	V90PERF		# VB90-OUT OF PLAN PARAMETERS 	   (R36)
		TC	GOSHOSUM	# VB91 TEMP FOR HYBRID AND STG.
		TC	SYSTEST		# VB92 OPERATE IMU PERFORMANCE TEST
		TC	WMATRXNG	# VB93 CLEAR RENDWFLG
		TC	VERB94		# VB94 DO R64
		TC	ALM/END		# VB95 SPARE
		TCF	VERB96		# VB96 SET QUITFLAG TO STOP INTEGRATION
		TC	GOLOADLV	# VB97 PLEASE PERFORM ENGINE-FAIL (R41)
		TC	ALM/END		# VB98 SPARE
		TC	GOLOADLV	# VB99 PLEASE ENABLE ENGINE
		
# END OF EXTENDED VERB FAN

TESTXACT	CCS	EXTVBACT
		TC	ALM/END		# YES, TURN ON OPERATOR ERROR LIGHT
		CA	FLAGWRD4	# ARE PRIOS USING DSKY
		MASK	OC24100
		CCS	A
		TC	ALM/END		
		
		CAF	OCT24		# SET BITS 3 AND 5
SETXTACT	TS	EXTVBACT	# NO. SET FLAG TO SHOW EXT VERB DISPLAY
					# SYSTEM BUSY
					
		CA	Q
		TS	MPAC +1
		
		CS	TWO		# BLANK EVERYTHING EXCEPT MM AND VERB
		TC	NVSUB
		TC	+1
		TC	MPAC +1
		
XACTALM		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT.
		TC	ENDEXT		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
# Page 238
TERMEXTV 	EQUALS 	ENDEXT
ENDEXTVB	EQUALS	ENDEXT

XACT0		CAF	ZERO		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
		TC	SETXTACT

ALM/END		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT
GOPIN		TC	POSTJUMP
		CADR	PINBRNCH
		
OC24100		OCT	24100

# Page 239
# VBZERO	VERB 40		DESCRIPTION
#
#	1. 	REQUIRE NOUN 20 (ICDU ANGLES) 
#	2.	REQUIRE AVAILABILITY OF EXT VERB DISPLAY SYSTEM
#	3.	IF EITHER OF ABOVE CONDITIONS NOT PRESENT, TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
#	4.	SET EXT VERB DISPLAY ACTIVE FLAG.
#	5.	EXECUTE IMUZERO (ZERO IMU CDU ANGLES).
#	6.	EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
#	7.	RELEASE EXT. VERB DISPLAY SYSTEM.

VBZERO		TC	OP/INERT
		TC	IMUZEROK	# RETURN HERE IF NOUN = ICDU(20)
		TC	ALM/END		# RETURN HERE IF NOUN = OCDU(91)
					#	(NOT IN USE YET)
					
IMUZEROK	TC	CKMODCAD	# KEYBOARD REQUEST FOR ISS CDUZERO
		TC	BANKCALL
		CADR	IMUZERO
		
		TC	BANKCALL	# STALL
		CADR	IMUSTALL
		TC	+1
		
		TC	GOPIN		
		
OP/INERT	CS	OCT24
		AD	NOUNREG
		EXTEND
		BZF	XACT0Q		# IF = 20.
		
		INCR	Q
		AD	OPIMDIFF	# -71
		EXTEND
		BZF	XACT0Q
		
		TC	ALM/END		# ILLEGAL.
		
OPIMDIFF	DEC	-71

# Page 240
# VBCOARK	VERB 41		DESCRIPTION
#	COARSE ALIGN IMU OR RADAR
#
#	1.	REQUIRE NOUN 20 OR NOUN 91 OR TURN ON OPERATOR ERROR.
#	2.	REQUIRE EXT VERB DISPLAY SYS AVAILABLE OR TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
#
#	CASE 1	NOUN 20	(ICDU ANGLES)
#	3.	SET EXT VERB DISPLAY ACTIVE FLAG.
#	4.	DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
#		RESPONSES
#		A.	TERMINATE
#			1.	RELEASE EXT VERB DISPLAY SYSTEM.
#		B.	PROCEED
#			1.	DISPLAY FLASHING V25,N23 (LOAD DELTA ICDU ANGLES).
#				RESPONSES:
#				A.	TERMINATE
#					1.	RELEASE EXT VERB DISPLAY SYSTEM.
#				B.	PROCEED
#					1.	EXECUTE ICORK2.
#				C.	ENTER
#					1.	INCREMENT CDU ANGLES
#					2.	EXECUTE ICORK2
#		C.	ENTER
#			1.	EXECUTE ICORK2
# ICORK2
#	1.	RE-DISPLAY VERB 41.
#	2.	EXECUTE IMUCCARS (IMU COARSE ALIGN).
#	3.	EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
#	4.	RELEASE EXT VERB DISPLAY SYSTEM.
#
#	CASE 2	NOUN 91	(OCDU ANGLES)
#	5.	(REQUIRE OPTICS SWITCH TO BE AT COMUTER OR TURN ON OPERATOR ERROR AND ALARM 115) AND (REQUIRE
#		OPTICS AVAILABLE AND DISPLAY FLASHING V24,N92....LOAD NEW OPTICS ANGLES....OR TURN ON ALARM 117
#		AND RELEASE EXT VERB DISPLAY SYSTEM).
#	6.	RESPONSES TO V29,N92
#		A.	TERMINATE
#			RELEASE EXT VERB DISPLAY SYS.
#		B.	PROCEED OR ENTER
#			RE-DISPLAY VERB 41,	SET SWITCH TO INDICATE COURSE ALIGN OPTICS WORKING.
#			RELEASE EXT VERB DISPLAY SYSTEM.

VBCOARK		TC	OP/INERT
		TC	IMUCOARK		# RETURN HERE IF NOUN = ICDU (20)
		TC	OPTCOARK		# RETURN HERE IF NOUN = OCDU (91)
		
# RETURNS TO L+1 IF NOUN 20 -- TO L+2 IF NOUN 91.

IMUCOARK	TC	CKMODCAD		# COARSE ALIGN FROM KEYBOARD
		TC	TESTXACT	
		CAF	VNLODCDU		# CALL FOR THETAD LOAD
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TCF	+1
# Page 241
		
ICORK2		CAF	IMUCOARV		# RE-DISPLAY COARSE ALIGN VERB.
		TC	BANKCALL
		CADR	EXDSPRET
		
		TC	BANKCALL		# CALL MODE SWITCHING PROG
		CADR	IMUCOARS
		
		TC	BANKCALL		# STALL
		CADR	IMUSTALL
		TC	ENDEXTVB
		TC	ENDEXTVB
		
VNLODCDU	VN	2522
IMUCOARV	VN	4100

# Page 242
# TEMPORARY ROUTINE TO RUN THE OPTICS CDUS FROM THE KEYBOARD

OPTCOARK	CA	OPTCADR
		TC	CKMODCAD +1
		TC	TESTXACT
		CAF	EBANK5
		TS	EBANK
		
		CCS	SWSAMPLE		# SEE IF SWITCH AT COMPUTER
		TC	+5			# SWITCH AT COMPUTER
		TC	+1			# NOT ON COMPUTER
		TC	FALTON			# TURN ON OPERATOR ERR
		TC	ALARM			# AND ALARM
		OCT	00115
		
		CCS	OPTIND			# SEE IF OPTICS AVAILABLE
		TC	OPTC1			# IN USE
		TC	OPTC1			# IN USE
		TC	OPTC1			# IN USE
		
		TC	ALARM			# OPTICS RESERVED (OPTIND=-0)
		OCT	00117
		TC	ENDEXT
		
OPTC1		CAF	VNLD0CDU		# VERB-NOUN TO LOAD OPTICS CDUS
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TC	+1			# PROCEED
		
		CA	SAC
		TS	DESOPTS
		CA	PAC
		TS	DESOPTT
		CAF	OPTCOARV		# RE-DISPLAY OUR OWN VERB
		TC	BANKCALL
		CADR	EXDSPRET
		
		CAF	ONE
		TS	OPTIND			# SET COARS WORKING
		
		TC	ENDEXTVB
		TC	ENDEXTVB
		
VNLD0CDU	VN	2492
OPTCOARV	EQUALS	IMUCOARV		# DIFFERENT NOUNS.

# Page 243
# IMUFINEK	VERB 42		DESCRIPTION
#	FINE ALIGN IMU
#
#	1.	REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG OR TURN ON OPER ERROR AND GO TO PINBRNCH.
#	2.	DISPLAY FLASHING V25,N93....LOAD DELTA GYRO ANGLES....
#		RESPONSES
#		A.	TERMINATE
#			1.	RELEASE EXT VERB DISPLAY SYSTEM.
#		B.	PROCEED OR ENTER
#			1.	RE-DISPLAY VERB 42
#			2.	EXECUTE IMUFINE (IMU FIVE ALIGN MODE SWITCHING).
#			3.	EXECUTE IMUSTALL (ALLOW FOR DATA TRANSFER)
#				A.	FAILED
#					1. 	RELEASE EXT VERB DISPLAY SYSTEM.
#				B.	GOOD
#					1.	EXECUTE IMUPULSE (TORQUE IRIGS).
#					2.	EXECUTE IMUSTALL AND RELEASE EXT VERB DISPLAY SYSTEM.

IMUFINEK	TC	CKMODCAD		# FINE ALIGN WITH GYRO TORQUING.
		TC	TESTXACT
		CAF	VNLODGYR		# CALL FOR LOAD OF GYRO COMMANDS
		TC	BANKCALL
		CADR	GOXDSPF
		TC	TERMEXTV
		TC	+1			# PROCEED WITHOUT A LOAD
		
		CAF	IMUFINEV		# RE-DISPLAY OUR OWN VERB
		TC	BANKCALL
		CADR	EXDSPRET
		
		TC	BANKCALL		# CALL MODE SWITCH PROG
		CADR	IMUFINE
		
		TC	BANKCALL		# HIBERNATION
		CADR	IMUSTALL
		TC	ENDEXTVB
		
FINEK2		CAF	LGYROBIN		# PINBALL LEFT COMMANDS IN OGC REGISTERS
		TC	BANKCALL
		CADR	IMUPULSE
		
		TC	BANKCALL		# WAIT FOR PULSES TO GET OUT.
		CADR	IMUSTALL
		TC	ENDEXTVB
		TC	ENDEXTVB
		
LGYROBIN	ECADR	OGC
VNLODGYR	VN	2593
IMUFINEV	VN	4200			# FINE ALIGN VERB

CKMODCAD	CA	MODECADR
# Page 244
		EXTEND
		BZF	TCQ
		TC	ALM/END			# SOMEBODY IS USING MODECADR SO EXIT

# GOLOADLV	VERB 50		DESCRIPTION
#	AND OTHER PLEASE
#	DO SOMETHING VERBS
#
# PLEASE PERFORM, MARK, CALIBRATE, ETC.
#
#	1.	PRESSING ENTER ON DSKY INDICATES REQUESTED ACTION HAS BEEN PERFORMED, AND THE PROGRAM DOES THE
#		SAME RECALL AS A COMPLETED LOAD.
#	2.	THE EXECUTION OF A VERB 33 (PROCEED WITHOUT DATA) INDICATES THE REQUESTED ACTION IS NOT DESIRED.

GOLOADLV	TC	FLASHOFF
		CAF	PINSUPBT
		EXTEND
		WRITE	SUPERBNK	# TURN ON FE7
		TC	POSTJUMP
		SBANK=	PINSUPER
		CADR	LOADLV1

# V60	VERB 60
V60		EXTEND			# SET ASTRONAUT TOTAL ATTITUDE (N17) EQUAL
		DCA	CDUX		# TO PRESENT ATTITUDE
		DXCH	CPHIX
		CA	CDUZ
		TS	CPHIX	+2
		TC	GOPIN
		
# V61	VERB 61
V61		TC	DOWNFLAG	# SET NEEDLFLG TO 0 (FLAGWRD0,BIT9), PHASE
		ADRES	NEEDLFLG	# PLANE A/P FOLLOWING ERROR DISPLAYED
		TC	GOPIN
		
# V62	VERB 62
V62		TC	UPFLAG		# SET NEEDLFLG TO 1 (FLAGWRD0,BIT9),
		ADRES	NEEDLFLG	# TOTAL ATTITUDE ERROR DISPLAYED
		
		TC	UPFLAG		# SET N22ORN17 TO 1 (FLAGWRD9,BIT6),
		ADRES	N22ORN17	# COMPUTE TOTAL ATTITUDE ERROR WRT N22
		TC	GOPIN
		
# V63	VERB 63
V63		TC	UPFLAG		# SET NEEDLFLG TO 1 (FLAGWRD0,BIT9),
		ADRES	NEEDLFLG	# TOTAL ATTITUDE ERROR DISPLAYED
		
		TC	DOWNFLAG	# SET N22ORN17 TO 0 (FLAGWRD9,BIT6),
# Page 245
		ADRES	N22ORN17	# COMPUTE TOAL ASTRONAUT ATTITUDE ERROR
		TC	GOPIN
		
# Page 246					
# ALINTIME	VERB 55		DESCRIPTION
#
#	1.	SET EXT VERB DISPLAY BUSY FLAG.
#	2.	DISPLAY FLASHING V25,N24 (LOAD DELTA TIME FOR AGC CLOCK.
#	3.	REQUIRE EXECUTION OF VERB 23.
#	4.	ADD DELTA TIME, RECEIVED FROM INPUT REGISTER, TO THE COMPUTER TIME.
#	5.	RELEASE EXT VERB DISPLAY SYSTEM.

		COUNT	04/R33

ALINTIME	TC	TESTXACT

		CAF	VNLODDT
		TC	BANKCALL
		CADR	GOMARKF
		TC	ENDEXT		# TERMINATE
		TC	ENDEXT		# PROCEED
		CS	DEC23		# DATA IN OR RESEQUENCE (UNLIKELY)
		AD	MPAC		# RECALL LEFT VERB IN MPAC
		EXTEND
		BZF	UPDATIME	# GO AHEAD WITH UPDATE ONLY IF RECALL
		TC	ENDEXT		#	WITH V23 (DATA IN).
		
UPDATIME	INHINT			# DELTA TIME IS IN DSPTEM1, +1.
		CAF	ZERO
		TS	MPAC +2		# NEEDED FOR TP AGREE
		TS	L		# ZERO T1 + 2 WHILE ALIGNING.
		DXCH	TIME2
		DXCH	MPAC
		DXCH	DSPTEM2 +1	# INCREMENT
		DAS	MPAC
		
		TC	TPAGREE		# FORCE SIGN AGREEMENT.
		DXCH	MPAC		# NEW CLOCK.
		DAS	TIME2
		RELINT
UPDTMEND	TC	ENDEXT
DEC23		DEC	23		# V 23

VNLODDT		VN	2524		# V25N24 FOR LOAD DELTA TIME

# Page 247
# SYSTEST	VERB 92		DESCRIPTION
#	OPERATE SELECTED SYSTEM TEST.
#
#	1.	REQUIRE P00 OR P00- OR TURN ON OPERATOR ERROR.
#	2.	TURN OFF DAP IF IT IS ON.
#	3.	DISPLAY FLASHING V21,N01 (LOAD TEST NUMBER 1 THRU 17).
#	4.	UPON ENTRY OF TEST NUMBER, SCHEDULE TSELECT WITH PRIORITY 20.
#
# 	TSELECT
#	1.	IF LOADED TEST NUMBER IS VALID, GO TO THAT TEST ROUTINE, OTHERWISE TURN ON OPERATOR ERROR AND
#		REPEAT LOAD REQUEST DISPLAY.  (NO. 3 ABOVE)

		EBANK=	QPLACE
		
		COUNT	04/EXTVB
		
SYSTEST		TC	CHKP00H	
		CA	FLAGWRD1	# IS NODOP01 FLAGBIT ON? (SET BY P11)
		MASK	NOP01BIT
		EXTEND
		BZF	V92CONT		# IF IT'S NOT YET SET, CONTINUE
		TC	P00DOO		# IT'S ON. SEND NODO ALARM FOR P07
		OCT	1521
V92CONT		TC	EXDAPOFF	# TURN DAP OFF IF IT'S ON
		CAF	PRIO20
		TC	FINDVAC
		EBANK=	QPLACE
		SBANK=	IMUSUPER
		2CADR	REDO
		
		TC	GOPIN

# REDO AND TSELECT ARE NOW IN SYSTEM TEST.		
		
		COUNT*	$$/EXTVB	
# CKOPTVB	VERB 65		DESCRIPTION
#	OPTICAL VERIFICATION FOR PRELAUNCH.
#	1.	SCHEDULE GCOMPVER, OPTICAL VERIFICATION SUBPROGRAM, WITH PRIORITY 17.

CKOPTVB		TC	CHECKMM
		MM	02		# I WONDER IF PRELAUNCH IS RUNNING
		TC	ALM/END		# NOT RUNNING OPERATOR ERROR
		INHINT
		CAF	PRIO16		# PRELAUNCH OPTICAL VERIFICATION
		TC	FINDVAC
		EBANK=	QPLACE
		2CADR	COMPVER		# STANDARD LEADIN TO GCOMPVER.
		
		TC	GOPIN
		
# Page 248
# V 78 ....	TO CHANGE GYROCOMPASS AZIMUTH

CHAZFOGC	TC	CHECKMM		# IS IT PRELAUNCH
		MM	02
		TC	ALM/END		# NO -- OPERATOR ERROR

		CAF	PRIO16		# PRELAUNCH AZIMUTH CHANGE
		TC	FINDVAC
		EBANK=	XSM
		2CADR	AZMTHCG1
		
		TC	PHASCHNG
		OCT	00174
		TC	GOPIN
# Page 249
# IMUATTCK	VERB 43		DESCRIPTION
#	LOAD IMU ATTITUDE ERROR METERS
#
#	1.	REQUIRE PROGRAM 00 ACTIVE, COARSE ALIGN ENABLE BIT OFF AND ZERO ICDU BIT OFF.
#	2.	IF GUID REF RELEASE OR LIFTOFF HAS OCCURRED REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY
#		FLAG, OTHERWISE ALLOW CURRENT EXT VERB DISPLAY TO BE OVER-RIDDEN.
#	3.	REMOVE COARSE ALIGN ENABLE AND IMU ERROR COUNTER ENABLE.
#	4.	DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
#	5.	UPON PROCEED OR ENTER RESPONSE, INITIALIZE CURRENT DAC AND COMMAND VALUES, ENABLE ERROR COUNTERS
#		TRANSFER LOADED VALUES TO REGISTERS, AND SEND COMMANDS.
#	6.	IF BUSY FLAG SET, RESET IT TO RELEASE EXT VERB DISPLAY.

IMUATTCK	TC	CHKP00H		

		CAF	OCTAL30		# SEE IF IMU ZERO AND IMU COARSE ARE ON
		EXTEND		
		RAND	CHAN12
		CCS	A
		TCF	ALM/END		# NOT ALLOWED IF IMU COARSE OR IMU ZERO ON
		
		TC	CKLFTBTS	# IS IT BEFORE OR AFTER LIFTOFF
		TC	TESTXACT	# AFTER
		CS	OCT50		# REMOVE COARSE AND ECTR ENABLE
		EXTEND	
		WAND	CHAN12
		
		CAF	VNLODCDU
		TC	BANKCALL
		CADR	GOXDSPF
		TCF	TRMATTCK
		TC	+1
		CAF	EBANK6
		TS	EBANK		# SET E6 FOR NEEDLES.
		
		EBANK=	AK
		
		TC	BANKCALL	# INITIALIZE CURRENT DAC AND
		CADR	NEEDLE11	# COMMAND VALUES.
		
		TC	BANKCALL	# ENABLE ERROR COUNTERS.
		CADR	NEEDLER2
		
		CAF	TWO		# 4 MS MIN.
		TC	WAITLIST
		EBANK=	AK
		2CADR	ATTCK1
		
TRMATTCK	TC	CKLFTBTS	# IS IT BEFORE OR AFTER LIFTOFF
		TCF	ENDEXT		# AFTER
		TC	GOPIN
# Page 250
ATTCK1		EXTEND			# TRANSFER LOADED VALUES TO DESIRED REQS.
		DCA	THETAD
		DXCH	AK
		CAE	THETAD	+2
		TS	AK	+2
		
		TC	IBNKCALL	# SENDS COMMANDS LIMITED TO +,- 384 PULSES
		CADR	NEEDLES		# AND LEAVES ERROR COUNTERS ENABLED.
		
		TC	TASKOVER
		
CKLFTBTS	CAF	GRRBKBIT	# HAS LIFTOFF OCCURRED
		MASK	FLAGWRD5
		CCS	A
		TC	Q		# YES
		CAF	BIT5
		EXTEND
		RAND	CHAN30
		CCS	A
		TCF	Q+1
XACT0Q		TC	Q		# YES

OCTAL30		OCT	30
VB64		TC	CHKP00H		# DEMAND PROGRAM 00.
		TC	TESTXACT	# IF DISPLAY SYS. NOT BUSY, MAKE IT BUSY.
		INHINT
		CAF	PRIO4
		TC	FINDVAC
		EBANK=	RHOSB
		2CADR	SBANDANT	# CALC.,DISPLAY S-BAND ANTENNA ANGLES.
		
		TC	ENDOFJOB
		
# ENATMA	VERB 58		DESCRIPTION
#	ENABLE AUTOMATIC ATTITUDE MANEUVER
#
# VERB58 RESETS STIKFLAG TO ENABLE R61 TO PERFORM AUTOMATIC TRACKING MANEUVERS, AFTER INTERRUPTS BY THE RHC 
# ACTIVITY.

ENATMA		TC	DOWNFLAG	# RESET STIKFLAG.
		ADRES	STIKFLAG	# BIT 14 FLAG 1
		TC	GOPIN
		
# Page 251
# STROKON	VERB 68		DESCRIPTION
#	STROKE TEST SETUP/ENABLE
#	1.	SET EXT VERB DISPLAY BUSY FLAG
#	2.	SCHEDULE STRKTST1 WITH PRIORITY 30.
#	3.	RELEASE EXT VERB DISPLAY.

		EBANK=	T5TVCDT
STROKON		CS	FLAGWRD6	# V68	PERMITTED ONLY DURING TVC
		MASK	OCT60000
		EXTEND
		BZMF	ALM/END		# NOT TVC....FLASH OP ERROR LIGHT
		CAF	PRIO30		# JOB REQUEST, TO SET UP STROKE TEST,
		TC	NOVAC		#	INCLUDING INITIALIZATIONS
		SBANK=	PINSUPER	# Added RSB 2009.
		EBANK=	STROKER
		2CADR	STRKTSTI
		
		TC	GOPIN
		
# STABLISH	VERB 46		DESCRIPTION
#	ESTABLISH G AND N AUTOPILOT CONTROL
#	1.	SETS UP EITHER RCS, ENTRY, OR SATURN
#	2.	IF TVC IS ON, SETS UP CSM/LM SWITCH-OVER
#			FROM HIGH BW TO LOW BW


STABLISH	CAF	EBANK6		# V46 - SET EBANK TO E6
		TS	EBANK

		CS	FLAGWRD6	# TEST FOR TVC
		MASK	OCT60000	
		EXTEND
## 2010-08-30 (jiml): yaYUL expects either an octal or explicit decimal offset.
## Original source was 'BZMF +8'. Added 'D' to explicitly specify decimal offset.
		BZMF	+8D

		CAE	DAPDATR1	# TET FOR CSM/LM
		MASK	BIT14
		EXTEND
		BZMF	+3

		TC	POSTJUMP	# CSM/LM, SO PERFORM HB TO LB SWITCH-OVER
		CADR	PRESWTCH

 +3		TC	ALM/END

 +8		TC	POSTJUMP	# SET UP RCS, ENTRY, OR SATURN-STICK DAP
		CADR	DAPFIG
# Page 252
# CREMANU	VERB 49		DESCRIPTION
#	START AUTOMATIC ATTITUDE MANEUVER
#
#	1.	REQUIRE PROGRAM 00 ACTIVE.
#	2.	SET EXT VERB DISPLAY BUSY FLAG.
#	3.	SCHEDULE R62DISP WITH PRIORITY 10.
#	4.	RELEASE EXT VERB DISPLAY.
#
#	R62DISP
#	1.	DISPLAY FLASHING V06,N22 (DECIMAL DISPLAY NEW ICDU ANGLES).  UPON IMMEDIATE RETURN, SET-UP GROUP
#		4 FOR RESTART OF DISPLAY SEQUENCE.
#		RESPONSES
#		A.	TERMINATE
#			1.	GOTOP00H
#		B.	PROCEED
#			1.	SET 3AXISFLG TO INDICATE MANEUVER IS SPECIFIED BY 3 AXIS.
#			2.	EXECUTE R60CSM (ATTITUDE MANEUVER).
#			3.	ZERO GROUP 4 (END R62).
#		C.	ENTER
#			1.	REPEAT FLASHING V06,N22.

CREWMANU	TC	CHKP00H		# DEMAND P00
	
		TC	TESTXACT
		
		CAF	PRIO10
		TC	FINDVAC
		EBANK=	CPHI
		2CADR	R62DISP
		
		TC	ENDOFJOB
		
# Page 253
# DAPDISP	VERB 48		DESCRIPTION
#	LOAD AUTOPILOT DATA (ROUTINE R03)
#
#	0.	CHECKFAIL AND RETURN IF TVC.
#	1.	REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG.
#	2.	LOWER PRIORITY TO 10.
#	3.	DISPLAY FLASHING V04,N46 (DISPLAY AUTOPILOT CONFIGURATION).
#	4.	UPON PROCEED RESPONSE, EXECUTE S41.2.
#	5.	DISPLAY FLASHING V06,N47 (DISPLAY CSM WGT., LEM WGT.)
#	6.	UPON PROCEED RESPONSE EXECUTE S40.14.
#	7.	DISPLAY FLASHING V06,N48 (DISPLAY PITCH TRIM, YAW TRIM)
#	8.	UPON PROCEED RESPONSE, RELEASE EXTENDED VERB DISPLAY SYSTEM.

		COUNT*	$$/EXTVB
		
DAPDISP		CS	FLAGWRD6
		MASK	OCT60000
		EXTEND
		BZMF	+2		# TVC = 10, CS YIELDS 01, BZMF TO CONTINUE
		TC	ALM/END		# RETURN IF TVC
		
		TC	TESTXACT
		TC	BANKCALL
		CADR	DAPDISP1
		BANK	42
		SETLOC	EXTVBS
		BANK
		COUNT	24/R03
		
DAPDISP1	CAF	EBANK6
		TS	EBANK
		
		CAF	PRIO10
		TC	PRIOCHNG
		
DONOUN46	CAF	V04N46		#	R1		R2
		TC	BANKCALL	#	DAPDATR1	DAPDATR2
		CADR	GOXDSPF		# GOXDSP ROUTINES USED FOR EXTENDED VERBS.
		
		TC	ENDEXT		# EXT. VBS GO TO ENDEXT, NOT ENDOFJOB.
		TC	+2
		TC	DONOUN46
		
		CA	DAPDATR1
		MASK	BIT4
		CCS	A
		TCF	MAXIN
		TC	DOWNFLAG
		ADRES	MAXDBFLG
MAXOUT		TC	BANKCALL
		CADR	S41.2
		
DONOUN47	CAF	V06N47		#	R1		R2		R3
# Page 254
		TC	BANKCALL	#	CSM WGT.	LEM WGT.	BLANK
		CADR	GOXDSPF
		
		TC	ENDEXT
		TC	+2
		TC	DONOUN47
		CAE	DAPDATR1	# DO MASS PROPERTIES CALCULATION ONLY IF
		MASK	PRIO30		# CONFIG = 1(CSM), 2 (CSM/LM), 6(CSM/LMA)
		EXTEND
		BZF	DONOUN48	# SKIP IF 0,4
		COM
		MASK	PRIO30
		EXTEND
		BZF	DONOUN48	# SKIP IF 3,7
		INHINT
		TC	IBNKCALL
		CADR	MASSPROP	# UPDATE IXX, IAVG, IAVG/TLX
		
		RELINT
		TC	BANKCALL
		CADR	S40.14		# COMPUTE RCS DAP STUFF
		
DONOUN48	CAF	V0648		#	R1		R2		R3
		TC	BANKCALL	#	PTRIM		YTRIM		BLANK
		CADR	GOXDSPF
		
		TC	ENDEXT
		TC	ENDEXT
		TC	DONOUN48
		
MAXIN		TC	UPFLAG
		ADRES	MAXDBFLG
		TC	MAXOUT
		
V0648		VN	0648
V06N47		VN	0647
V04N46		VN	0446
		BANK	43
		SETLOC	EXTVERBS
		BANK
		
		COUNT*	$$/EXTVB

# V82PERF	VERB82		DESCRIPTION
#	REQUEST ORBIT PARAMETERS DISPLAY (R30)
#
#	1.	IF AVERAGE G IS OFF:
#			FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
#			 TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2=1).  ASTRONAUT
#			 CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ I.
#			SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
#			CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
# Page 255
#			 RPER (PERIGEE RADIUS), RAP0 (APOGEE RADIUS), HPER (PERIGEE
#			 HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HAPO (APOGEE
#			 HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO 
#			 INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
#			FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59M59S IF IT WAS
#			 NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
#			 ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
#			 DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
#			 ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
#
#	2.	IF AVERAGE G IS ON:
#			CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
#			 FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
#			 OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
#			FLASH MONITOR V16N44 (HAPO, HPER, TFF).
#			 IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
#			 RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
#
# ADDENDUM:	HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
#		ABOVE REMARKS.

V82PERF		TC	TESTXACT

		CAF	PRIO7	
		TC	PRIOCHNG
		TC	POSTJUMP
		CADR	V82CALL		# ***** V82CALL MUST NOT BE A FINDVAC JOB.
		
# VB83PERF	VERB 83		DESCRIPTION
#	REQUEST RENDEZVOUS PARAMETER DISPLAY (R31)
#
#	1.	SET EXT VERB DISPLAY BUSY FLAG.
#	2.	SCHEDULE V83CALL WITH PRIORITY 10.
#		A.	DISPLAY
#			R1	RANGE
#			R2	RANGE RATE
#			R3	THETA

V83PERF		TC	TESTXACT
		INHINT
		CS	FLAGWRD9	# SET R31 FLAG-BIT 4 FLAGWRD9
		MASK	R31FLBIT
		ADS	FLAGWRD9
		CAF	PRIO5
		TC	NOVAC
		SBANK=	LOWSUPER	# Added by RSB 2009
		EBANK=	SUBEXIT
		2CADR	R31CALL
		
		TC	ENDOFJOB

# Page 256
V85PERF		TC	TESTXACT
		INHINT
		CS	R31FLBIT	# RESET R31 FLAG TO INDICATE R34
		MASK	FLAGWRD9
		TS	FLAGWRD9
		TC	V83PERF	+5
# Page 257
#	GOTOR21		VERB 57
#	GOTOR23-	VERB 54		DESCRIPTION
# SET UP MARKING FOR R22 (REND TRACK DATA PROC)
# 1.	SET EXT VERB DISPLAY BUSY FLAG
# 2.	IF REND (P20 RUNNING) + TRACK (TRACKING ALLOWED) FLAGS ARE SET,
#	SCHEDULE R21 OR R23 WITH PRIORITY 16, OTHERWISE TURN ON ALARM 406
# 3.	RELEASE EXT VERB DISPLAY SYSTEM

GOTOR21		TC	DOWNFLAG	# CLEAR R23FLG
		ADRES	R23FLG		# BIT 9 FLAG 1
		TC	+3
GOTOR23		TC	UPFLAG		# SET R23FLG
		ADRES	R23FLG		# BIT 9 FLAG 1
		TC	TESTXACT
		CA	FLAGWRD0	# VB 57	UNACCEPTABLE UNLESS BOTH
		MASK	RNDVZBIT	#	RENDEZVOUS AND TRACK FLAGS ON
		EXTEND
		BZF	R22ALARM
		
		CA	FLAGWRD1
		MASK	TRACKBIT
		EXTEND
		BZF	R22ALARM
		
		CA	FLAGWRD1	# TEST R23FLG
		MASK	R23BIT
		EXTEND
		BZF	REGR21		# R21
		CAF	PRIO16
		TC	NOVAC
		EBANK=	MRKBUF1
		2CADR	R23CSM
		
		TC	ENDOFJOB
REGR21		CAF	PRIO16
		TC	NOVAC
		EBANK=	MRKBUF1
		2CADR	R21CSM
		
		TC	ENDOFJOB
R22ALARM	TC	ALARM		# VERB 57 WAS SELECTED AND NEITHER REND
		OCT	00406		#	NOR TRACK FLAG WERE ON.
		TC	ENDEXT
		
# Page 258
# VERB 86	DESCRIPTION
#	V86 IS TO R23 AS MARK REJECT IS TO R21
#	V86 IS THE MARK REJECT FOR R23 (THE BACKUP MARKING ROUTINE)

		EBANK=	MRKBUF1
V86PERF		CAF	EBANK7		# BACKUP MARK REJECT (R23)
		XCH	EBANK
		CA	NEGONE
		TS	MRKBUF1
		TC	GOPIN
		
# Page 259
# TRACKTRM	VERB 56		DESCRIPTION
#	TERMINATE TRACKING (P20)
#	1.	KNOCK DOWN RENDEZVOUS, TRACK, AND UPDATE FLAGS.
#	2.	REQUIRE P20 NOT RUNNING ALONE OR GO TO GOTOP00H (REQUEST PROGRAM 00).
#	3.	REQUIRE R22 RUNNING OR GO TO PINBRNCH.
#	4.	IF INTEGRATION RUNNING, STALL UNTIL IT IS COMPLETED, THEN ZERO GROUPS 2 AND 3 TO KILL R21 + R22
#	3.	KNOCK DOWN RENDEZFOUS, R22, R21, TRACK, UPDATE, AND TARG1 FLAGS.
#	4.	GO TO ENEMA (SOFTWARE RESTART).
#	REFERENCE
#		P20	RENDEZVOUS	NAVIGATION
#		R21	RENDEZVOUS	TRACKING SIGHTING MARK.
#		R22	RENDEZVOUS	TRACKING DATA PROCESSING.

TRACKTRM	CA	RNDVZBIT	# IS REND FLAG ON
		MASK	FLAGWRD0
		EXTEND
		BZF	GOPIN		# NO
		
		TC	DOWNFLAG
		ADRES	RNDVZFLG
		
		CA	TRACKBIT	# IS TRACK FLAG ON
		MASK	FLAGWRD1
		EXTEND
		BZF	GOPIN		# NO
		
		TC	DOWNFLAG
		ADRES	TRACKFLG
		
		TC	DOWNFLAG
		ADRES	UPDATFLG
		
		TC	DOWNFLAG
		ADRES	IMUSE
		
		CAF	EBANK6
		TS	EBANK
		
		INHINT
		TC	STOPRATE
		
		CAF	NEGONE
		TS	OPTIND
		
		TC	INTPRET
		CALL
			INTSTALL	# DON'T INTERRUPT INTEGRATION
		EXIT

		TC	2PHSCHNG
# Page 260
		OCT	2		# KILL GROUP 2 TO HALT P20 ACTIVITY
		OCT	1		# ALSO KILL GROUP 1
		
CLEANOUT 	INHINT
		TC	POSTJUMP
		CADR	ENEMA		# CAUSE RESTART
		
# LEMVEC	VERB 80		DESCRIPTION
#	UPDATE LEM STATE VECTOR
#		RESET VEHUPFLG TO 0

LEMVEC		TC	DOWNFLAG
		ADRES	VEHUPFLG	# VEHUPFLG DOWN INDICATES LEM
		
		TCF	GOPIN
		
# CSMVEC	VERB 81		DESCRIPTION
#	UPDATE CSM STATE VECTOR
#		SET VEHUPFLG TO 1

CSMVEC		TC	UPFLAG
		ADRES	VEHUPFLG	# VEHUPFLG UP INDICATES CM
		
		TCF	GOPIN
		
# DNEDUMP	VERB 74		DESCRIPTION
#	INITIALZE DOWN-TELEMETRY PROGRAM FOR ERASABLE MEMORY DUMP.
#
#	1.	SET EXT VERB DISPLAY BUSY FLAG.
#	2.	REPLACE CURRENT DOWNLIST WITH ERASABLE MEMORY.
#	3.	RELEASE EXT VERB DISPLAY.

		EBANK=	10
DNEDUMP		CAF	LDNDUMPI
		TS	DNTMGOTO
		TC	GOPIN

V74		EQUALS	DNEDUMP
LDNDUMPI	REMADR	DNDUMPI

# LFTFLGON	VERB 75		DESCRIPTION
#	SET LIFT-OFF FLAG
#	1.	SETUP GRRBKFLG, GUIDANCE REFERENCE RELEASE BACK-UP FLAG.
#	2.	RETURN VIA PINBRNCH

LFTFLGON	TC	UPFLAG		# VB 75 -- SET LIFTOFF FLAG BIT
		ADRES	GRRBKFLG	# BIT 5 FLAG 5
		TC	GOPIN
		
# Page 261
CHKP00H		CA	MODREG
		EXTEND
		BZF	TCQ
		TCF	ALM/END
		
EXDAPOFF	EXTEND
		DCA	IDLECADR	# SET T5 TO IDLE.
		DXCH	T5LOC
		CS	OCT60000
		MASK	FLAGWRD6	# RESET DAPBITS 1 AND 2.
		TS	FLAGWRD6
		TC	Q
		
		SBANK=	PINSUPER	# Added RSB 2009
		EBANK=	PACTOFF
IDLECADR	2CADR	T5IDLOC

# Page 262
# VERB 89	DESCRIPTION	RENDEZVOUS FINAL ATTITUDE ROUTINE (R63)
# 
# CALLED BY VERB 89 ENTER DURING P00.  PRIO 10 IS USED.  CALCULATES AND
# DISPLAYS FINAL GIMBAL ANGLES TO POINT CSM +X AXIS OR PREFERRED AXIS
# (UNIT(Z)COS55 DEG + UNIT(X)SIN55 DEG) AT LM.
#
# 1. KEY IN V 89 E ONLY IF IN PROG 00.  IF NOT IN P00, OPERATOR ERROR AND
# EXIT R63, OTHERWISE CONTINUE.
#
# 2. IF IN P00, DO IMU STATUS CHECK ROUTINE (R02BOTH).  IF IMU ON AND ITS
# ORIENTATION KNOWN TO CGC, CONTINUE.
#
# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
# BE POINTED AT LM.  INITIAL CHOICE IS PREFERRED AXIS (R2=1).
# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT = 1) BY V 22 E 2 E.  CONTINUE
# AFTER KEYING IN PROCEED.
#
# 4. SET PREFERRED ATTITUDE FLAG ACCORDING TO OPTION DESIRED.  SET FLAG
# FOR PREFERRED AXIS.  RESET FLAG FOR X AXIS.
#
# 5. CURRENT TIME IS STORED AND R63COMP IS CALLED
#
#	R63COMP JOB:
#
#		UPDATES CSM AND LM STATE VECTORS USING CONIC EQUATIONS.
#
#		CALCULATES BOTH PREFERRED AND X AXIS TRACKING ATT FROM CSM TO LM.
#
#		DESIRED GIMBAL ANGLES AS INDICATED BY PREFERRED ATTITUDE FLAG
#		ARE STORED FOR LATER R60CSM CALL.
#
# 6.  FLASH DISPLAY V 06 N18 AND AWAIT RESPONSE.
#
# 7.  RECYCLE:  RETURN TO STEP 5.
#     TERMINATE:  EXIT R63 ROUTINE
#     PROCEED:  RESET 3AXISFLG AND CALL R60CSM FOR ATTITUDE MANEUVER.

V89PERF		TC	CHKP00H		# DEMAND P00
		TC	TESTXACT
		INHINT
		CAF	PRIO10
		TC	FINDVAC
		SBANK=	LOWSUPER	# Added by RSB 2009.
		EBANK=	P21TIME
		2CADR	V89CALL
		
		TCF	ENDOFJOB
		
WMATRXNG	TC	DOWNFLAG	# RESET RENDWFLAG
		ADRES	RENDWFLG		
# Page 263
		
		TC	DOWNFLAG	# RESET ORBWFLAG
		ADRES	ORBWFLAG
		TC	GOPIN
		
GOSHOSUM	EQUALS	SHOWSUM

SHOWSUM		TC	CHKP00H
		TC	TESTXACT	# *
		CAF	S+1		# *
		TS	SKEEP6		# * SHOWSUM OPTION
		CAF	S+ZERO		# *
		TS	SMODE		# * TURN OFF SELF-CHECK
		CA	SELFADRS	# *
		TS	SELFRET		# *
		TC	STSHOSUM	# * ENTER ROPECHK

SDISPLAY	LXCH	SKEEP2		# * BNK NO FOR DSP
		LXCH	SKEEP3		# * BUGGER WORD FOR DSP
NOKILL		CA	ADRS1		# *
		TS	MPAC	+2	# *
		CA	VNCON		# * 0501
		TC	BANKCALL	# *
		CADR	GOXDSPF		# *
		TC	+3		# *
		TC	NXTBNK		# *
		TC	NOKILL		# *
		CA	SELFADRS
		TS	SKEEP1
		
		TC	ENDEXT		# *

VNCON		VN	501		# *

ENDSUMS		CA	SKEEP6		# *
		EXTEND			# *
		BZF	SELFCHK		# * ROPECHK, START SELFCHK AGAIN.
		TC	STSHOSUM	# * START SHOWSUM AGAIN.
	
		
# VB 76 --- SET PREFERRED ATTITUDE FLAG --- DRIVE TO PREFERRED.

SETPRFLG	TC	UPFLAG
		ADRES	PRFTRKAT	# BIT 10 FLAG 5
		TC	GOPIN
		
# VB 77 --- RESET PREFERRED ATTITUDE FLAG --- DRIVE TO +X-AXIS ATT.

RESETPRF	TC	DOWNFLAG
		ADRES	PRFTRKAT	# BIT 10 FLAG 5
		TC	GOPIN
		
# Page 264
# VB 87 --- SET VHF RANGE FLAG --- ALLOWS R22 TO ACCEPT RANGE DATA.

SETVHFLG	TC	INTPRET
		SET	EXIT
			VHFRFLAG
		TC	GOPIN
		
# VB 88 --- RESET VHF RANGE FLAG --- STOPS ACCEPTANCE OF RANGE DATA.

RESETVHF	TC	INTPRET
		CLEAR	EXIT
			VHFRFLAG
		TC	TRFAILOF	# TRACKER FAIL LIGHT
		
		TC	GOPIN
		
# VERB 66.	VEHICLES ARE ATTACHED. --- MOVE THIS VEHICLE STATE VECTOR TO
#		OTHER VEHICLE STATE VECTOR.

# USE SUBROUTINE GENTRAN.
		
		EBANK=	RRECTHIS
ATTACHED	CAF	PRIO10
		TC	FINDVAC
		EBANK=	RRECTHIS
		2CADR	ATTACHIT
		
		TC	ENDOFJOB
		
ATTACHIT	TC	INTPRET
		CALL
			INTSTALL
		SET	BON
			MOONOTH
			MOONTHIS
			+3
		CLEAR
			MOONOTH
		EXIT
		CAF	OCT51
		TC	GENTRAN
		ADRES	RRECTHIS	# OUR STATE VECTOR INTO OTHER VIA GENTRAN
		ADRES	RRECTOTH
		
TACHEXIT	RELINT
		TC	INTPRET
		CALL			# UPDATE RN, VN, R-OTHER, V-OTHER
			PTOACSM
# Page 265
		LXA,2	CALL
			PBODY
			SVDWN1
		CALL
			SVDWN2
		EXIT
		
		CAF	TCPINAD
		INDEX	FIXLOC
		TS	QPRET
		TC	POSTJUMP
		CADR	INTWAKE
		
TCPIN		RTB
			PINBRNCH
			
OCT51		OCT	51
TCPINAD		CADR	TCPIN

# VERB 47.  MOVE LM STATE VECTOR INTO CSM STATE VECTOR

LMTOCMSV	CAF	PRIO10
		TC	FINDVAC
		EBANK=	RRECTHIS
		2CADR	LMTOCM
		
		TC	ENDOFJOB
		
LMTOCM		TC	INTPRET
		CALL
			INTSTALL
		SET	BON
			MOONTHIS
			MOONOTH
			+3
		CLEAR
			MOONTHIS
		EXIT
		
		CAF	OCT51
		TC	GENTRAN
		ADRES	RRECTOTH	# LM STATE VECTOR INTO CM VIA GENTRAN
		ADRES	RRECTHIS
		
		TCF	TACHEXIT
		
# VERB 94 --- DO R64 VIA ENEMA TO PICK UP IN P23.

VERB94		CAF	V94FLBIT
		MASK	FLAGWRD9	# IS V94FLAG SET
# Page 266
		EXTEND
		BZF	ALM/END		# NO --- OPERATOR ERROR
		
		TC	DOWNFLAG
		ADRES	V94FLAG
		
		TC	CHECKMM		# IS IT P23
		MM	23
		TC	ALM/END		# NO -- OPERATOR ERROR
		TC	PHASCHNG
		OCT	112		# SET GROUP 2 TO DO R64
		
		TC	CLEANOUT	# CAUSE RESTART
		
# V90PERF	VERB 90		DESCRIPTION
#	REQUEST RENDEZVOUS OUT-OF-PLANE DISPLAY (R36)
#
#	1.	SET EXT VERB DISPLAY BUSY FLAG.
#	2.	SCHEDULE R36 CALL WITH PRIORITY 10
#		A.	DISPLAY
#			TIME OF EVENT -- HOURS, MINUTES, SECONDS
#			Y 	OUT-OF-PLANE POSITION -- NAUTICAL MILES
#			YDOT	OUT-OF-PLANE VELOCITY -- FEET/SECOND
#			PSI	ANGLE BTW LINE OF SIGHT AND FORWARD
#				DIRECTION VECTOR IN HORIZONTAL PLANE -- DEGREES

V90PERF		TC	TESTXACT
		CAF	PRIO7		# R36,V90
		TC	FINDVAC
		SBANK=	PINSUPER	# Added RSB 2009
		EBANK=	RPASS36
		2CADR	R36
		
		TCF	ENDOFJOB
		
# VERB 96  SET QUITFLAG TO STOP INTEGRATION

VERB96		TC	UPFLAG		# QUITFLAG WILL CAUSE INTEGRATION TO EXIT
		ADRES	QUITFLAG	# 	AT NEXT TIMESTEP
		
		TC	UPFLAG
		ADRES	V96ONFLG
		CAF	ZERO
		TC	POSTJUMP
		CADR	V37		# GO TO P00
		
		EBANK=	LANDMARK
V52		TC	CHECKMM		# IS P22 OPERATING
		MM	22
		TC	ALM/END		# NO
		CAF	LANDBANK
		TS	EBANK
		
# Page 267
		CS	PRIO7		# YES	SET BITS 12,11,10 OF LANDMARK =
		MASK	LANDMARK	#	BITS 14,13,12 OF MARKSTAT AFTER
		TS	LANDMARK	#	SUBT. THEM FROM 5 TO GET OFFSET
		CA	MARKSTAT	#	MARK NO.
		TS	SR
		CA	SR
		CA	SR
		MASK	PRIO7
		CS	A
		AD	PRIO5
		ADS	LANDMARK
		TC	GOPIN
LANDBANK	ECADR	LANDMARK

# VERB 67  ASTRONAUT DISPLAY OF W MATRIX

V67		TC	TESTXACT
		CAF	PRIO5
		TC	FINDVAC
		EBANK=	W
		2CADR	V67CALL
		
		TC	ENDOFJOB
		
# VB 44. SET SURFACE FLAG.

SETSURF		TC	UPFLAG
		ADRES	SURFFLAG
		TCF	GOPIN
		
# VB 45. RESET SURFACE FLAG

RESTSRF		TC	DOWNFLAG
		ADRES	SURFFLAG
		TCF	GOPIN
