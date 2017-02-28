      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Projet.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT fdvd ASSIGN TO "fdvd.dat"
           ORGANIZATION INDEXED
           ACCESS IS DYNAMIC
           RECORD KEY fdvd_id
           ALTERNATE RECORD KEY fdvd_titre WITH DUPLICATES
           ALTERNATE RECORD KEY fdvd_genre WITH DUPLICATES
           FILE STATUS IS fdvd_stat.

           SELECT fclients ASSIGN TO "fclients.dat"
           ORGANIZATION INDEXED
           ACCESS IS DYNAMIC
           RECORD KEY fclt_id
           FILE STATUS IS fclt_stat.

       DATA DIVISION.
       FILE SECTION.
           FD fdvd.
           01 dvdTampon.
               02 fdvd_id PIC 9(10).
               02 fdvd_titre PIC A.
               02 fdvd_real PIC A.
               02 fdvd_genre PIC A.
               02 fdvd_louable PIC 9(2).
               02 fdvd_prix PIC 9.

           FD fclients.
           01 cltTampon.
               02 fclt_id PIC 9(10).
               02 fclt_nom PIC A.
               02 fclt_prenom PIC A.
               02 fclt_mail PIC A.


       WORKING-STORAGE SECTION.
           77 fdvd_stat PIC 9(2).
           77 fclt_stat PIC 9(2).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM Projet.
