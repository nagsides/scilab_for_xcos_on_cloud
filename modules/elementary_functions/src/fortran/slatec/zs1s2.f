*DECK ZS1S2
      SUBROUTINE ZS1S2 (ZRR, ZRI, S1R, S1I, S2R, S2I, NZ, ASCLE, ALIM,
     +   IUF)
C***BEGIN PROLOGUE  ZS1S2
C***SUBSIDIARY
C***PURPOSE  Subsidiary to ZAIRY and ZBESK
C***LIBRARY   SLATEC
C***TYPE      ALL (CS1S2-A, ZS1S2-A)
C***AUTHOR  Amos, D. E., (SNL)
C***DESCRIPTION
C
C     ZS1S2 TESTS FOR A POSSIBLE UNDERFLOW RESULTING FROM THE
C     ADDITION OF THE I AND K FUNCTIONS IN THE ANALYTIC CON-
C     TINUATION FORMULA WHERE S1=K FUNCTION AND S2=I FUNCTION.
C     ON KODE=1 THE I AND K FUNCTIONS ARE DIFFERENT ORDERS OF
C     MAGNITUDE, BUT FOR KODE=2 THEY CAN BE OF THE SAME ORDER
C     OF MAGNITUDE AND THE MAXIMUM MUST BE AT LEAST ONE
C     PRECISION ABOVE THE UNDERFLOW LIMIT.
C
C***SEE ALSO  ZAIRY, ZBESK
C***ROUTINES CALLED  ZABS, ZEXP, ZLOG
C***REVISION HISTORY  (YYMMDD)
C   830501  DATE WRITTEN
C   910415  Prologue converted to Version 4.0 format.  (BAB)
C   930122  Added ZEXP and ZLOG to EXTERNAL statement.  (RWC)
C***END PROLOGUE  ZS1S2
C     COMPLEX CZERO,C1,S1,S1D,S2,ZR
      DOUBLE PRECISION AA, ALIM, ALN, ASCLE, AS1, AS2, C1I, C1R, S1DI,
     * S1DR, S1I, S1R, S2I, S2R, ZEROI, ZEROR, ZRI, ZRR, ZABS
      INTEGER IUF, IDUM, NZ
      EXTERNAL ZABS, ZEXP, ZLOG
      DATA ZEROR,ZEROI  / 0.0D0 , 0.0D0 /
C***FIRST EXECUTABLE STATEMENT  ZS1S2
      NZ = 0
      AS1 = ZABS(S1R,S1I)
      AS2 = ZABS(S2R,S2I)
      IF (S1R.EQ.0.0D0 .AND. S1I.EQ.0.0D0) GO TO 10
      IF (AS1.EQ.0.0D0) GO TO 10
      ALN = -ZRR - ZRR + LOG(AS1)
      S1DR = S1R
      S1DI = S1I
      S1R = ZEROR
      S1I = ZEROI
      AS1 = ZEROR
      IF (ALN.LT.(-ALIM)) GO TO 10
      CALL ZLOG(S1DR, S1DI, C1R, C1I, IDUM)
      C1R = C1R - ZRR - ZRR
      C1I = C1I - ZRI - ZRI
      CALL ZEXP(C1R, C1I, S1R, S1I)
      AS1 = ZABS(S1R,S1I)
      IUF = IUF + 1
   10 CONTINUE
      AA = MAX(AS1,AS2)
      IF (AA.GT.ASCLE) RETURN
      S1R = ZEROR
      S1I = ZEROI
      S2R = ZEROR
      S2I = ZEROI
      NZ = 1
      IUF = 0
      RETURN
      END