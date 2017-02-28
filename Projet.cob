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

           77 Wrep PIC 9.
           77 Wmenu PIC 9.
           77 Wgre PIC A.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN I-O fdvd
           IF fdvd_stat =35 THEN
           OPEN OUTPUT fdvd
           CLOSE fdvd
           OPEN I-O fdvd
           END-IF

           PERFORM MENU

           CLOSE fdvd
           STOP RUN.
      ******************************************************************
      ******************************************************************
      ******************************************************************
       MENU.
       PERFORM WITH TEST AFTER UNTIL Wmenu = 0
           DISPLAY "1-Ajout DVD"
           DISPLAY "0-Quitter"
           ACCEPT Wmenu
           EVALUATE Wmenu
           WHEN 0
           MOVE 0 TO Wmenu
           WHEN 1
           PERFORM AJOUT_DVD
       END-PERFORM.
      *>-------------------------------------------debut_partie_matthieu
      ******************************************************************
      ******************************************************************
      ******************************************************************
       AJOUT_DVD.
       PERFORM WITH TEST AFTER UNTIL Wrep = 0
           DISPLAY "Donnez les informations du DVD : "
           DISPLAY "Donnez l'identifiant : "
           ACCEPT fdvd_id
           DISPLAY "Donnez le nom : "
           ACCEPT fdvd_titre
           DISPLAY "Donnez le réalisateur : "
           ACCEPT fdvd_real
           DISPLAY "Donnez le genre : "
           ACCEPT fdvd_genre
           DISPLAY "par défaut la disponibilité est 1, louable"
           MOVE 1 TO fdvd_louable
           DISPLAY "Donnez le prix : "
           ACCEPT fdvd_prix
           WRITE dvdTampon END-WRITE
           PERFORM WITH TEST AFTER UNTIL Wrep = 0 OR Wrep = 1
               DISPLAY "Souhaitez vous continuer? Oui= 1 ou Non = 0"
               ACCEPT Wrep
           END-PERFORM
       END-PERFORM.
      ******************************************************************
      ******************************************************************
      ******************************************************************
       RECHERCHE_DVD.
           MOVE Wgre TO fbu_ville
           START fbureau
               KEY = fbu_ville
           INVALID KEY
               DISPLAY "Pas de bureau !!!"
           NOT INVALID KEY
               PERFORM

               END-PERFORM
           END-START.
      ******************************************************************
      ******************************************************************
      ******************************************************************
      *>---------------------------------------------fin_partie_matthieu
       END PROGRAM Projet.
